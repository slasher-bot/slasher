# Feature — Relocatable local directory

**Tags:** [feature]

## Intent

**As the engineer stated it:** A project's local directory can be located in any directory. When the local directory is not in its default location, it's configured in the project registry.

**A project's `local` directory may sit outside the project, at the path its registry entry gives under the key `local`.** Every Slasher script finds it there, a configured directory that does not exist stops with an error, a record is committed in the git repository that holds the directory, and every worktree uses the one directory.

Realizes the item `2026-11-16T05-06-34Z-a-projects-local-directory-can-be-located-in-any-directory`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/relocatable-local-directory`
- **Base:** recorded on the implementation branch
- **Working location:** branch and worktree, at `../slasher-feature-worktree-relocatable-local-directory`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## Confirmations

- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 80%, Your approval 60%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 8:44:33 PM PT
