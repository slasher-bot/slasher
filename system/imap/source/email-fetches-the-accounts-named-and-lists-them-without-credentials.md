# Email fetches the accounts named, and lists them without credentials

**Trigger:** When the engineer asks for email to be fetched or for the email accounts to be listed, as with `/email`, `/email fetch`, or `/email list`

**`/email fetch` fetches IMAP accounts into the project.** `/email fetch <name>` fetches the account with that name. `/email fetch <host>` fetches every account whose host it is, as a Gmail host can hold many. `/email fetch` with nothing after it fetches every IMAP account, and a bare `/email` is the same. Each account follows its own fetch file, where it has one. The act is the package's `fetch.py`, run from the project root: `slasher/system/imap/fetch.py [<name>|<host>]`, or `system/imap/fetch.py` where the project has no `slasher/` directory. Report how many messages each account's folders took, as the script prints them, and where they went. Where the script fails, report its message and do nothing more.

**`/email list` lists the accounts, and never a credential.** The act is the package's `list.py`, run the same way. It prints one account to a line: its name, its host, and its login, separated by tabs. Present them as a table of those three columns. An account with no name shows an empty name.

**A credential never passes through the chat.** The agent does not ask for a credential, read one aloud, or print one. A credential is stored by the engineer in their own terminal, with `credential.sh write <host> <login> [--name <name>]`, typing it at a hidden prompt. Where the engineer asks to store one, give them that command to run, and do not run it with a credential in it.

**Why:** a credential typed into the chat is kept in the conversation, beyond the Keychain's protection. The commands work on accounts by their names and hosts, which are not secret, so they need no credential to pass through the agent.

**How to apply:** on `/email`, `/email fetch`, or `/email list`, run the package's script from the project root, and report what it printed. Give the engineer the credential command to run themselves when they want an account stored.

Related:

- the `foundation` package's present-every-prompt-to-the-engineer-through-the-selection-ui rule, where an account is to be chosen

---

Authored by Scott Bellware on Tue Nov 10 2026 at 7:58:43 PM PT
