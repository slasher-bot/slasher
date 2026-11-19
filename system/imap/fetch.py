#!/usr/bin/env python3
# Usage:
#
#   slasher/system/imap/fetch.py [<name>|<host>]
#
# Fetches the IMAP accounts the project lists into the project. The project
# lists them in email/slasher-email.toml in its local directory, or in the
# private store, under ~/.local/share/slasher/email/<project>/, one
# [[account]] table to each, named as its credential is in the Keychain, or
# <host>/<login> for an account with no name. With no argument, every listed
# account with a stored credential is fetched, and a listed account with none
# is reported. With <name>, only the listed account of that name is fetched,
# and with <host>, each listed account on that host. A project with no list
# fetches nothing, and an account the list does not name is never fetched.
#
# An account's messages go under slasher/local/email/<name>/, or
# slasher/local/email/<host>/<login>/ for one with no name. Where its
# [account.imap] table lists folders, those folders are fetched, each into
# its local folder. One whose table says store = "private" has the messages
# written to the private store, out of the repository. One that says
# store = "project", or has no store line, has them written into the project.
# Any other store is refused, and that account is not fetched. Where no folder
# is listed, the inbox goes to INBOX/, and the folder the server marks as sent
# mail goes to Sent/.
#
# Each message is one text file, its headers then its body, named with the
# message's date as an ISO-8601-UTC prefix, its UID, and its subject. Its
# attachments are files beside it. A message whose UID is already in a file
# name in the folder is not fetched again.
#
# The host and the login are read from the Keychain item. IMAP_KEYCHAIN
# names a keychain file in place of the login keychain. IMAP_PORT names a
# port in place of 993, and IMAP_TLS=no connects without TLS, on 143 where
# no port is named. Use sites leave the three unset.

import sys

if sys.version_info < (3, 11):
    sys.exit("fetch.py needs Python 3.11 or later, and this is Python "
             + ".".join(str(part) for part in sys.version_info[:3]) + ".")

import email
import email.utils
import html
import imaplib
import os
import re
import ssl
import subprocess
from datetime import datetime, timezone
from email.header import decode_header, make_header

sys.dont_write_bytecode = True
import email_configuration


def keychain_arguments():
    keychain = os.environ.get("IMAP_KEYCHAIN")
    return [keychain] if keychain else []


def keychain_items():
    """Each password item in the keychain, as its label, host, and login.
    The listing shows no credential."""
    output = subprocess.run(
        ["security", "dump-keychain", *keychain_arguments()],
        capture_output=True, text=True, check=True,
    ).stdout
    items = []
    for block in output.split("keychain: ")[1:]:
        if 'class: "genp"' not in block:
            continue
        def attribute(pattern):
            match = re.search(pattern + r'<blob>="(.*)"', block)
            return match.group(1) if match else None
        host = attribute(r'"svce"')
        user = attribute(r'"acct"')
        if host and user:
            # The Keychain names an item after its host where it is given no
            # name, so a name equal to the host is taken as none.
            label = attribute(r"0x00000007 ")
            if label == host:
                label = None
            items.append({"label": label, "host": host, "user": user, "kind": attribute(r'"desc"')})
    return items


def name(item):
    """The name an account is listed by: its credential's name, or
    <host>/<login> where it has none."""
    return item["label"] or os.path.join(item["host"], item["user"])


def accounts(listed, argument=None):
    """The listed accounts the argument names, with a stored credential: the
    one with that name, or every one whose host it is. With no argument,
    every listed account with a stored credential."""
    stored = [item for item in keychain_items() if item["kind"] == "imap" and name(item) in listed]
    if argument is None:
        return stored
    named = [item for item in stored if name(item) == argument]
    return named or [item for item in stored if item["host"] == argument]


def read_credential(account):
    if account["label"]:
        credential_script = os.path.join(os.path.dirname(os.path.abspath(__file__)), "credential.sh")
        command = [credential_script, "read", "--name", account["label"]]
    else:
        command = ["security", "find-generic-password", "-s", account["host"], "-a", account["user"], "-w", *keychain_arguments()]
    return subprocess.run(command, capture_output=True, text=True, check=True).stdout.rstrip("\n")


def connect(host):
    tls = os.environ.get("IMAP_TLS", "yes") != "no"
    port = int(os.environ.get("IMAP_PORT") or (993 if tls else 143))
    if tls:
        return imaplib.IMAP4_SSL(host, port, ssl_context=ssl.create_default_context())
    return imaplib.IMAP4(host, port)


def sent(imap):
    """The folder the server marks as sent mail, as a one-item list, or an
    empty list where it marks none."""
    status, lines = imap.list()
    for line in lines or []:
        line = line.decode() if isinstance(line, bytes) else str(line)
        match = re.match(r'\((?P<attributes>[^)]*)\) (?:"[^"]*"|NIL) (?P<folder>.+)$', line)
        if match and "\\Sent" in match.group("attributes"):
            return [(match.group("folder").strip().strip('"'), "Sent")]
    return []


STORES = ("project", "private")


class UnknownStore(Exception):
    pass


def mailbox(account):
    """The [account.imap] table of the account in the project's email
    configuration, and the folder its messages go to. Where the table says store = "private", the messages
    go to the private store. Where it says store = "project", or has no store
    line, or there is no configuration, they go to the project. Any other
    store is refused."""
    folder = name(account)
    configuration = email_configuration.configuration(folder) or {}
    imap = configuration.get("imap", {})
    store = imap.get("store", "project")
    if store not in STORES:
        raise UnknownStore(f'{folder}: store "{store}" is not "project" or "private"')
    if store == "private":
        return imap, email_configuration.private_folder(folder)
    return imap, email_configuration.project_folder(folder)


