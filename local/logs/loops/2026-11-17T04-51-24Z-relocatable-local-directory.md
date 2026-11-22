# Loop record — Relocatable local directory

A project's local directory may sit outside the project, at the path its registry entry gives under the key `local`. Every Slasher script finds it through one script, `local-directory.sh`.

**Mode:** unattended. The engineer selected it at the start, and accepted the plan.

## 1. The actuation

- **Hinge:** how a script learns where the local directory is.
- **Decision:** `slasher/system/foundation/local-directory.sh`, run from the project's root, prints the path. One script keeps the lookup, the `~` reading, and the error for a missing directory in one place, rather than in seven scripts.

## 2. A worktree's entry

- **Hinge:** how a worktree finds the project's registry entry, since the entry names the project's root, not the worktree's.
- **Decision:** the script reads the entry of the working tree that holds the common git directory. The item settled that every worktree uses the one directory, and this is what makes a worktree find it.

## 3. The default

- **Hinge:** what the script prints with no `local` key.
- **Decision:** `slasher/local`, or `local` in the authoring source, relative, as the scripts computed before. A configured directory is printed in full, which lets a caller tell the two apart.

## 4. The status line's worktrees

- **Hinge:** whether `current-progression.sh` still reads every worktree's records.
- **Decision:** not where the directory is relocated, since every worktree shares it. Where it is not, every worktree is read as before.

## 5. Failure in each caller

- **Hinge:** what each caller does where the configured directory does not exist.
- **Decision:** the loader and `assemble-plugin.sh` stop, with the script's message. `install.sh` prints it and runs no migration. The session-start notice, the status line, and the hooks stay quiet, since they must never disrupt a session.

## 6. An older installed foundation

- **Hinge:** what `install.sh` and `assemble-plugin.sh` do where the installed foundation predates `local-directory.sh`.
- **Decision:** they use `slasher/local`, the only place the directory could then be. The installer is run before the packages it installs are updated, so this case is real.

## 7. Where a record is committed outside git

- **Hinge:** what happens to a record where no git repository holds the relocated directory.
- **Decision:** it is not committed, and the reply that wrote it says so. Nothing else is possible, and saying so keeps the engineer from assuming a commit.

## Outcome

- `local-directory.sh` and its tests. Seven scripts and hooks ask it. A new pre-loaded foundation rule. The automated suite passes: 93 tests.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 20:51:24 PT
