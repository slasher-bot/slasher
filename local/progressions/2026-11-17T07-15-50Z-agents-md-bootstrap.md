# Feature — The bootstrap in slasher/SLASHER.md

**Tags:** [feature]

## Intent

**As the engineer stated it:** Move it to slasher/SLASHER.md.

**The bootstrap moves out of a project's `AGENTS.md` into `slasher/SLASHER.md`, a file only Slasher writes.** The project's `AGENTS.md` keeps its own text and the one line `@slasher/SLASHER.md`. `/package update` rewrites Slasher's file whole and compares nothing in the project's `AGENTS.md`, so the two no longer contest it.

Resolves the item `2026-11-16T05-27-01Z-package-refresh-contests-control-of-a-projects-agents-md`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/agents-md-bootstrap`
- **Base:** `f8c0ebf3`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-agents-md-bootstrap`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `install.sh agents-md` writes the bootstrap whole to `slasher/SLASHER.md` on every run.
- A project with no `AGENTS.md` gets one holding `@slasher/SLASHER.md`. Where the old section is exactly the current bootstrap, it becomes the line. Where it differs, nothing changes, and the installer says how to replace it. Where there is no Slasher section, the line is appended with the same consent as before.
- `refresh-packages.sh` rewrites `slasher/SLASHER.md` after the pull, and says where `AGENTS.md` lacks the line. It compares nothing in `AGENTS.md`.
- Three rules, the install skills, the curl installer, and the README name `slasher/SLASHER.md`. The changed compressed text of the update rule is checked.
- The migration record is `2026-11-17T07-23-48Z-the-bootstrap-moves-to-slasher-slasher-md`, and the loop record is `2026-11-17T07-25-22Z-agents-md-bootstrap`.
- The automated suite passes: 109 tests.

## Confirmations

- **2026-11-16** — Solution: move the bootstrap to `slasher/SLASHER.md`, selected by the engineer.
- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 80%, Your approval 60%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.
- **2026-11-16** — Plan: accepted by the engineer.
- **2026-11-16** — Conclusion: Completed, selected by the engineer.
- **2026-11-16** — Branch deletion and worktree removal: selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:15:50 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:25:22 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:31:06 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:44:08 PM PT
