# Feature — The /unrecorded command

**Tags:** [feature]

## Intent

**As the engineer stated it:** An "/unrecorded" command that mirrors "/private", but instead of routing records to the private directory, the records are not written at all.

**`/unrecorded` starts a session in which no record is written anywhere.** It mirrors the session half of `/private`: it starts and ends the same way, and times out after 4 minutes with no prompt. Files that are not records still change as usual.

Realizes the item `2026-11-17T06-20-07Z-an-unrecorded-command`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/unrecorded-command`
- **Base:** recorded on the implementation branch
- **Working location:** branch and worktree, at `../slasher-feature-worktree-unrecorded-command`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## Confirmations

- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 55%, risk of redo 45%, It'll work 80%, Your approval 55%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 10:37:31 PM PT
