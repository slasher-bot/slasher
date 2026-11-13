#!/usr/bin/env python3
# Usage:
#
#   slasher/system/smtp/send.py <name> <message-file>
#
# Sends the message in <message-file> through the account whose credential
# is stored in the Keychain under <name>, the credential the imap package
# stores and fetches with. The message file holds headers, then a blank
# line, then the body, as a fetched message does. A line of dashes at the
# start of the body, as a fetched message has, is left out.
#
# The login is read from the Keychain item, and the credential with the
# imap package's credential.sh. The SMTP host is the item's host with a
# leading imap. replaced by smtp., as imap.example.com gives
# smtp.example.com. Any other host is used as it is.
#
# The message goes to every To, Cc, and Bcc recipient, from the login. A
# From header with the login is added where the file has none. The Bcc
# header is left out of the message sent.
#
# IMAP_KEYCHAIN names a keychain file in place of the login keychain.
# SMTP_PORT names a port in place of 465, and SMTP_TLS=no connects without
# TLS. Use sites leave them unset.

import sys

if sys.version_info < (3, 11):
    sys.exit("send.py needs Python 3.11 or later, and this is Python "
             + ".".join(str(part) for part in sys.version_info[:3]) + ".")

import email
import email.policy
import email.utils
import os
import re
import smtplib
import socket
import ssl
import subprocess


def keychain_arguments():
    keychain = os.environ.get("IMAP_KEYCHAIN")
    return [keychain] if keychain else []


def account(name):
    """The host and the login of the Keychain item with the name given. The
    lookup prints no credential."""
    result = subprocess.run(
        ["security", "find-generic-password", "-l", name, *keychain_arguments()],
        capture_output=True, text=True,
    )
    if result.returncode != 0:
        sys.exit(f"No credential is stored under the name {name}.")

    def attribute(key):
        match = re.search(rf'"{key}"<blob>="(.*)"', result.stdout)
        return match.group(1) if match else None

    return attribute("svce"), attribute("acct")


def credential(name):
    script = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "imap", "credential.sh")
    return subprocess.run(
        [script, "read", "--name", name],
        capture_output=True, text=True, check=True,
    ).stdout.rstrip("\n")


def smtp_host(imap_host):
    if imap_host.startswith("imap."):
        return "smtp." + imap_host[len("imap."):]
    return imap_host


def message(path, login):
    with open(path, "rb") as file:
        content = file.read()
    headers, separator, body = content.partition(b"\n\n")
    body = re.sub(rb"\A-+\n\n?", b"", body)
    parsed = email.message_from_bytes(headers + separator + body, policy=email.policy.SMTP)
    if parsed["From"] is None:
        parsed["From"] = login
    return parsed


def recipients(parsed):
    fields = parsed.get_all("To", []) + parsed.get_all("Cc", []) + parsed.get_all("Bcc", [])
    return [address for _, address in email.utils.getaddresses(fields) if address]


def connection(host):
    port = int(os.environ.get("SMTP_PORT", "465"))
    try:
        if os.environ.get("SMTP_TLS") == "no":
            return smtplib.SMTP(host, port, timeout=30)
        return smtplib.SMTP_SSL(host, port, timeout=30, context=ssl.create_default_context())
    except (socket.gaierror, ConnectionError, TimeoutError, OSError):
        sys.exit(f"The SMTP host {host}, port {port}, could not be reached.")


def main():
    if len(sys.argv) != 3:
        sys.exit("Usage: send.py <name> <message-file>")
    name, path = sys.argv[1], sys.argv[2]

    imap_host, login = account(name)
    parsed = message(path, login)
    to = recipients(parsed)
    if not to:
        sys.exit(f"The message in {path} names no recipient in its To, Cc, or Bcc headers.")
    del parsed["Bcc"]

    host = smtp_host(imap_host)
    with connection(host) as server:
        server.login(login, credential(name))
        server.send_message(parsed, from_addr=login, to_addrs=to)

    print(f"Sent to {', '.join(to)}, through {host}.")


main()
