# Work Session — Email accounts per project (2026-11-18)

This work session started with the engineer noting that the imap fetch has no way to say which email accounts apply to a project. It became a problem item, two settled decisions about where a project lists its accounts and how the file is shaped, and an unattended feature that built them. It ended with the feature merged and the item Resolved.

This is the communicable record of the work session, a guided tour. The item, the feature record, the loop record, the rule, and the log entries it points to are the source of truth.

## 1. The problem

The engineer stated that the imap fetch cannot say which accounts apply to a project. `fetch.py` took its accounts from the machine's Keychain, the same list in every project, so a bare `/email fetch` brought every account into whichever project the session was in. An account's `slasher-email.toml` configured how it was fetched, not whether. The engineer had it recorded as a problem.

- Item: `2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project`, Resolved

## 2. Where the list lives

The engineer said they need to limit certain accounts to certain projects. Of four places for the limit, the engineer chose a list in the project, which travels with the project's records. A project with no list fetches none.

## 3. One file

The engineer asked whether each account's own `slasher-email.toml` was still needed. Their pros and cons were weighed: keeping them changes no code, but splits a project's setup over several files, while one file needs a migration. The engineer approved one file, `email/slasher-email.toml`, with an `[[account]]` table to each account. An aside settled that Gmail's IMAP credential opens the whole mailbox, so separate credentials let one project's access be revoked alone, and the folder list, not the credential, limits what is downloaded.

## 4. The feature, unattended

The engineer chose a worktree, unattended work, and no forecast, and accepted a thirteen-step plan. The fetch takes only listed accounts and refuses a name the list does not hold. The send refuses an unlisted account. `/email list` still lists every stored account, so names can be copied into the list. `install.sh migrate` folds each account's file into the one file, and was tried on a copy of RCC's two files.

- Feature record: `2026-11-19T04-17-20Z-email-accounts-per-project`, Completed
- Loop record: `2026-11-19T04-23-18Z-email-accounts-per-project`
- Rule: the `imap` package's email-fetches-the-accounts-named-and-lists-them-without-credentials rule

## 5. The conclusion

The engineer selected the merge. The automated suite passed on `master` with 121 tests, and the branch and worktree were deleted.

## Takeaways

- A project fetches and sends only through the email accounts it lists.
- A project's email setup is one file, `email/slasher-email.toml`, in its local directory.
- An update's migration folds the old per-account files into it.

## Glossary

- **email configuration** — the project's `email/slasher-email.toml`, listing the accounts it uses, an `[[account]]` table each, with `[account.imap]` and `[account.smtp]` tables.
- **listed account** — an account with a table in the project's email configuration. Only a listed account is fetched or sent through.

## Where the durable records live

- Item: `local/items/2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project.md`
- Feature record: `local/implementations/2026-11-19T04-17-20Z-email-accounts-per-project.md`
- Loop record: `local/logs/loops/2026-11-19T04-23-18Z-email-accounts-per-project.md`
- Code: `system/imap/email_configuration.py`, `system/imap/fetch.py`, `system/smtp/send.py`, and the migration in `system/foundation/install.sh`

---

Authored by Scott Bellware on Wed Nov 18 2026 at 8:30:01 PM PT
