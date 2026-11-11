# Email is fetched through a general mechanism, with a general token or credential store

- **State:** Implementation
- **Tags:** [idea]

**A general way to fetch email, which is not tied to one provider, reads its access from a general store of tokens or credentials.** The store serves the email fetch, and is not specific to it.

**Not yet settled:**

- what the fetched email is for
- which providers and protocols the fetch covers
- where the store lives, which is outside any repository, as per-machine configuration is, so that no credential is committed

## Settled

- **2026-11-09** — The fetch covers IMAP only, for now. **As the engineer stated it:** "It will only be IMAP for now". This settles which providers and protocols the fetch covers: any IMAP server.
- **2026-11-09** — The fetched email is stored in the project, either in its local files or in the project's private store. **As the engineer stated it:** "The fetched email is stored in the project, either in the local files or in the project's private store". This settles what the fetched email is for.
- **2026-11-09** — The credential store is the macOS Keychain. **As the engineer stated it:** "Let's use the macOS Keychain". Each credential is a Keychain item, read with the `security` command, so the fetch asks for no password once access is allowed. The credential is encrypted by the system and kept outside any repository. The store works on macOS only. This settles where the store lives.
- **2026-11-10** — The mailbox fetch is written in Python, on its standard library: `imaplib`, `ssl`, and `email`, as RCC's working fetch is.
- **2026-11-10** — Each fetched message is laid out as RCC lays it out, with the ISO-8601-UTC prefix the project's records use: one plain-text file per message, its headers then its body, with attachments as files beside it in the same folder. Each file is named with the message's date as the prefix, then its UID, then its cleaned subject or attachment name, as in `2026-11-10T22-03-00Z-1042-some-subject.txt`. No raw copy is kept.
- **2026-11-10** — A repeat fetch skips the messages already fetched by the UIDs in the file names already in the folder, as RCC does. Nothing else is stored. A mailbox the server renumbers may be fetched twice.
- **2026-11-10** — In the project's local files, fetched email goes under `slasher/local/email/`, committed with the project. In the project's private store, it goes under `~/.local/share/slasher/email/<project>/`, outside the repository, as the private journal is kept. Each mailbox and folder has a folder of its own inside, as in `slasher/local/email/work-mail/INBOX/`.
- **2026-11-10** — A mailbox may have a fetch file, which lists the folders and Gmail labels to fetch and where each goes. Without one, the fetch gets the inbox and the sent messages. The engineer asked for a design that brings in RCC's fetch of Gmail by label, and accepted the agent's proposal: "That proposal is acceptable".
  - The fetch file is TOML, named `fetch.toml`, beside the mailbox's folders: `slasher/local/email/<name>/fetch.toml`. It holds folder names and labels, never a credential.
  - Its `store` is `local` or `private`. Each `[[folder]]` has a `source` and a `local` folder name. A `source` of `inbox` or `sent` is the server's own inbox or sent folder, found by its IMAP marker. Any other `source` is an IMAP folder or a Gmail label, as Gmail serves each label as a folder of that name.
  - The command does not change. `fetch.py <name>` fetches exactly the folders the fetch file lists, where there is one.
  - A mailbox whose `store` is `private` keeps its fetch file in the private store, at `~/.local/share/slasher/email/<project>/<name>/fetch.toml`, so its label names are not committed.
  - Gmail is reached with an app password, stored with `credential.sh write`. A message with two fetched labels is fetched into both folders.
- **2026-11-10** — The email commands are `/email fetch <name>|<host>`, `/email list`, and `/email help`. **As the engineer stated it:** "The commands should be: email fetch <name>|<host>, email list, email help". A credential is not stored through a command.
- **2026-11-10** — `/email fetch <host>` fetches every account whose credential has that host, each following its own fetch file. A host such as Gmail's may hold many accounts, and each is fetched. **As the engineer stated it:** "For the accounts that have that host, it fetches all of them, and follows the rules in the fetch file. It may retrieve may accounts, eg: if there are many at gmail".
- **2026-11-10** — `/email list` lists the accounts, each by its name, host, and login. It shows no credential. **As the engineer stated it:** "The "/email list" shows the list of accounts. It doesn't show credentials."
- **2026-11-10** — A bare `/email` is an alias of `/email fetch`. **As the engineer stated it:** "Also, a bare "/email" is an alias for "/email fetch"".
- **2026-11-10** — `/email fetch` with no name or host, and so a bare `/email`, fetches every account in the Keychain, each following its own fetch file.
- **2026-11-10** — An account whose credential has no name has its mail, and its fetch file, under its host and its login, as in `slasher/local/email/imap.gmail.com/you@gmail.com/INBOX/`.

**Implementation:** the feature `2026-11-10T06-02-53Z-general-email-fetch` carries this idea's work.

## History

As the engineer first stated it: "Idea: generalized email fetch with generalized token or credential store"

---

Authored by Scott Bellware on Sat Oct 31 2026 at 9:20:53 AM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:02:53 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:09:55 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:12:45 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:23:08 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:36:06 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:38:38 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:40:06 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:40:56 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 12:10:03 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:08:45 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:10:06 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:11:22 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:12:28 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:12:47 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:13:24 PM PT
