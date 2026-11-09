# Loop record — Base Slasher project and System Slasher project

The feature lets a project address its base project, the machine's system project, and any project in the registry, by `/projects`. The feature record is `2026-11-08T03-15-40Z-base-and-system-projects`, and the item it builds is `2026-10-30T06-57-47Z-commands-can-target-the-machines-root-install-of-waytide`.

**Mode:** attended.

## Design, before the loop

- **Decision / chat:** the agent proposed one script, `resolve-project.sh`, that prints a target project's root, with `/projects` carrying out the instruction against that root. The engineer selected that a project's name is its directory name, that `slasher.toml` in the shared parent directory names the base project with `base-project = "…"`, that `~/.config/slasher/system-project.toml` names the system project with `path = "…"`, and that the system project is a full Slasher project.

## Outcome 1 — the base project is resolved

### Cycle 1 — actuation

- **Hinge:** how the base project is resolved, as the `/projects` skill and the test invoke it.
- **Options:** `cd "$project" && system/foundation/resolve-project.sh -base`; `system/foundation/resolve-project.sh -base "$project"`; `cd "$project" && system/foundation/base-project.sh`.
- **Decision / chat:** the engineer selected `cd "$project" && system/foundation/resolve-project.sh -base`. The project is the one the command runs in, and the flag mirrors `/projects -base`.

### Cycle 2 — observation

- **Hinge:** how the test compares the printed path with the base project's path.
- **Options:** `[ "$base" = "$control_base" ]`, an exact comparison; both paths resolved with `pwd -P` before they are compared.
- **Decision / chat:** the engineer asked for clarification. The agent explained that macOS gives a temporary directory two spellings, `/var/…` and `/private/var/…`, that an exact comparison settles which spelling the script prints, and that the physical comparison accepts either. The agent recommended the exact comparison, since `/projects` uses the printed path as its target. The engineer selected the exact comparison.

### Cycle 3 — controls

- **Hinge:** what the test builds before it runs the script.
- **Options:** the base project as a bare directory; the base project as a git repository holding `slasher/system/`.
- **Decision / chat:** the engineer selected the bare directory. Whether the base is a Slasher project is not part of the normal path.

### Cycle 4 — implementation

- **Hinge:** how `resolve-project.sh -base` comes about.
- **Options:** a working implementation, written directly; red, green, refactor.
- **Decision / chat:** the engineer selected the working implementation.
- **Outcome:** `system/foundation/resolve-project.sh` reads `base-project` from `slasher.toml` in the parent of the current directory and prints the sibling's path. `test/automated/resolve-project/base.sh` is verified, and the automated suite is verified: 18 tests. Committed as `8481e9d3`.

## Outcome 2 — the system project is resolved

### Cycle 1 — actuation

- **Hinge:** how the system project is resolved, as the `/projects` skill and the test invoke it.
- **Options:** `cd "$project" && system/foundation/resolve-project.sh -system`; `system/foundation/resolve-project.sh -system`, with no project entered.
- **Decision / chat:** the engineer selected `cd "$project" && system/foundation/resolve-project.sh -system`, so every target is resolved from the project root, as `-base` is.

### Cycle 2 — observation

- **Hinge:** what the test reads about the effect of `resolve-project.sh -system`.
- **Options:** `[ "$system" = "$control_system" ]`, the recorded path compared exactly; `[ "$system" = "$HOME/some-system" ]`, a path recorded with a leading `~` read back with the home directory expanded.
- **Decision / chat:** the engineer selected the exact comparison against the recorded path.

### Cycle 3 — controls

- **Hinge:** how the test points the script at a temporary `system-project.toml` instead of the engineer's own.
- **Options:** `SLASHER_SYSTEM_PROJECT` names the config file; `SLASHER_CONFIG` names the directory that stands in for `~/.config/slasher`; `HOME` is set to a temporary directory.
- **Decision / chat:** the engineer asked for clarification. The agent explained that each option builds the same project and config, and differs only in how the script is pointed at the config. It recommended the file variable, since `read-consuming-projects.sh` already uses `SLASHER_REGISTRY` the same way. The engineer selected `SLASHER_SYSTEM_PROJECT`.

