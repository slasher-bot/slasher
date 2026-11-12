# Slasher — imap

Email fetched from an IMAP mailbox into the project, with each mailbox's credential kept in the macOS Keychain.

- **A credential is stored in the Keychain and read back by its host or its name** (`credential.sh`). `credential.sh write <host> <user> [--name <name>]` stores the credential given on standard input, replacing one already stored. `credential.sh read <host>` and `credential.sh read --name <name>` print it. The host is the Keychain item's service, the login its account, and the name its label. Nothing asks for a password once macOS allows the `security` command to read the item.
- **A mailbox is fetched by its credential's name, by its host, or with every account** (`fetch.py`). `fetch.py <name>` logs in with the host and login stored on the Keychain item, and fetches the inbox and the folder the server marks as sent mail into `slasher/local/email/<name>/INBOX/` and `Sent/`.
- **Each message is one text file**: its headers, then its body, named with the message's date as an ISO-8601-UTC prefix, its UID, and its subject, as in `2026-11-10T22-03-00Z-1042-some-subject.txt`. Its attachments are files beside it. A message whose UID is already in a file name in the folder is not fetched again.
- **A fetch file lists what a mailbox fetches** (`fetch.toml`, beside the mailbox's folders). Each `[[folder]]` names a `source` and the `local` folder it goes to. A source of `inbox` or `sent` is the server's own, and any other source is an IMAP folder or a Gmail label, which Gmail serves as a folder of that name.
- **A mailbox may be kept out of the repository.** A fetch file that says `store = "private"`, kept in `~/.local/share/slasher/email/<project>/<name>/`, has the messages written there.

```toml
store = "private"

[[folder]]
source = "inbox"
local = "INBOX"

[[folder]]
source = "Some Label"
local = "some-label"
```

**The `/email` command fetches and lists the accounts** (`email-fetches-the-accounts-named-and-lists-them-without-credentials`). `/email fetch <name>` fetches one account, `/email fetch <host>` every account on a host, and a bare `/email` or `/email fetch` every account. `/email list` lists the accounts by name, host, and login, and never a credential. A credential is stored by the engineer in their own terminal, never through the chat. `list.py` prints the accounts, one to a line.

**It needs macOS and Python 3.11 or later.** The Keychain is reached with macOS's `security` command, and the fetch is Python on its standard library. A Gmail mailbox is reached with an app password, since Gmail's IMAP does not take the account's own password.

**It is not in the default package set.** A project that fetches email installs it by name, as in `sh slasher-install default imap`.

This is a standalone package: it includes no other packages.

```
imap  →  (nothing — standalone)
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `slasher/system/` tree, committed alongside your code:

```
git subtree add  --prefix slasher/system/imap git@github.com:slasher-bot/imap.git master --squash
git subtree pull --prefix slasher/system/imap git@github.com:slasher-bot/imap.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/slasher-bot/imap.git` in place of the address above. A script takes `SLASHER_ORIGIN=https://github.com/slasher-bot` for the same reason.

It has no dependencies.

## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

Authored by Scott Bellware on Tue Nov 10 2026 at 6:52:36 PM PT
