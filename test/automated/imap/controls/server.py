#!/usr/bin/env python3
# An IMAP server for the tests: one folder, INBOX by default, holding the
# messages given, with UIDs from 1 in the order given. --folder names
# another folder for them, and INBOX is then empty. --sent marks that folder
# as sent mail. It accepts one login.
#
# Usage:
#
#   test/automated/imap/controls/server.py <port> <user> <password> [--folder <folder> [--sent]] <message.eml>...
#   test/automated/imap/controls/server.py <port> --login <user> <password> [--login <user> <password>]... [--folder <folder> [--sent]] <message.eml>...
#
# With --login, it accepts each login given, and serves the same messages to each.
#
# It serves one connection at a time, in plain text, on 127.0.0.1, until
# it is stopped. It answers only the commands the fetch sends.

import re
import socketserver
import sys

port = int(sys.argv[1])
arguments = sys.argv[2:]
logins = {}
if arguments[:1] == ["--login"]:
    while arguments[:1] == ["--login"]:
        logins[arguments[1]] = arguments[2]
        arguments = arguments[3:]
else:
    logins[arguments[0]] = arguments[1]
    arguments = arguments[2:]
paths = arguments
folder = "INBOX"
if paths[:1] == ["--folder"]:
    folder = paths[1]
    paths = paths[2:]
sent = paths[:1] == ["--sent"]
if sent:
    paths = paths[1:]
messages = [open(path, "rb").read() for path in paths]
selected = []


def quoted(argument):
    argument = argument.strip()
    if argument.startswith('"') and argument.endswith('"'):
        return argument[1:-1]
    return argument


class Session(socketserver.StreamRequestHandler):
    def send(self, data):
        if isinstance(data, str):
            data = data.encode()
        self.wfile.write(data)

    def handle(self):
        self.send("* OK test server ready\r\n")
        while True:
            line = self.rfile.readline()
            if not line:
                return
            tag, _, rest = line.decode().rstrip("\r\n").partition(" ")
            command, _, arguments = rest.partition(" ")
            command = command.upper()

            if command == "CAPABILITY":
                self.send("* CAPABILITY IMAP4rev1\r\n")
                self.send(f"{tag} OK CAPABILITY completed\r\n")
            elif command == "LOGIN":
                given_user, _, given_password = arguments.partition(" ")
                if logins.get(quoted(given_user)) == quoted(given_password):
                    self.send(f"{tag} OK LOGIN completed\r\n")
                else:
                    self.send(f"{tag} NO LOGIN failed\r\n")
            elif command == "LIST":
                self.send('* LIST (\\HasNoChildren) "/" INBOX\r\n')
                if folder != "INBOX":
                    attributes = "\\HasNoChildren \\Sent" if sent else "\\HasNoChildren"
                    self.send(f'* LIST ({attributes}) "/" "{folder}"\r\n')
                self.send(f"{tag} OK LIST completed\r\n")
            elif command in ("SELECT", "EXAMINE"):
                selected[:] = messages if quoted(arguments) == folder else []
                self.send(f"* {len(selected)} EXISTS\r\n")
                self.send("* OK [UIDVALIDITY 1] UIDs valid\r\n")
                self.send(f"{tag} OK [READ-ONLY] {command} completed\r\n")
            elif command == "UID":
                subcommand, _, uid_arguments = arguments.partition(" ")
                subcommand = subcommand.upper()
                if subcommand == "SEARCH":
                    uids = " ".join(str(uid) for uid in range(1, len(selected) + 1))
                    self.send(f"* SEARCH {uids}\r\n")
                    self.send(f"{tag} OK SEARCH completed\r\n")
                elif subcommand == "FETCH":
                    uid = int(re.match(r"\d+", uid_arguments).group())
                    message = selected[uid - 1]
                    self.send(f"* {uid} FETCH (UID {uid} RFC822 {{{len(message)}}}\r\n")
                    self.send(message)
                    self.send(")\r\n")
                    self.send(f"{tag} OK FETCH completed\r\n")
                else:
                    self.send(f"{tag} BAD unknown UID command\r\n")
            elif command == "LOGOUT":
                self.send("* BYE test server logging out\r\n")
                self.send(f"{tag} OK LOGOUT completed\r\n")
                return
            else:
                self.send(f"{tag} BAD unknown command\r\n")


socketserver.TCPServer.allow_reuse_address = True
with socketserver.TCPServer(("127.0.0.1", port), Session) as server:
    server.serve_forever()
