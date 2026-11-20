# Feature — A command and a shortcut commit and push

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature start #2", with the item chosen as `2026-11-15T23-56-12Z-a-command-and-shortcut-commit-and-push`.

**A Slasher command, with a shortcut alias, commits the work and then pushes it.**

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/commit-and-push-command`
- **Base:** `293ae6c5`, from `master`, the commit holding this record as first written
- **Working location:** branch only, chosen when the feature was created.
- **Participation:** unattended, chosen when the feature was created.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-15T23-56-12Z-a-command-and-shortcut-commit-and-push`

## What happened

- `/commit-and-push`, with the shortcut `/cp`, is in the `git` package, in the PUSH domain.
- Its rule, commit-and-push-commits-the-work-then-pushes-the-current-branch, runs the automated suite, commits the working tree's changes, and pushes the current branch. It asks only about changes the session did not make.
- The PUSH help lists both commands, and its description names both acts.
- The automated suite passed: 73 test files.
- Loop record: `2026-11-16T00-10-15Z-commit-and-push-command`

## Confirmations

- **2026-11-15** — Creation: `/feature start`, with no feature Open, so the feature was created Active.
- **2026-11-15** — Working location: Branch only, selected by the engineer.
- **2026-11-15** — Participation: Unattended, selected by the engineer. Agent's confidence 65%, risk of redo 35%, It'll work 85%, Your approval 65%, attended confidence 90%. The warning was shown, and Attended was recommended.
- **2026-11-15** — Forecast: No forecast, selected by the engineer.
- **2026-11-16** — Plan: Accept, selected by the engineer.
- **2026-11-15** — Conclusion: Completed, with the merge to master, selected by the engineer. The work states no forecast.
- **2026-11-16** — Branch deletion: selected by the engineer.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 4:08:27 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 4:08:27 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 4:10:15 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 4:12:31 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 4:15:18 PM PT
