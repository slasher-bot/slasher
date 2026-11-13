# Slasher — smtp

Email sent through an SMTP account, with its credential read from the macOS Keychain, where the `imap` package keeps it.

- **A message is sent by its account's name** (`send.py`). `send.py <name> <message-file>` reads the host and the login stored on the Keychain item with that name, and the credential with the `imap` package's `credential.sh`. One Keychain item serves both the fetch and the send.
- **The SMTP host comes from the account's IMAP host.** A leading `imap.` is replaced by `smtp.`, so `imap.gmail.com` gives `smtp.gmail.com`. Any other host is used as it is. The send connects with TLS on port 465.
- **A message file holds headers, then a blank line, then the body**, as a fetched message does. A line of dashes at the start of the body, as a fetched message has, is left out. The message goes to every To, Cc, and Bcc recipient, from the login. A From header with the login is added where the file has none, and the Bcc header is left out of the message sent.

```
To: someone@example.com
Subject: The receipt for your order

Your order is paid, and your receipt is attached.
```

**The `/smtp` command sends a message, and the engineer confirms every send** (`smtp-sends-a-message-only-after-the-engineer-confirms-it`). `/smtp send <name> <message-file>` shows the message's account and headers, and sends it only when the engineer selects *Send*. Unattended work does not skip the confirmation. A credential is stored by the engineer in their own terminal, never through the chat.

**Sending is a package of its own, apart from `imap`.** A message sent cannot be taken back, and it reaches people outside the project, where a fetch changes only the project's own files. A project that only reads its mail installs `imap` alone.

**It needs macOS and Python 3.11 or later.** The Keychain is reached with macOS's `security` command, and the send is Python on its standard library. A Gmail account is reached with an app password, the same one its IMAP fetch uses.

**It is not in the default package set.** A project that sends email installs it by name, with `imap`, as in `sh slasher-install default imap smtp`.

Includes `imap`.

```
smtp  →  imap
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `slasher/system/` tree, committed alongside your code:

```
git subtree add  --prefix slasher/system/smtp git@github.com:slasher-bot/smtp.git master --squash
git subtree pull --prefix slasher/system/smtp git@github.com:slasher-bot/smtp.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/slasher-bot/smtp.git` in place of the address above. A script takes `SLASHER_ORIGIN=https://github.com/slasher-bot` for the same reason.

Then install its dependency, `imap`, with `slasher/system/smtp/install-dependencies.sh`.

## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 12:24:21 AM PT
