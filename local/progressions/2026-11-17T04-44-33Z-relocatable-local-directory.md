# Feature — Relocatable local directory

**Tags:** [feature]

## Intent

**As the engineer stated it:** A project's local directory can be located in any directory. When the local directory is not in its default location, it's configured in the project registry.

**A project's `local` directory may sit outside the project, at the path its registry entry gives under the key `local`.** Every Slasher script finds it there, a configured directory that does not exist stops with an error, a record is committed in the git repository that holds the directory, and every worktree uses the one directory.

Realizes the item `2026-11-16T05-06-34Z-a-projects-local-directory-can-be-located-in-any-directory`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/relocatable-local-directory`
- **Base:** `ac090d9c`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-relocatable-local-directory`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `local-directory.sh` prints the project's local directory: the path under the key `local` in its registry entry, or `slasher/local` by default. A worktree reads its project's entry. A configured directory that does not exist stops it with an error.
- `load-rules.sh`, `session-start.sh`, `current-progression.sh`, `assemble-plugin.sh`, `install.sh`'s migrations, and the branch-switch and process-question-log hooks ask it.
- The a-projects-local-directory-may-be-relocated-by-its-registry-entry rule says what `slasher/local/` means in every rule, and where a record is committed. Where no git repository holds the directory, a record is not committed, and the reply says so.
- The loop record is `2026-11-17T04-51-24Z-relocatable-local-directory`.
- The automated suite passes: 93 tests.

## Confirmations

- **2026-11-16** — Working location: branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 80%, Your approval 60%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: no forecast, selected by the engineer.
- **2026-11-16** — Plan: accepted by the engineer.
- **2026-11-16** — Conclusion: Completed, selected by the engineer.
- **2026-11-16** — Branch deletion and worktree removal: selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 20:44:33 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 20:51:24 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 20:54:45 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 20:57:35 PT
