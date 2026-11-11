#!/usr/bin/env python3
# Usage:
#
#   slasher/system/imap/fetch.py <name>
#
# Fetches the IMAP mailbox whose credential is stored in the Keychain under
# <name> into the project, under slasher/local/email/<name>/. Where that
# folder holds a fetch.toml, the folders it lists are fetched, each into its
# local folder. A fetch.toml may instead be in the private store, under
# ~/.local/share/slasher/email/<project>/<name>/, and one that says
# store = "private" has the messages written there, out of the repository. Otherwise the inbox goes to INBOX/, and the folder the server
# marks as sent mail goes to Sent/.
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

import email
import email.utils
import html
import imaplib
import os
import re
import ssl
import subprocess
import sys
import tomllib
from datetime import datetime, timezone
from email.header import decode_header, make_header


def keychain_arguments():
    keychain = os.environ.get("IMAP_KEYCHAIN")
    return [keychain] if keychain else []


def item_attributes(name):
    """The host and the login stored on the Keychain item named <name>."""
    output = subprocess.run(
        ["security", "find-generic-password", "-l", name, *keychain_arguments()],
        capture_output=True, text=True, check=True,
    ).stdout
    host = re.search(r'"svce"<blob>="(.*)"', output).group(1)
    user = re.search(r'"acct"<blob>="(.*)"', output).group(1)
    return host, user


def read_credential(name):
    credential_script = os.path.join(os.path.dirname(os.path.abspath(__file__)), "credential.sh")
    return subprocess.run(
        [credential_script, "read", "--name", name],
        capture_output=True, text=True, check=True,
    ).stdout.rstrip("\n")


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


def fetch_file(directory):
    """The fetch file in a mailbox's folder, read as TOML, or None where
    the folder holds none."""
    path = os.path.join(directory, "fetch.toml")
    if not os.path.isfile(path):
        return None
    with open(path, "rb") as file:
        return tomllib.load(file)


def mailbox(local, name):
    """The mailbox's fetch file, and the folder its messages go to. The
    fetch file is looked for in the project, then in the private store. Where
    it says store = "private", the messages go to the private store, under
    the project folder's name."""
    in_project = os.path.join(local, "email", name)
    in_private = os.path.join(
        os.environ["HOME"], ".local", "share", "slasher", "email",
        os.path.basename(os.getcwd()), name,
    )
    for directory in (in_project, in_private):
        listing = fetch_file(directory)
        if listing is not None:
            return listing, in_private if listing.get("store") == "private" else in_project
    return None, in_project


def folders(imap, listing):
    """The folders to fetch, each with the local folder it goes to: the ones
    the fetch file lists, or the inbox and the sent mail where it has none."""
    if listing is None:
        return [("INBOX", "INBOX"), *sent(imap)]
    found = []
    for folder in listing.get("folder", []):
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


def main():
    if len(sys.argv) != 2:
        print("Usage: slasher/system/imap/fetch.py <name>", file=sys.stderr)
        return 2
    name = sys.argv[1]
    local = "slasher/local" if os.path.isdir("slasher/local") else "local"
    host, user = item_attributes(name)
    imap = connect(host)
    imap.login(user, read_credential(name))
    try:
        listing, destination = mailbox(local, name)
        for folder, local_folder in folders(imap, listing):
            count = fetch(imap, folder, os.path.join(destination, local_folder))
            print(f"{local_folder}: {count} fetched")
    finally:
        imap.logout()
    return 0


if __name__ == "__main__":
    sys.exit(main())
