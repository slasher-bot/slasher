# Feature — Email accounts per project

**Tags:** [feature]

## Intent

**As the engineer stated it:** Do #2 as an unattended worktree feature, with #2 the item `2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project`.

**A project lists the email accounts that apply to it, in one file, `email/slasher-email.toml` in its local directory, with a table for each account.** A bare `/email fetch` fetches only those accounts, and a project with no list fetches none. The per-account `slasher-email.toml` files are folded into it.

Resolves the item `2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/email-accounts-per-project`
- **Base:** `b487216a`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-email-accounts-per-project`, chosen by the engineer in the request.
- **Participation:** unattended.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project`

## What happened

- A project lists its email accounts in `email/slasher-email.toml`, in its local directory or the private store, an `[[account]]` table to each, with `[account.imap]` and `[account.smtp]` tables.
- `/email fetch` fetches only listed accounts with a stored credential, reports a listed account with none, and refuses a name or host the list does not hold. A project with no list fetches none.
- `send.py` sends only through a listed account.
- `/email list` still lists every stored account.
- `install.sh migrate` folds each account's own `slasher-email.toml` into the one file, and removes it.
- The `imap` rule, the two READMEs, and the email help say so. The rule has no compressed text to check.
- The loop record is `2026-11-19T04-23-18Z-email-accounts-per-project`.
- The automated suite passes: 121 tests.

## Confirmations

- **2026-11-18** — Working location: branch and worktree, stated by the engineer: *Do #2 as an unattended worktree feature*.
- **2026-11-18** — Participation: Unattended, selected by the engineer. Agent's confidence 65%, risk of redo 35%, It'll work 80%, Your approval 65%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-18** — Forecast: No forecast, selected by the engineer.
- **2026-11-18** — Plan: Accept, selected by the engineer.
- **2026-11-18** — Conclusion: Completed, as the accepted plan stated, with the merge to master selected by the engineer.
- **2026-11-18** — Branch deletion and worktree removal: selected by the engineer.

---

Authored by Scott Bellware on Wed Nov 18 2026 at 8:17:20 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 8:23:18 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 8:29:31 PM PT
