# Smtp sends a message only after the engineer confirms it

Source: system/smtp/source/smtp-sends-a-message-only-after-the-engineer-confirms-it.md

Trigger: When the engineer asks for an email to be sent, as with `/smtp send`

**Trigger:** When the engineer asks for an email to be sent, as with `/smtp send`

**`/smtp send <name> <message-file>` sends the message in the file through the account with that name.** The account is the Keychain item the `imap` package stores, so one credential serves the fetch and the send. The act is the package's `send.py`, run from the project root: `slasher/system/smtp/send.py <name> <message-file>`, or `system/smtp/send.py` where the project has no `slasher/` directory. Where the name or the file is missing, ask for it through the free-text option.

**Every send waits for the engineer's confirmation.** Before running `send.py`, read the message file and show the account's name and the message's From, To, Cc, Bcc, and Subject lines, and the first lines of its body. Where the file has no From line, show the account's login as the From, as the send adds it. Then ask through the selection interface, with the options *Send* and *Do not send*. Run `send.py` only on *Send*. A confirmation covers one message, once. A message sent again is confirmed again, and unattended work does not skip the confirmation.

**Report the result as the script prints it.** It names the recipients and the SMTP host. Where the script fails, report its message, and do not run it again on your own.

**A credential never passes through the chat.** The `imap` package's email-fetches-the-accounts-named-and-lists-them-without-credentials rule holds here too. The agent does not ask for a credential, read one aloud, or print one. Where the engineer asks to store one, give them the `credential.sh write` command to run in their own terminal.

**Why:** a message sent cannot be taken back, and it reaches people outside the project. Receiving changes only the project's own files. That difference is why sending is a package of its own, and why each send waits for the engineer, even where the agent works unattended.

**How to apply:** on `/smtp send`, read the message file, show its account and headers, and ask *Send* or *Do not send*. On *Send*, run `send.py` from the project root, and report what it printed.
