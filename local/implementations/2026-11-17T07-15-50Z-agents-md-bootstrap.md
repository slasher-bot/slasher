# Feature — The bootstrap in slasher/SLASHER.md

**Tags:** [feature]

## Intent

**As the engineer stated it:** Move it to slasher/SLASHER.md.

**The bootstrap moves out of a project's `AGENTS.md` into `slasher/SLASHER.md`, a file only Slasher writes.** The project's `AGENTS.md` keeps its own text and the one line `@slasher/SLASHER.md`. `/package update` rewrites Slasher's file whole and compares nothing in the project's `AGENTS.md`, so the two no longer contest it.

Resolves the item `2026-11-16T05-27-01Z-package-refresh-contests-control-of-a-projects-agents-md`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/agents-md-bootstrap`
- **Base:** recorded on the implementation branch
- **Working location:** branch and worktree, at `../slasher-feature-worktree-agents-md-bootstrap`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## Confirmations

- **2026-11-16** — Solution: move the bootstrap to `slasher/SLASHER.md`, selected by the engineer.
- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 80%, Your approval 60%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:15:50 PM PT
