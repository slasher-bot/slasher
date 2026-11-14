# Feature — /current leaves out Implementation items

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/! #3", with the item chosen as `2026-11-14T00-25-56Z-implementation-items-are-left-out-where-implementations-are-listed-too`, which reads "When current items and implementations are printed together, as is the case with some commands, items in the Implementation state should not be printed. When current items are printed on their own, items in the Implementation state should be printed."

**`/current` leaves out Implementation items, since its implementations section shows that work. `/items current` and `/i` still list them.**

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/current-leaves-out-implementation-items`
- **Base:** `a28be771`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-current-leaves-out-implementation-items`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/current`, `/'`, and `/c` list the Open and Active items, then the implementations. An Implementation item is left out, and counted under *Other items*.
- `/items current` and `/i` still list Open, Active, and Implementation items.
- The current-command section of the printed-list rule and its compressed text say so, with a History line.
- The new compressed text was checked by a fresh lister and checker: 24 directives, 19 kept, 2 less precise, 3 lost, then 1 repair.
- The automated suite passed: 58 tests.

## Confirmations

- **2026-11-13** — Participation: Unattended, selected by the engineer with `/!`. The question was not put. No figures were shown.
- **2026-11-13** — Plan: accepted by the engineer, including this record's commit on `master`.
- **2026-11-13** — Working location: branch and worktree, selected by the agent.
- **2026-11-13** — Forecast: no forecast, selected by the agent.
- **2026-11-13** — Merge to master: selected by the engineer.
- **2026-11-13** — Branch deletion and worktree removal: selected by the engineer, in the same selection as the merge.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 4:59:15 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:59:41 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 5:01:09 PM PT