### Cycle 4 — implementation

- **Hinge:** how `resolve-project.sh -system` comes about.
- **Options:** a working implementation, written directly; red, green, refactor.
- **Decision / chat:** the engineer selected the working implementation.
- **Outcome:** `resolve-project.sh -system` reads `path` from the file `SLASHER_SYSTEM_PROJECT` names, or from `~/.config/slasher/system-project.toml`, and prints it. `test/automated/resolve-project/system.sh` is verified, and the automated suite is verified: 19 tests.

## Outcome 3 — a project in the registry is resolved by its name

### Cycle 1 — actuation

- **Hinge:** how a project in the registry is resolved by its name, as the `/projects` skill and the test invoke it.
- **Options:** `cd "$project" && system/foundation/resolve-project.sh some-checkout`, the bare name; `cd "$project" && system/foundation/resolve-project.sh -name some-checkout`, the name after a flag.
- **Decision / chat:** the engineer selected the bare name, as `/projects <name>` takes it. An argument that is not `-base` or `-system` is a name.

### Cycle 2 — observation

- **Hinge:** what the test reads about the effect of `resolve-project.sh some-checkout`.
- **Options:** `[ "$resolved" = "$control_checkout" ]`, the printed path compared exactly; *Not this*, for the engineer to name another.
- **Decision / chat:** the engineer selected the exact comparison.

### Cycle 3 — controls

- **Hinge:** what registry the test builds before it runs `resolve-project.sh some-checkout`.
- **Options:** two registered projects, `some-checkout` and `some-other-checkout`; one registered project, `some-checkout`. Each project is a git repository holding `slasher/system/`, which is how `read-consuming-projects.sh` finds a project, and the registry is named by `SLASHER_REGISTRY`.
- **Decision / chat:** the engineer selected two projects, so the test shows the name picks one project out of several.

### Cycle 4 — implementation

- **Hinge:** how resolving a project by its name comes about.
- **Options:** *One batch, increased rework risk (agent generates full implementation)*, rework risk 15%; *Controlled and calibrated increments (Red, Green, Refactor)*, rework risk 10%.
- **Decision / chat:** the engineer selected one batch.
- **Outcome:** any argument other than `-base` or `-system` is a name. `resolve-project.sh` runs `read-consuming-projects.sh` beside it and prints each registered project whose directory has that name. `test/automated/resolve-project/name.sh` is verified, and the automated suite is verified: 20 tests.

## Outcome 4 — the base project is not resolved without slasher.toml

- **Decision / chat:** the engineer selected this outcome next, over a name not in the registry, two projects with one name, and `/projects` running an instruction.

### Cycle 1 — actuation

- **Hinge:** how the base project is resolved when the parent directory holds no `slasher.toml`.
- **Options:** `cd "$project" && system/foundation/resolve-project.sh -base`, the invocation `base.sh` uses, in its own file, `test/automated/resolve-project/base-without-slasher-toml.sh`; *Not this*.
- **Decision / chat:** the engineer selected the invocation `base.sh` uses.

### Cycle 2 — observation

- **Hinge:** what the test reads about `resolve-project.sh -base` with no `slasher.toml`.
- **Options:** a non-zero exit; a non-zero exit and the script's own message on standard error; a non-zero exit and no path on standard output.
- **Decision / chat:** the engineer selected the non-zero exit.

### Cycle 3 — controls

- **Hinge:** what the test builds before it runs the script.
- **Options:** the project alone in its parent directory; the project and a sibling base directory, with only `slasher.toml` missing.
- **Decision / chat:** the engineer selected the project alone.

### Cycle 4 — implementation

- **Hinge:** how the failure comes about.
- **Outcome:** the test passed before any code was written. The script already exits non-zero, because `sed` cannot read the missing file. The hinge was degenerate, and the engineer kept the test as coverage. The automated suite is verified: 21 tests.

---

Authored by Scott Bellware on Sat Nov 7 2026 at 10:16:42 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 1:25:48 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 5:47:36 PM PT
