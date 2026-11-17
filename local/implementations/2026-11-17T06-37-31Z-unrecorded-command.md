# Feature — The /unrecorded command

**Tags:** [feature]

## Intent

**As the engineer stated it:** An "/unrecorded" command that mirrors "/private", but instead of routing records to the private directory, the records are not written at all.

**`/unrecorded` starts a session in which no record is written anywhere.** It mirrors the session half of `/private`: it starts and ends the same way, and times out after 4 minutes with no prompt. Files that are not records still change as usual.

Realizes the item `2026-11-17T06-20-07Z-an-unrecorded-command`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/unrecorded-command`
- **Base:** `d9664dca`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-unrecorded-command`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `private-session.sh` starts and ends an unrecorded session as it does a private one, times it out after 4 minutes with no prompt, and ends either session when the other starts.
- `process-question-log.sh` writes no log entry for a session that is unrecorded. The plugin's hook passes it the state directory.
- The an-unrecorded-session-writes-no-record rule says which records are not written, what still changes, and how the session behaves. It loads when `/unrecorded` is typed.
- The `/unrecorded` skill is the session only, and the PRIVATE help lists it.
- The item's open decisions are each settled as it recommended. The loop record is `2026-11-17T06-43-48Z-unrecorded-command`.
- The automated suite passes: 102 tests.

## Confirmations

- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 55%, risk of redo 45%, It'll work 80%, Your approval 55%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.
- **2026-11-16** — Plan: accepted by the engineer.
- **2026-11-16** — Conclusion: Completed, selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 10:37:31 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 10:43:48 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 10:48:03 PM PT
