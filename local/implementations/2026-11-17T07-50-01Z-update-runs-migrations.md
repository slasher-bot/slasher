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
- **Base:** recorded on the implementation branch
- **Working location:** branch and worktree, at `../slasher-feature-worktree-update-runs-migrations`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## Confirmations

- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 65%, risk of redo 35%, It'll work 80%, Your approval 70%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:50:01 PM PT
