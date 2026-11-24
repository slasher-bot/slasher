# Implementation — Items are referred to as i<number> and progressions as p<letter>

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Do #1 unattended, with #1 the work item `2026-11-24T02-53-34Z-items-and-progressions-are-referred-to-as-i-and-p`

**A printed list's row is referred to by its ordinal with a prefix that names its kind, `i1` for an item and `pA` for a progression, and the list prints it so.** The work item settles the details.

Realizes the work item `2026-11-24T02-53-34Z-items-and-progressions-are-referred-to-as-i-and-p`.

## State

- **State:** Completed

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/prefixed-ordinals`
- **Base:** `fb7cb0e4`, from `master`, the commit holding this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-prefixed-ordinals`. The main working tree stays on `master`.
- **Participation:** unattended, as the engineer asked.
- **Forecast:** none given.
- **Item:** `2026-11-24T02-53-34Z-items-and-progressions-are-referred-to-as-i-and-p`

## Plan, as accepted on 2026-11-23

1. Start an unattended implementation for #1 on a branch and a worktree, recorded and committed on `master` on the engineer's selection.
2. Lists print `i1` and `pA` in the first column. Other records take no prefix.
3. Row references accept `i1` and `pA` beside `#1`, `1`, and `A`, in either case, with `#`.
4. Update the help.
5. Check the compressed texts with fresh agents, and record the figures.
6. Write no test. No script changes.
7. Compile, run the automated suite, and commit on the branch.
8. The merge to `master` and the conclusion wait for the engineer.

## What happened

- The printed-list rule prints an item's row as `i1` and a progression's as `pA`, in every list of items or progressions. A list of any other record takes no ordinal. The example tables show `i1` and `i2`.
- A reference to a row takes the prefixed ordinal or the bare one, with or without `#`, in either case: `i1`, `1`, `#1`, `#i1`, `I1`, `pA`, `A`, `pa`, `#pA`. The printed-list rule states it, and the item-status, progression-status, work-status, and `/open` rules accept it. `/print`, `/conclude`, and `/cw` follow from them.
- The item, feature, experiment, content, and RECORD help name a row as `i6` or `pB`.
- The printed-list rule's compressed text was checked against its body by two fresh agents: 94 directives, 94 kept. The other changed rules have no compressed text.
- No test was written. No script changed.
- The automated suite passed: 152 test files.

## Confirmations

- **2026-11-23** — Creation: started unattended, as the engineer asked. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-23** — Participation: unattended, as the engineer asked.
- **2026-11-23** — Plan: Accept, selected by the engineer.
- **2026-11-23** — Conclusion: Completed, selected by the engineer. The work has no forecast, so no verdict question was asked.
- **2026-11-23** — Branch deletion and worktree removal: Remove and delete, selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 23 2026 at 22:47:21 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:50:37 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:54:09 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:55:06 PT
