# Implementation — A /conclude command

**Tags:** [implementation]

## Intent

**As the engineer stated it:** `/! #2`, with #2 the work item `2026-11-21T21-53-31Z-conclude-command`, which reads: "/conclude" command. Tells the agent: conclude

**Typing `/conclude` tells the agent *conclude*, about the work under way or the record named.** The work item states the tasks.

Realizes the work item `2026-11-21T21-53-31Z-conclude-command`.

## State

- **State:** Active

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/conclude-command`
- **Base:** the commit on `master` that holds this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-conclude-command`. The main working tree stays on `master`.
- **Participation:** unattended, by `/!`.
- **Forecast:** none given.
- **Item:** `2026-11-21T21-53-31Z-conclude-command`

## Plan, as accepted on 2026-11-21

1. Start an unattended implementation for the work item, on a branch and worktree. Write its record Active, make the item Progression, and log both, committed on `master` on the engineer's selection.
2. Add a `/conclude` skill in `foundation`, beside `/complete`. A bare `/conclude` concludes the work under way, found as `/work-status` finds it. `/conclude <record>` concludes the record named. Either way it names no state, so it puts the concluding states the record can take to the engineer, as the items and progressions rules already say, and concludes in the state selected.
3. The ITEMS help names `/conclude` after `/complete`. It gets no row of its own in the command table, since the command-table rule allows rows only for the commands it lists, and `/complete` has none either. The work item's command-table task is amended to say so.
4. Compile, run the automated suite, and commit on the branch.
5. The merge to `master` and the conclusion wait for the engineer.

## What happened

## Confirmations

- **2026-11-21** — Creation: started unattended by `/!`. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-21** — Participation: unattended, by `/!`.
- **2026-11-21** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 2:07:53 PM PT
