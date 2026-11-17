# `/package update` runs the migrations of the installer it pulls

**State:** Completed

**Tags:** [work]

**As the engineer stated it:** How can a downstream project both get new package version and get the migrations. Create a new work item to address this.

## The problem

Getting a new package version and its migrations takes two steps in a Slasher project today, and no single Slasher command does both.

- `/package update`, and `/packages update`, pull the new package versions and rewrite `slasher/SLASHER.md`. They run no migration.
- `install.sh agents-md`, run from the project's root, runs every migration the installed `foundation` holds: the record migrations, and the replacement of an `AGENTS.md` Slasher section with `@slasher/SLASHER.md`. It must run after the update, so that it is the newly pulled installer, since an older one does not know the new migrations.
- `/install` does not help. Where Slasher is already installed, it says so and points to `/package update`.

## Recommended

Added Mon Nov 16 2026. Recommended by the agent, not settled.

- `/package update` runs the migrations of the installer it just pulled, after the pull. Only the pulled installer knows the new migrations.
- It runs the installer's migrations alone, as a separate mode of `install.sh`: the record migrations, and the replacement of an `AGENTS.md` section that is exactly the current bootstrap.
- It never asks anything, and never appends to an `AGENTS.md` that holds no Slasher section. Adding that line still needs the engineer's consent, so the update only reports it, as it does now.
- It prints each migration that changed something, so nothing moves silently.

**Implementation:** `2026-11-17T07-50-01Z-update-runs-migrations`, the feature that builds it.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:48:33 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:50:01 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:59:35 PM PT
