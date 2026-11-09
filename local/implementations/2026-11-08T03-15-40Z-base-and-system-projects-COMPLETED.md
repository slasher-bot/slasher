# Feature — Base Slasher project and System Slasher project

**Tags:** [feature]

## Intent

**As the engineer stated it:** "Start #3 with a feature", where #3 is the item `2026-10-30T06-57-47Z-commands-can-target-the-machines-root-install-of-waytide`, titled *Base Slasher project and System Slasher project*. The engineer selected that the feature builds the item's settled parts only.

**A project can address its base project, the machine's system project, and any project in the registry, by `/projects`.** The item is the source of truth for what is settled. The feature builds these parts of it:

- A project has one base project, in a directory beside its own. A Slasher configuration file in their shared parent directory names it.
- A machine has one system project. A configuration under `~/.config/slasher` names its location. The system project has a `local/` directory for the engineer's most general content.
- `/projects -base <instruction>` and `/projects -system <instruction>` address those two projects from within the current project, and `/projects <project-name> <instruction>` addresses a project by its name in the registry.

Registries at more than one level, which the item has not settled, are out of scope.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/base-and-system-projects`
- **Base:** `88604797`, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../slasher-feature-worktree-base-and-system-projects`, and the main working tree stays on `master`.
- **Participation:** attended, chosen at the start, through outcome 5. Unattended from outcome 6, at the engineer's direction.
- **Verdict:** it concludes without an engineer's verdict, selected at the start.

## Confirmations

- **2026-11-07** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-11-07** — Participation: Attended, selected by the engineer. Agent's confidence 45%, risk of redo 55%, It'll work 70%, Your approval 45%, attended confidence 75%. The warning was shown, and Attended was recommended.
- **2026-11-07** — The feature concludes without an engineer's verdict, selected by the engineer at the start.
- **2026-11-07** — The feature builds the item's settled parts only, and registries at more than one level stay out, selected by the engineer at the start.
- **2026-11-08** — Participation: Unattended from outcome 6 to the close, directed by the engineer (*Proceed unattended*). The engineer accepted the agent's plan: outcomes 6 and 7 for an unknown name and a name two projects share, outcome 8 for `/projects` carrying out an instruction, naming, and a stop before the feature concludes.

- **2026-11-08** — The feature is Completed, at the engineer's direction (*Complete the feature*), and merges into `master`. The item it builds returns to Open, as the engineer selected.

---

Authored by Scott Bellware on Sat Nov 7 2026 at 7:15:40 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 6:00:45 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 7:15:39 PM PT
