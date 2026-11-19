# Feature — Email accounts per project

**Tags:** [feature]

## Intent

**As the engineer stated it:** Do #2 as an unattended worktree feature, with #2 the item `2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project`.

**A project lists the email accounts that apply to it, in one file, `email/slasher-email.toml` in its local directory, with a table for each account.** A bare `/email fetch` fetches only those accounts, and a project with no list fetches none. The per-account `slasher-email.toml` files are folded into it.

Resolves the item `2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/email-accounts-per-project`
- **Base:** the commit on `master` holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-email-accounts-per-project`, chosen by the engineer in the request.
- **Participation:** unattended.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-19T03-36-28Z-imap-fetch-cannot-say-which-accounts-apply-to-a-project`

## Confirmations

- **2026-11-18** — Working location: branch and worktree, stated by the engineer: *Do #2 as an unattended worktree feature*.
- **2026-11-18** — Participation: Unattended, selected by the engineer. Agent's confidence 65%, risk of redo 35%, It'll work 80%, Your approval 65%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-18** — Forecast: No forecast, selected by the engineer.
- **2026-11-18** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Wed Nov 18 2026 at 8:17:20 PM PT
