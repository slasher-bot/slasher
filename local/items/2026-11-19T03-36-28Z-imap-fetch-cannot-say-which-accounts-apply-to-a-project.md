# The imap fetch cannot say which email accounts apply to a project

**State:** Resolved

**Tags:** [problem]

**As the engineer stated it:** The imap fetch doesn't have a way of saying which email accounts apply to a project

## Cause

Added Wed Nov 18 2026. `fetch.py` takes its accounts from the password items in the machine's Keychain, which `credential.sh` stores. The list is the same in every project on the machine. A bare `/email fetch` fetches every account into the project the session is in. `/email fetch <name>` and `/email fetch <host>` narrow one run, and nothing in the project records which accounts are its own. An account's `slasher-email.toml` configures how the account is fetched and sent, not whether it is fetched.

**As the engineer later stated it:** I need to limit certain accounts to certain projects

## Settled

- **2026-11-18** — A file in the project's local directory lists the email accounts that apply to the project, by name. A bare `/email fetch` fetches only those accounts, and a project with no list fetches none. The list travels with the project's records. The file's name and place are not settled.
- **2026-11-18** — The list and every account's configuration are one file, `email/slasher-email.toml` in the project's local directory. Each account is an `[[account]]` table with its `name`, the name the account has in the Keychain, and an `[account.imap]` table holding what the account's own `slasher-email.toml` holds today under `[imap]`. An `[account.smtp]` table holds its send configuration. The per-account `slasher-email.toml` files are no longer read, and their content moves into the one file. Fetched mail still goes to `email/<name>/`. This settles the file's name and place, which the earlier resolution left open.

**Progression:** `2026-11-19T04-17-20Z-email-accounts-per-project`

---

Authored by Scott Bellware on Wed Nov 18 2026 at 7:36:28 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 7:43:57 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 7:50:50 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 8:17:20 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 8:23:28 PM PT
