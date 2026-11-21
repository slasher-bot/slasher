# Implementation — Progressions are listed with letter ordinals

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Do #1 unattended, with #1 the work item `2026-11-21T21-37-32Z-progressions-are-listed-with-letter-ordinals`, which reads: Give progressions an ordinal like items in a list, but sequence them with letters, eg: A, B, C, etc

**A printed list of progressions gives each row a letter ordinal, A, B, C, and so on, where a list of items gives a number.** The work item states the tasks.

Realizes the work item `2026-11-21T21-37-32Z-progressions-are-listed-with-letter-ordinals`.

## State

- **State:** Completed

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/progression-letter-ordinals`
- **Base:** `97402d69`, from `master`, the commit holding this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-progression-letter-ordinals`. The main working tree stays on `master`.
- **Participation:** unattended, as the engineer asked.
- **Forecast:** none given.
- **Item:** `2026-11-21T21-37-32Z-progressions-are-listed-with-letter-ordinals`

## Plan, as accepted on 2026-11-21

1. Start an unattended implementation for the work item, on a branch and a worktree. Write its record Active, make the item Progression, and log both, committed on `master` on the engineer's selection.
2. In the printed-list rule, give each row of every printed list of progressions a letter ordinal, from A: `/features`, `/experiments`, `/contents`, `/progressions`, and the progressions under `/current`. After Z come AA, AB, and so on. Lists of items keep number ordinals.
3. Update that rule's compressed text, check it again against the body with two fresh agents, and record the figures.
4. Let a letter name a progression row wherever an ordinal names a record: `/feature status`, `/experiment status`, `/content status`, `/work-status`, `/open`, and `/print`. Update their rules and their help.
5. Write no test. No script changes.
6. Compile, run the automated suite, and commit on the branch.
7. The merge to `master` and the conclusion wait for the engineer.

## What happened

- A printed list of progressions gives each row a letter ordinal, from A, after Z AA, AB: `/features`, `/experiments`, `/contents`, `/progressions`, and the progressions under `/current`. The printed-list rule says so, in its body and its compressed text.
- The agent decided: a letter may be typed in either case, and after Z come AA, AB, and so on. In `/current`, the items keep numbers and the progressions take letters, so no two rows share an ordinal.
- A letter names a progression's row in `/feature status`, `/experiment status`, `/content status`, `/work-status`, `/open`, and `/print`. Their rules and the feature, experiment, and content help say so. `/print` names a record as `/open` does, so its rule did not change.
- The compressed text was checked against the body by two fresh agents: 100 directives, 98 kept, 1 less precise, 1 lost. One repair. The lost directive used the old term Implementation, which the compressed text carries as Progression. The re-check: 100 directives, 100 kept.
- No test was written. No script changed.
- The automated suite passed: 139 test files.

## Confirmations

- **2026-11-21** — Creation: started unattended, as the engineer asked. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-21** — Participation: unattended, as the engineer asked.
- **2026-11-21** — Plan: Accept, selected by the engineer.
- **2026-11-21** — Conclusion: Completed, selected by the engineer. The work has no forecast, so no verdict question was asked.
- **2026-11-21** — Branch deletion and worktree removal: Remove and delete, selected by the engineer.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 2:18:20 PM PT
Changed by Scott Bellware on Sat Nov 21 2026 at 2:31:40 PM PT
Changed by Scott Bellware on Sat Nov 21 2026 at 2:29:55 PM PT
Changed by Scott Bellware on Sat Nov 21 2026 at 2:30:14 PM PT
