# Feature — A /commit command, with the /c alias

**Tags:** [feature]

## Intent

**As the engineer stated it:** Do #4 unattended, with #4 the item `2026-11-19T18-03-15Z-a-commit-command-with-the-c-alias`.

**`/commit` commits the work on the current branch, and pushes nothing.** `/c` is its alias, and does exactly what it does. `/c` was an alias of `/current`, and `/current` keeps `/'`.

Realizes the item `2026-11-19T18-03-15Z-a-commit-command-with-the-c-alias`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/commit-command`
- **Base:** `b12a6c9b`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-commit-command`
- **Participation:** unattended.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-19T18-03-15Z-a-commit-command-with-the-c-alias`

## What happened

- The `git` package holds the commit-commits-the-work-on-the-current-branch rule, and the `/commit` and `/c` skills.
- `/commit` runs the automated suite, commits the working tree's changes on the current branch, and pushes nothing.
- The PUSH help, the command table, and the shortcuts table name `/commit` and `/c`.
- `/current` keeps only `/'`. The current line at the end of the session-start read is *Type /current or /' for open and active work.*
- The two command-table rules say so. Neither has a compressed text to check.
- No loop record: the work is rules and skills, which is content work in this project.
- The automated suite passes: 121 tests.

## Confirmations

- **2026-11-19** — Participation: Unattended, stated by the engineer: *Do #4 unattended*. The question was not put, so no figures were shown.
- **2026-11-19** — Working location: branch and worktree, selected by the agent. The worktree keeps this work apart from changes then uncommitted in the main working tree.
- **2026-11-19** — Forecast: No forecast, selected by the agent. The work adds a command, and states no claim to test.
- **2026-11-19** — Plan: Accept, selected by the engineer. The plan selected the commit of this record on `master`, and put the merge to `master` to the engineer.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 4:37:50 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 4:40:28 PM PT
