# Implementation — Location and participation are asked when a progression is started

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Do #1 unattended, with #1 the correction item `2026-11-22T02-01-04Z-location-and-participation-are-asked-at-start`

**The working-location question and the attended-or-unattended question are asked when a progression is started, not when it is created Open.** The item states what the change reaches.

Realizes the correction item `2026-11-22T02-01-04Z-location-and-participation-are-asked-at-start`.

## State

- **State:** Completed

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/questions-asked-at-start`
- **Base:** `3354fa7e`, from `master`, the commit holding this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-questions-asked-at-start`. The main working tree stays on `master`.
- **Participation:** unattended, as the engineer asked.
- **Forecast:** none given.
- **Item:** `2026-11-22T02-01-04Z-location-and-participation-are-asked-at-start`

## Plan, as accepted on 2026-11-22

1. Start an unattended implementation for #1 on a branch and a worktree. Write its record Active, make the item Progression, and log both, committed on `master` on the engineer's selection.
2. Amend the progression rule. `new` writes the record Open on the upstream branch, creates no branch, and asks neither question. `start` asks both questions, unless the work is unattended, and creates the branch.
3. Amend the attended-or-unattended rule, so the question is asked when the work is started.
4. Amend the progressions-directory rule. An Open record carries no branch, base, or working location until it is started.
5. Change the help and skill text for `new` in `/feature`, `/experiment`, `/content`, `/progression`, and `/implementation`.
6. Check each changed compressed text with fresh agents, and record the figures.
7. Write no test. No script changes. The status line already skips a record that names no branch.
8. Compile, run the automated suite, and commit on the branch.
9. The merge to `master` and the conclusion wait for the engineer.

## What happened

- The progression rule says `new` writes the record `Open`, commits it with its log entry on `master`, creates no branch, and asks neither question. `start` asks the working-location and participation questions, writes the answers and the branch into the record, commits it `Active`, and creates the branch.
- The progressions-directory rule says an `Open` record names no progression branch, base, or working location, and the selections are made at the start.
- The attended-or-unattended rule says the mode is asked when the work is started. The agent renamed it attended-or-unattended-is-chosen-when-the-work-is-started, since its name said *created*, and conformed the eleven rules that cite it.
- The help and skill text for `new` in `/feature`, `/experiment`, `/content`, `/progression`, and `/implementation` say it writes an `Open` record and creates no branch.
- The compressed texts were checked against their bodies by two fresh agents. One repair, in the progression rule. One directive is left less precise, untouched by this revision, as it was on 2026-11-07.
- No test was written. No script changed. The status line skips a record that names no branch.
- The automated suite passed: 152 test files.

## Confirmations

- **2026-11-22** — Creation: started unattended, as the engineer asked. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-22** — Participation: unattended, as the engineer asked.
- **2026-11-22** — Plan: Accept, selected by the engineer.
- **2026-11-22** — Conclusion: Completed, selected by the engineer. The work has no forecast, so no verdict question was asked.

---

Authored by Scott Bellware on Sun Nov 22 2026 at 14:26:16 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:31:30 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:35:54 PT
