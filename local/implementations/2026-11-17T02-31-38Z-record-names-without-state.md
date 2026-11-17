# Feature — Record names without state

**Tags:** [feature]

## Intent

**As the engineer stated it:** Consider removing the state from records' file names so that referencing them via URL is stable. The change will also require a migration for downstream projects.

**An item's or an implementation record's file name carries no state, so its path stays the same for the record's whole life.** The `**State:**` line remains the only statement of the state. A Slasher project's records already written are renamed by a migration when its packages are updated.

Realizes the item `2026-11-16T05-29-10Z-remove-the-state-from-record-file-names`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/record-names-without-state`
- **Base:** `0b161e6d`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-record-names-without-state`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- The a-records-file-name-carries-no-state rule replaces the rule that required the suffix. The items, implementations, notes, file-names, records-line, `/open`, and private rules match it, each with a History line.
- `install.sh` takes the state off a Slasher project's record names when its packages are updated, after the older migrations. Where the name is taken, or two names differ only in their state, it renames neither and says so.
- `current-implementation.sh` reads the `**State:**` line.
- This repository's 240 items and implementation records are renamed with `git mv`.
- The six changed compressed texts are checked by fresh agents. Four gaps found are repaired.
- The migration record is `2026-11-17T02-38-07Z-record-names-lose-their-state`, and the loop record is `2026-11-17T02-38-07Z-record-names-without-state`.
- The automated suite passes: 82 tests.

## Confirmations

- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 80%, Your approval 60%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.
- **2026-11-16** — Plan: accepted by the engineer.
- **2026-11-16** — Conclusion: Completed, selected by the engineer.
- **2026-11-16** — Branch deletion and worktree removal: selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 6:31:38 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 7:20:24 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 7:23:50 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 7:24:49 PM PT
