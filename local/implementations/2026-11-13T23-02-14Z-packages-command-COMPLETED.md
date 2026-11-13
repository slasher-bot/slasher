# Feature — The /packages command

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/# #3", with the item chosen as `2026-11-13T19-14-11Z-a-packages-command`, which reads "A `/packages` command".

**A `/packages` command lists the installed packages, whether each is active, and what each is.** The item gives only the command's name. The agent read it as a list, as `/items`, `/features`, and `/notes` are, and the engineer accepted the plan that said so.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/packages-command`
- **Base:** `4c83ac0f`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-packages-command`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/packages` prints a table of each installed package's name, its state, Active or Deactivated, and the first sentence of its README, `foundation` first. The package set's name follows, where one is declared.
- The foundation rule packages-lists-the-installed-packages governs it, loaded on demand.
- The PACKAGES help lists `/packages` after `/package-set`. The command table has a `/packages` row below `/package`, and the command-table rule names that row.
- The automated suite passed: 58 tests.

## Confirmations

- **2026-11-13** — Participation: Unattended, selected by the engineer with `/#`. The question was not put. No figures were shown.
- **2026-11-13** — Plan: accepted by the engineer.
- **2026-11-13** — Working location: branch and worktree, selected by the agent.
- **2026-11-13** — Forecast: no forecast, selected by the agent.
- **2026-11-13** — Merge to master: selected by the engineer.
- **2026-11-13** — Branch deletion and worktree removal: selected by the engineer, in the same selection as the merge.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 3:02:14 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:12:19 PM PT
