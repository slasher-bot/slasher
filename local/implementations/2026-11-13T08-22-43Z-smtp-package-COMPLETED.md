# Feature — The smtp package

**Tags:** [feature]

## Intent

**As the engineer stated it:** "Start a feature for #2 using a worktree. Using the data recorded during the imap package work, proceed unattended to build the smtp package. It should use the same credential store." The item chosen is `2026-11-11T23-12-11Z-an-smtp-package-sends-email`.

**An `smtp` package sends email through an account whose credential is kept in the macOS Keychain, the store the `imap` package uses.** Sending stays in a package apart from `imap`, because sending a message is less safe than receiving one.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/smtp-package`
- **Base:** `cf7d88d1`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-smtp-package`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.
- **Loop record:** `2026-11-13T08-22-43Z-smtp-package`, under `local/logs/loops/`.

## Decisions

- `smtp` includes `imap`. It reads the credential with imap's `credential.sh`, so one Keychain item serves both the fetch and the send.
- The SMTP host is the account's IMAP host with a leading `imap.` replaced by `smtp.`. Any other host is used as it is.
- The send connects with TLS on port 465. `SMTP_PORT` and `SMTP_TLS=no` exist for the tests, as `IMAP_PORT` and `IMAP_TLS` do.
- The agent confirms every send with the engineer, through the selection interface, before it runs.
- Saving a message to drafts in place of sending it is out of scope.

## What happened

- The `smtp` package holds `send.py`, its README and LICENSE, `install-dependencies.sh`, the `/smtp` command with its help and its command table row, and the rule smtp-sends-a-message-only-after-the-engineer-confirms-it.
- `send.py` reads the login and host from the Keychain item, and the credential with imap's `credential.sh`.
- The tests use a local SMTP server. They cover the send, the SMTP host taken from the IMAP host, a name with no credential, and the package left out when it is not active.
- `slasher-install` lists `smtp` beside `imap`, and the root README names it.
- The automated suite passed: 57 tests.
- No send to a real server was made. A send through a real account is the engineer's to try.

## Confirmations

- **2026-11-13** — Participation: Unattended, selected by the engineer in the request. The question was not put. No figures were shown.
- **2026-11-13** — Working location: branch and worktree, selected by the engineer in the request.
- **2026-11-13** — Plan: accepted by the engineer.
- **2026-11-13** — Forecast: no forecast, selected by the agent.
- **2026-11-13** — Merge to master: selected by the engineer, with no send through a real account made.
- **2026-11-13** — Branch deletion and worktree removal: selected by the engineer, in the same selection as the merge.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 12:22:43 AM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 12:25:20 AM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 12:26:07 AM PT
