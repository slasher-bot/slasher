# Feature — /package update runs the installer's migrations

**Tags:** [feature]

## Intent

**As the engineer stated it:** How can a downstream project both get new package version and get the migrations.

**`/package update` runs the migrations of the installer it just pulled, after the pull,** so one command brings a Slasher project both its new package versions and their migrations. It asks nothing, and prints each migration that changed something.

Realizes the item `2026-11-17T07-48-33Z-package-update-runs-the-installers-migrations`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/update-runs-migrations`
- **Base:** `b9741890`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-update-runs-migrations`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `install.sh migrate` runs the installer's migrations alone: the record migrations, and the replacement of an `AGENTS.md` section that is Slasher's alone with the import line. It asks nothing, places nothing a project has not got, and prints only what it changed.
- `refresh-packages.sh` runs the pulled installer's `migrate` mode after the pull, where that installer has it, and reports what changed, uncommitted.
- The update rule, the package help, the installer's usage, and the README say so. The update rule's changed compressed text is checked.
- The loop record is `2026-11-17T07-55-01Z-update-runs-migrations`.
- The automated suite passes: 114 tests.

## Confirmations

- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 65%, risk of redo 35%, It'll work 80%, Your approval 70%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.
- **2026-11-16** — Plan: accepted by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:50:01 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:55:01 PM PT
