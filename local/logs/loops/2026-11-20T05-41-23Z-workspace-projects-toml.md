# Loop record — A workspace project's own projects.toml

`list-projects.sh`, run in a workspace, reads the workspace project's own `projects.toml` beside the machine's registry, and lists the projects in both, each once. A workspace entry holds only a relative path. `resolve-project.sh <name>` finds a project the workspace list names, since it reads `list-projects.sh`. It is the code half of the feature `2026-11-20T05-36-34Z-workspace-projects-toml`.

**Mode:** unattended.

## Cycle 1 — the normal path

- **Hinge, actuation:** `list-projects.sh`, run from a project's root, with no new argument. The workspace is found from the directory the script runs in, as `resolve-project.sh -workspace` finds it, so no command changes its use site.
- **Hinge, observation:** the paths printed on standard output, compared with the sorted union of the two lists. The existing `entries.sh` test reads the same effect the same way.
- **Hinge, controls:** a temporary parent directory holding `slasher.toml`, a workspace project with `slasher/local/projects.toml`, a member that only the workspace list names, a project that only the machine list names, and a project that both lists name. The project in both lists is the one the script runs in, so the test also shows that it is listed once.
- **Hinge, implementation:** written directly. The registry's reading loop became a function, `read_list`, run on the registry and then on the workspace list. The workspace list is found with `local-directory.sh`, run from the workspace project's root, so a relocated local directory is honored. A relative path is joined to the directory that holds `slasher.toml`, and a directory that exists is read to its full path, so `../other/some-project` and an absolute path in the registry compare equal.
- **Hinge, naming:** *Lists the projects in the machine list and the workspace list, each once*.
- **Outcome:** `test/automated/list-projects/workspace.sh` failed before the change, with only the machine list's projects printed. It passes with the change.

## Cycle 2 — no machine list

- **Hinge, actuation:** the same, in its own file.
- **Hinge, observation:** the printed path of the one workspace member.
- **Hinge, controls:** `SLASHER_REGISTRY` names a file that does not exist, written `some-missing-projects.toml`.
- **Hinge, implementation:** the script stops with *No registry* only where there is neither a machine list nor a workspace list.
- **Hinge, naming:** *When there is no machine list, lists the workspace list's projects*.
- **Outcome:** `test/automated/list-projects/workspace-without-machine-registry.sh` failed with *No registry*, and passes with the change.

## Cycle 3 — a workspace entry with another setting

- **Hinge, actuation:** the same, in its own file, since it is an exceptional path.
- **Hinge, observation:** a non-zero exit status, and an error on standard error that names the workspace list and line 3, the line that holds the setting.
- **Hinge, controls:** a workspace entry with `journal = "private"` under its path.
- **Hinge, implementation:** a name other than `path` in the workspace list is refused, and the error says to put the setting in the registry. The registry still skips such a line, since its settings are read by `read-project-setting.sh`.
- **Hinge, naming:** the condition *When a workspace entry holds a setting other than path* encloses *Fails, naming its line*.
- **Outcome:** `test/automated/list-projects/workspace-entry-with-another-setting.sh` failed with *No registry* before the change, and passes with it.

## Cycle 4 — a workspace entry with a path that is not relative

- **Hinge, actuation:** the same, in two files, one for each condition: an absolute path, and a path that starts with `~`.
- **Hinge, observation:** a non-zero exit status, and an error that names the workspace list and line 2.
- **Hinge, controls:** `path = "$control_project"` in one file, and `path = "~/some-project"` in the other.
- **Hinge, implementation:** a workspace path that starts with `/`, or is `~` or starts with `~/`, is refused. The workspace list is committed, so a path that names one machine's directories is not correct on another.
- **Hinge, naming:** *When a workspace entry holds an absolute path* and *When a workspace entry holds a path that starts with ~*, each enclosing *Fails, naming its line*.
- **Outcome:** `test/automated/list-projects/workspace-entry-with-an-absolute-path.sh` and `test/automated/list-projects/workspace-entry-with-a-path-under-the-home-directory.sh` failed before the change, and pass with it.

## Cycle 5 — a name only the workspace list holds

- **Hinge, actuation:** `resolve-project.sh some-workspace-member`, run from a project in the workspace.
- **Hinge, observation:** the root printed on standard output, compared with the workspace member's directory.
- **Hinge, controls:** the workspace of cycle 1, with no machine list.
- **Hinge, implementation:** none was written. `resolve-project.sh <name>` reads `list-projects.sh`, so cycle 1's change reaches it.
- **Hinge, naming:** *Prints the root of a project that only the workspace list names*.
- **Outcome:** `test/automated/resolve-project/name-in-the-workspace-list.sh` failed with *No project named some-workspace-member is in the registry* before cycle 1's change, and passes with it.

## Outcome

- The automated suite passes: 130 tests.
- The projects rule, its compressed text, the projects skill, and its help name the workspace list.
- The compressed text was checked against the body, repaired, and checked again in full. All 59 directives are kept.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 21:41:23 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 22:05:09 PT
