#!/usr/bin/env python3
# Usage:
#
#   slasher/system/imap/list.py
#
# Lists the IMAP accounts stored in the Keychain with credential.sh, one to a
# line: the account's name, its host, and its login, separated by tabs, sorted
# by name. An account with no name prints an empty name. No credential is read
# or printed. IMAP_KEYCHAIN names a keychain file in place of the login
# keychain.

import os
import sys

# Importing fetch.py writes no compiled copy beside it, in the project.
sys.dont_write_bytecode = True
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from fetch import keychain_items  # noqa: E402


def main():
    accounts = [item for item in keychain_items() if item["kind"] == "imap"]
    for account in sorted(accounts, key=lambda a: (a["label"] or "", a["host"], a["user"])):
        print("\t".join([account["label"] or "", account["host"], account["user"]]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
