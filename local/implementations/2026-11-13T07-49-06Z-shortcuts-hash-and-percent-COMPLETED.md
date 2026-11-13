# Feature — /# for /unattended, and /% for /estimate-confidence

**Tags:** [feature]

## Intent

**As the engineer stated it:** "Do #4 unattended", with the item chosen as `2026-11-13T07-43-41Z-unattended-takes-the-shortcut-hash-and-estimate-confidence-takes-percent`.

**`/unattended` takes the shortcut `/#`, and `/estimate-confidence` takes `/%`.** `/!` names no command.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/shortcuts-hash-and-percent`
- **Base:** `3d462f37`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-shortcuts-hash-and-percent`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- The `number-sign` skill is now the alias of `/unattended`. A new `percent-sign` skill is the alias of `/estimate-confidence`. The `exclamation-mark` skill is removed.
- The two command table rows, the shortcuts table, the PROCESS help, and the README table name the new shortcuts.
- The estimate-confidence rule and the command-table rule name the new shortcuts, each with a History line.

## Confirmations

- **2026-11-12** — Participation: Unattended, selected by the engineer with "Do #4 unattended". The question was not put. No figures were shown.
- **2026-11-12** — Plan: accepted by the engineer.
- **2026-11-12** — Working location: branch and worktree, selected by the agent. The main working tree held uncommitted work of other changes.
- **2026-11-12** — Forecast: no forecast, selected by the agent.
- **2026-11-12** — Merge to master: selected by the engineer.
- **2026-11-12** — Branch deletion and worktree removal: selected by the engineer, in the same selection as the merge.

---

Authored by Scott Bellware on Thu Nov 12 2026 at 11:49:06 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:50:05 PM PT
