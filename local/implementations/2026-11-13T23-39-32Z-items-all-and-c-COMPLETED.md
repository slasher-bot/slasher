# Feature — /items lists every item, and /c lists the current ones

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/! #2", with the item chosen as `2026-11-13T18-57-14Z-items-prints-all-items-and-current-takes-the-shortcut-c`.

**`/items` lists every item, `/items current` lists the current ones, and `/c` is a shortcut of `/current`.**

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/items-all-and-c`
- **Base:** `1f3b5451`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-items-all-and-c`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/items` and `/i` list every item, with its state, oldest first. A Suspended item is counted below the table, not listed, as every summary treats a hidden record.
- `/items current` and `/i current` list the Open and Active items.
- `/c` is a second shortcut of `/current`, beside `/'`. The `/current` rows read `/current, /', /c`, and the command-table rule says a command with two shortcuts names both.
- The printed-list rule has an items-command section, and the PROCESS help and the shortcuts table match.
- The new compressed text was checked by a fresh lister and checker: 12 directives, 10 kept, 2 less precise, after 1 repair.
- The automated suite passed: 58 tests.

## Confirmations

- **2026-11-13** — Participation: Unattended, selected by the engineer with `/!`. The question was not put. No figures were shown.
- **2026-11-13** — Plan: accepted by the engineer.
- **2026-11-13** — Working location: branch and worktree, selected by the agent.
- **2026-11-13** — Forecast: no forecast, selected by the agent.
- **2026-11-13** — Merge to master: selected by the engineer.
- **2026-11-13** — Branch deletion and worktree removal: selected by the engineer, in the same selection as the merge.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 3:39:32 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:58:19 PM PT
