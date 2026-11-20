# A workspace project can have its own projects.toml

**State:** Realized

**Tags:** [idea]

A workspace project can have its own `projects.toml`.

Its implementation is the feature `2026-11-20T05-36-34Z-workspace-projects-toml`.

## Suggestions — Thu Nov 19 2026

The agent made these suggestions for the decisions the idea leaves open. None of them is settled.

The workspace project commits a small list of its member projects. That list is added to the machine's list. The machine's list keeps every setting that differs from one machine to another.

1. **The workspace list is added to the machine list. It does not replace it.**
   - `/projects` prints the machine list and the workspace list together, and shows each project once.
   - Where a project is in both lists, the settings in the machine list apply.
   - Where there is no machine list but there is a workspace list, `/projects` uses the workspace list. It does not stop with "No registry".

2. **The file is committed, and its paths are relative.**
   - The file is `slasher/local/projects.toml` in the workspace project, beside the project's other records.
   - Each path is the name of a directory next to the workspace project, as in `path = "constant"`. The parent directory's `slasher.toml` already names the workspace project this way, as in `workspace-project = "slasher"`. So the file is correct on every machine.
   - The a-project-does-not-name-its-downstream-consumers-in-its-own-files rule does not apply. These projects are named because they are in the workspace, not because they installed it.

3. **An entry holds only a path.**
   - Settings such as `local` and `journal` can be different on each machine. They stay in `~/.config/slasher/projects.toml`.
   - A workspace entry that holds any other setting is refused, and the error names its line, as the errors for the machine list already do.

4. **Two scripts read the file, and only in a workspace.**
   - `list-projects.sh` and `resolve-project.sh <name>` read it. Every command that lists or reaches a project uses one of these two scripts.
   - They read it only where the parent directory's `slasher.toml` names a workspace project. Outside a workspace, nothing changes.
   - `resolve-project.sh` already refuses a name that two projects have. That check applies to the two lists together.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 8:39:16 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 9:27:49 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 9:36:34 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 10:13:48 PM PT