def folders(imap, listing):
    """The folders to fetch, each with the local folder it goes to: the ones
    the [imap] table lists, or the inbox and the sent mail where it lists
    none."""
    if not listing.get("folder"):
        return [("INBOX", "INBOX"), *sent(imap)]
    found = []
    for folder in listing["folder"]:
        source = folder["source"]
        if source == "inbox":
            found.append(("INBOX", folder["local"]))
        elif source == "sent":
            found += [(sent_folder, folder["local"]) for sent_folder, _ in sent(imap)]
        else:
            found.append((source, folder["local"]))
    return found


def decoded(value):
    if value is None:
        return ""
    try:
        return str(make_header(decode_header(value)))
    except Exception:
        return str(value)


def name_part(text, length=60):
    """Lower case, with each run of other characters a single dash."""
    text = re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")
    return text[:length].strip("-") or "no-subject"


def prefix(message):
    try:
        date = email.utils.parsedate_to_datetime(message.get("Date"))
        if date.tzinfo is None:
            date = date.replace(tzinfo=timezone.utc)
    except Exception:
        date = datetime.now(timezone.utc)
    return date.astimezone(timezone.utc).strftime("%Y-%m-%dT%H-%M-%SZ")


def plain_text(markup):
    markup = re.sub(r"<(script|style)[^>]*>.*?</\1>", "", markup, flags=re.DOTALL | re.IGNORECASE)
    markup = re.sub(r"<(br|p|div|tr|li|h[1-6])\b[^>]*>", "\n", markup, flags=re.IGNORECASE)
    markup = re.sub(r"<[^>]+>", "", markup)
    return re.sub(r"\n{3,}", "\n\n", html.unescape(markup)).strip()


def body(message):
    parts = message.walk() if message.is_multipart() else [message]
    text = markup = None
    for part in parts:
        if "attachment" in str(part.get("Content-Disposition") or ""):
            continue
        content_type = part.get_content_type()
        if content_type not in ("text/plain", "text/html"):
            continue
        payload = part.get_payload(decode=True) or b""
        content = payload.decode(part.get_content_charset() or "utf-8", errors="replace")
        if content_type == "text/plain" and text is None:
            text = content.strip()
        elif content_type == "text/html" and markup is None:
            markup = content
    if text is not None:
        return text
    if markup is not None:
        return plain_text(markup)
    return ""


def message_text(uid, message):
    lines = []
    for header in ("Date", "From", "To", "CC", "Subject", "Reply-To"):
        value = decoded(message.get(header))
        if value:
            lines.append(f"{header}: {value}")
    return "\n".join([f"UID: {uid}", *lines, "", "-" * 72, "", body(message)]) + "\n"


def fetched_uids(directory):
    uids = set()
    for file_name in os.listdir(directory):
        match = re.match(r"\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2}Z-(\d+)-", file_name)
        if match:
            uids.add(match.group(1))
    return uids


def fetch(imap, folder, directory):
    os.makedirs(directory, exist_ok=True)
    status, _ = imap.select('"' + folder.replace('"', '\\"') + '"', readonly=True)
    if status != "OK":
        print(f"{folder}: could not be selected", file=sys.stderr)
        return 0
    status, data = imap.uid("search", None, "ALL")
    uids = data[0].decode().split() if data and data[0] else []
    done = fetched_uids(directory)
    fetched = 0
    for uid in uids:
        if uid in done:
            continue
        status, data = imap.uid("fetch", uid, "(RFC822)")
        if status != "OK" or not data or not isinstance(data[0], tuple):
            print(f"{folder}: UID {uid} could not be fetched", file=sys.stderr)
            continue
        message = email.message_from_bytes(data[0][1])
        start = f"{prefix(message)}-{uid}-"
        with open(os.path.join(directory, f"{start}{name_part(decoded(message.get('Subject')))}.txt"), "w", encoding="utf-8") as file:
            file.write(message_text(uid, message))
        for part in message.walk():
            if "attachment" not in str(part.get("Content-Disposition") or ""):
                continue
            attachment = decoded(part.get_filename() or "attachment")
            stem, extension = os.path.splitext(attachment)
            extension = re.sub(r"[^A-Za-z0-9.]", "", extension).lower()
            payload = part.get_payload(decode=True)
            if payload:
                with open(os.path.join(directory, f"{start}{name_part(stem)}{extension}"), "wb") as file:
                    file.write(payload)
        fetched += 1
    return fetched


def fetch_account(account):
    listing, destination = mailbox(account)
    imap = connect(account["host"])
    imap.login(account["user"], read_credential(account))
    try:
        for folder, local_folder in folders(imap, listing):
            count = fetch(imap, folder, os.path.join(destination, local_folder))
            print(f"{account['label'] or account['user']} {local_folder}: {count} fetched")
    finally:
        imap.logout()


def main():
    if len(sys.argv) > 2:
        print("Usage: slasher/system/imap/fetch.py [<name>|<host>]", file=sys.stderr)
        return 2
    argument = sys.argv[1] if len(sys.argv) == 2 else None
    listed = email_configuration.accounts()
    if listed is None:
        print(email_configuration.NO_LIST, file=sys.stderr)
        return 1
    found = accounts(listed, argument)
    if argument is None:
        stored = {name(account) for account in found}
        for missing in listed:
            if missing not in stored:
                print(f"No credential is stored for the listed account {missing}", file=sys.stderr)
    if not found:
        if argument is None:
            print("No listed account has a stored credential", file=sys.stderr)
        else:
            print(f"No listed account is named {argument}, or has it as its host", file=sys.stderr)
        return 1
    status = 0
    for account in found:
        try:
            fetch_account(account)
        except UnknownStore as error:
            print(error, file=sys.stderr)
            status = 1
    return status


if __name__ == "__main__":
    sys.exit(main())
