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

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/base-and-system-projects`
- **Base:** `88604797`, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../slasher-feature-worktree-base-and-system-projects`, and the main working tree stays on `master`.
- **Participation:** attended, chosen at the start.
- **Verdict:** it concludes without an engineer's verdict, selected at the start.

## Confirmations

- **2026-11-07** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-11-07** — Participation: Attended, selected by the engineer. Agent's confidence 45%, risk of redo 55%, It'll work 70%, Your approval 45%, attended confidence 75%. The warning was shown, and Attended was recommended.
- **2026-11-07** — The feature concludes without an engineer's verdict, selected by the engineer at the start.
- **2026-11-07** — The feature builds the item's settled parts only, and registries at more than one level stay out, selected by the engineer at the start.

---

Authored by Scott Bellware on Sat Nov 7 2026 at 7:15:40 PM PT
