# Loop record — Email accounts per project

A project lists the email accounts that apply to it in one file, `email/slasher-email.toml` in its local directory, an `[[account]]` table to each. The fetch takes only listed accounts, the send sends only through one, and a migration folds each account's own `slasher-email.toml` into the one file.

**Mode:** unattended. The engineer selected it at the start, and accepted the plan.

## 1. The actuation of the configuration

- **Hinge:** what `email_configuration.py` gives its two users, the fetch and the send.
- **Decision:** `accounts()` gives the listed accounts as a dictionary of name and table, or `None` where there is no file, and `configuration(name)` gives one account's table. `None` and an empty list differ, so the fetch can say the project lists nothing. `configuration(name)` keeps the shape the fetch already used, so `mailbox` reads `imap` from the table unchanged.

## 2. A name the project does not list

- **Hinge:** what `/email fetch <name>` does for an account the project does not list.
- **Decision:** it is refused, as a name not stored is. The engineer's statement was to limit certain accounts to certain projects, and an argument that reached past the list would undo the limit.

## 3. A listed account with no credential

- **Hinge:** what the fetch does with a listed account that has no stored credential.
- **Decision:** a bare fetch reports it and fetches the others. A list copied from another machine, or an account not yet stored, should not stop the accounts that can be fetched.

## 4. The list command

- **Hinge:** whether `/email list` lists the project's accounts or every stored one.
- **Decision:** every stored one, as before. It is where an account's name is found to be written into the list.

## 5. The send

- **Hinge:** whether the limit reaches the send.
- **Decision:** it does. The send refuses an account the project does not list, after it finds the credential, so a name with no credential is still reported as before.

## 6. An account with no name

- **Hinge:** how an account stored with no name is listed.
- **Decision:** as `<host>/<login>`, the folder its mail already goes to.

## 7. The private store

- **Hinge:** where the file may sit besides the project's local directory.
- **Decision:** in the private store, `~/.local/share/slasher/email/<project>/slasher-email.toml`, looked in second, as an account's file was before.

## 8. The migration

- **Hinge:** what `install.sh migrate` folds in, and what it leaves.
- **Decision:** each `email/<name>/slasher-email.toml`, and `email/<host>/<login>/slasher-email.toml`, becomes an `[[account]]` table, its `[imap]` and `[smtp]` tables renamed, and the account's file is removed. It runs only where the one file is absent, and says so where both are present. Account files in the private store are reported, not moved. An account fetched with no file of its own is not listed, since nothing in the project names it.

## Outcome

- Five tests are new, and fourteen are conformed to the one file. The automated suite passes: 121 tests.
- On a copy of RCC's two account files, the migration wrote one file listing `gmail` and `trustee` with their folders.

---

Authored by Scott Bellware on Wed Nov 18 2026 at 20:23:18 PT
