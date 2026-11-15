# Feature — Universal toml configuration file for both imap and smtp

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature start #2", with the item chosen as `2026-11-15T20-24-23Z-universal-toml-configuration-file-for-imap-and-smtp`.

**One toml configuration file serves both the `imap` and the `smtp` packages, in place of `fetch.toml`.**

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/universal-toml-configuration`
- **Base:** `5df76a68`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-universal-toml-configuration`, chosen when the feature was created.
- **Participation:** unattended, chosen when the feature was created.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-15T20-24-23Z-universal-toml-configuration-file-for-imap-and-smtp`

## Plan

The engineer selected Revise twice, then named the file `slasher-email.toml` in place of `account.toml`, and dropped the plan's reading of `fetch.toml` as a fallback. The engineer accepted the third plan.

## What happened

- `slasher-email.toml`, in an account's folder in the project or the private store, configures the account. Its `[imap]` table holds `store` and the `[[imap.folder]]` entries. Its `[smtp]` table's `host` names the SMTP host.
- `email_configuration.py`, in the `imap` package, finds and reads it. `fetch.py` and the `smtp` package's `send.py` read it through that module.
- `fetch.toml` is no longer read.
- A file with no `[imap]` folders fetches the inbox and the sent mail.
- The `imap` and `smtp` READMEs and the `imap` rule name `slasher-email.toml`.
- The automated suite passed: 74 test files.
- Loop record: `2026-11-15T22-47-10Z-universal-toml-configuration`

## Confirmations

- **2026-11-15** — Creation: `/feature start`, with no feature Open, so the feature was created Active.
- **2026-11-15** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-15** — Participation: Unattended, selected by the engineer. Agent's confidence 55%, risk of redo 45%, It'll work 80%, Your approval 55%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-15** — Forecast: No forecast, selected by the engineer.
- **2026-11-15** — Plan: Accept, selected by the engineer, after two Revise selections.
- **2026-11-15** — Conclusion: Completed, with the merge to master, by the engineer's `/feature complete`. The work states no forecast.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 2:26:05 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 2:26:06 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 2:47:10 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 2:59:30 PM PT
