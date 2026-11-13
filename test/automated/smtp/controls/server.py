#!/usr/bin/env python3
# An SMTP server for the tests. It accepts one login, by AUTH PLAIN or AUTH
# LOGIN, and writes what it receives to the directory given: the sender to
# sender, the recipients to recipients, one to a line, and the message to
# message.eml.
#
# Usage:
#
#   test/automated/smtp/controls/server.py <port> <user> <password> <directory>
#
# It serves one connection at a time, in plain text, on 127.0.0.1, until
# it is stopped. It answers only the commands the send sends.

import base64
import os
import socketserver
import sys

port = int(sys.argv[1])
user = sys.argv[2]
password = sys.argv[3]
directory = sys.argv[4]


def write(name, data):
    with open(os.path.join(directory, name), "wb") as file:
        file.write(data)


class Session(socketserver.StreamRequestHandler):
    def send(self, line):
        self.wfile.write((line + "\r\n").encode())

    def read(self):
        return self.rfile.readline().decode().rstrip("\r\n")

    def handle(self):
        authenticated = False
        sender = ""
        recipients = []
        self.send("220 test server ready")
        while True:
            line = self.read()
            if not line and self.rfile.closed:
                return
            command = line.split(" ", 1)[0].upper()
            argument = line[len(command) + 1:]
            if command in ("EHLO", "HELO"):
                self.send("250-test server")
                self.send("250 AUTH PLAIN LOGIN")
            elif command == "AUTH":
                mechanism, _, initial = argument.partition(" ")
                if mechanism.upper() == "PLAIN":
                    if not initial:
                        self.send("334 ")
                        initial = self.read()
                    _, login, secret = base64.b64decode(initial).decode().split("\0")
                else:
                    self.send("334 " + base64.b64encode(b"Username:").decode())
                    login = base64.b64decode(self.read()).decode()
                    self.send("334 " + base64.b64encode(b"Password:").decode())
                    secret = base64.b64decode(self.read()).decode()
                authenticated = login == user and secret == password
                self.send("235 accepted" if authenticated else "535 refused")
            elif command == "MAIL":
                if not authenticated:
                    self.send("530 authentication required")
                    continue
                sender = argument.split(":", 1)[1].split()[0].strip("<>")
                self.send("250 ok")
            elif command == "RCPT":
                recipients.append(argument.split(":", 1)[1].split()[0].strip("<>"))
                self.send("250 ok")
            elif command == "DATA":
                self.send("354 end with a dot")
                lines = []
                while True:
                    data = self.rfile.readline()
                    if data in (b".\r\n", b".\n", b""):
                        break
                    if data.startswith(b".."):
                        data = data[1:]
                    lines.append(data)
                write("sender", sender.encode())
                write("recipients", "\n".join(recipients).encode())
                write("message.eml", b"".join(lines))
                self.send("250 accepted")
            elif command == "QUIT":
                self.send("221 bye")
                return
            elif command == "":
                return
            else:
                self.send("250 ok")


class Server(socketserver.TCPServer):
    allow_reuse_address = True


Server(("127.0.0.1", port), Session).serve_forever()
