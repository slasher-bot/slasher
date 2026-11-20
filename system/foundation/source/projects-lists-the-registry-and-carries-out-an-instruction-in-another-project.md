# Projects lists the registry, and carries out an instruction in another project

**Trigger:** When the engineer asks for the Slasher projects on this machine, or asks for an instruction to be carried out in another project, as with `/projects`, `/projects -workspace`, `/workspace`, `/system`, `/projects -system`, `/slasher-home`, `/projects -slasher-home`, or `/projects <name>`

**`/projects` lists the Slasher projects registered on this machine, from within any project on it.** It runs foundation's `list-projects.sh`, which reads the registry at `~/.config/slasher/projects.toml`, and the workspace list where there is one, and prints what the script reports. Where neither list exists, it says there is none.

**A workspace project may list its member projects in its own `projects.toml`, in its local directory.** That is the workspace list. It is read where the parent directory's `slasher.toml` names a workspace project, and is added to the registry: a project in both is listed once. An entry in it holds a path and nothing else, and the path is relative, read from the directory that holds `slasher.toml`, as in `path = "some-project"`. A setting that differs from one machine to another, such as `local` or `journal`, stays in the registry. `list-projects.sh` refuses a workspace entry that holds another setting, or an absolute path or one that starts with `~`, and names its line. Outside a workspace, only the registry is read.

**`/projects` with a target carries out an instruction in another project.** The target is one of four: `-workspace`, the project's workspace project, `-system`, the machine's system project, `-slasher-home`, the Slasher home directory, which holds the development version of Slasher, or a project's name in the registry. The instruction is the rest of what was typed, as in `/projects -workspace add the receipt idea` or `/projects some-store show its recent log`. `/workspace <instruction>` is an alias of `/projects -workspace <instruction>`, `/system <instruction>` of `/projects -system <instruction>`, and `/slasher-home <instruction>` of `/projects -slasher-home <instruction>`. Each does exactly what the command it names does.

**The target is resolved by foundation's `resolve-project.sh`, run from the root of the current project.** `slasher/system/foundation/resolve-project.sh -workspace`, `-system`, `-slasher-home`, or `<name>` prints the target's root. Where the project has no `slasher/` directory, it is `system/foundation/resolve-project.sh`. Where the script fails, report its message and do nothing more. It fails where `slasher.toml` or `system-project.toml` is missing, where the machine declares no Slasher home directory in `~/.config/slasher/slasher-home.toml`, where no registered project has the name, and where more than one has it. Any project can name `-slasher-home`. On a machine that declares no Slasher home directory, it does not resolve to a project.

**The target's own rules govern the act.** Before acting, run the target's loader, `slasher/system/foundation/load-rules.sh`, or `system/foundation/load-rules.sh` where it has no `slasher/` directory, from the target's root, and follow the rules it prints for that act. Then carry out the instruction under the target's root. A record written there is written by the target's conventions. A commit in the target waits for the engineer's selection, whatever the current project allows. Report what was done and where.

**With a target and no instruction, `/projects` prints the target's root.** It acts on nothing.

**The registry and the three configuration files are per-machine configuration, and stay outside every repository.** `slasher.toml` sits in the shared parent directory of a project and its workspace project, outside both. The workspace list is the one list inside a repository. It holds only relative paths, so it is correct on every machine, and it names a project because the project is in the workspace, not because it installed the workspace project. `/projects` does not change the registry, the workspace list, or any of the three files. It writes no project's name into the project the session is in, per the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule.

**Why:** an engineer with Slasher in several projects asks which they are, and moves ideas, patterns, and corrections between them. The answer to the first is on the machine rather than in any project, and the second needs the other project addressed from where the engineer is working. Its own rules govern it, because its conventions are the ones its records must keep.

**How to apply:** on `/projects`, run `list-projects.sh` and print its report. On `/projects` with a target, run `resolve-project.sh` from the current project's root, then the target's loader from the target's root, and carry out the instruction under the target's root by its rules. Ask before any commit in the target.

## Compressed

1. `/projects` lists the Slasher projects registered on this machine, from within any project. Run foundation's `list-projects.sh`, which reads `~/.config/slasher/projects.toml` and, in a workspace, the workspace list, and print its report. Where there is no list, say so.
2. `/projects -workspace <instruction>`, `/projects -system <instruction>`, `/projects -slasher-home <instruction>`, and `/projects <name> <instruction>` carry out the instruction in the workspace project, the machine's system project, the Slasher home directory, which holds the development version of Slasher, or the registered project with that name. `/workspace <instruction>` is an alias of `/projects -workspace <instruction>`, `/system <instruction>` of `/projects -system <instruction>`, and `/slasher-home <instruction>` of `/projects -slasher-home <instruction>`.
3. Resolve the target from the current project's root with `slasher/system/foundation/resolve-project.sh -workspace`, `-system`, `-slasher-home`, or `<name>`, or `system/foundation/resolve-project.sh` where there is no `slasher/` directory. It prints the target's root.
4. Where the script fails, report its message and do nothing more. It fails where `slasher.toml` or `system-project.toml` is missing, where `~/.config/slasher/slasher-home.toml` declares no Slasher home directory, and where no registered project, or more than one, has the name. On a machine that declares no Slasher home directory, `-slasher-home` does not resolve to a project.
5. Before acting, run the target's loader from the target's root: `slasher/system/foundation/load-rules.sh`, or `system/foundation/load-rules.sh` where the target has no `slasher/` directory. Follow the rules it prints for the act.
6. Carry out the instruction under the target's root, by the target's conventions. Report what was done and where.
7. A commit in the target waits for the engineer's selection, whatever the current project allows.
8. With a target and no instruction, print the target's root, and act on nothing.
9. The registry, `slasher.toml`, `system-project.toml`, and `slasher-home.toml` are per-machine and stay outside every repository. Do not change them or the workspace list. Write no project's name into the project the session is in.
10. The workspace list is `projects.toml` in the workspace project's local directory. It is the one list inside a repository. Read it where `slasher.toml`, in the shared parent directory of a project and its workspace project, names a workspace project. It is added to the registry, and a project in both is listed once.
11. A workspace entry holds only a relative path, read from the directory that holds `slasher.toml`. Settings stay in the registry. `list-projects.sh` refuses any other entry, an absolute path, or a path that starts with `~`, and names its line.
12. The workspace list names a project because it is in the workspace, not because it installed the workspace project.

## Compression

- 2026-11-02, compressed: checked: 11 directives, 11 kept, 0 less precise, 0 lost
- 2026-11-08, revised: `/projects` with a target carries out an instruction in that project; not re-checked
- 2026-11-18, revised: `/base` is an alias of `/projects -base`; not re-checked
- 2026-11-18, revised: `/system` is an alias of `/projects -system`; not re-checked
- 2026-11-18, revised: the base project is the workspace project, `-base` is `-workspace`, and `/base` is `/workspace`, a term swap the engineer settled; not re-checked
- 2026-11-19, revised: the `-slasher-home` target, and `/slasher-home` as its alias; not re-checked
- 2026-11-19, revised: the workspace list, a workspace project's own `projects.toml`; not re-checked
- 2026-11-19, re-checked: 59 directives, 45 kept, 5 less precise, 9 lost; 14 repairs; checked again in full: 59 directives, 59 kept, 0 less precise, 0 lost

## History

Until Thu Nov 19 2026 a workspace project had no list of its own. `/projects` read only the registry, and every list of projects stayed outside every repository.

Until Thu Nov 19 2026 `/projects` had no `-slasher-home` target, and `/slasher-home` did not exist.

Until Wed Nov 18 2026 the workspace project was the base project. Its target was `-base`, its alias `/base`, and its key in `slasher.toml` was `base-project`.

Until Wed Nov 18 2026 `/projects -system` had no alias in Slasher. The Slasher authoring source had a `/system` command of its own, set by a local rule. The engineer made `/system` a Slasher alias.

Until Wed Nov 18 2026 `/projects -base` had no alias. The engineer added `/base`.

Until Sun Nov 15 2026 this rule said "consuming project" for a Slasher project, and named the registry `consuming-projects.toml` and its reader `read-consuming-projects.sh` where it named them.

Until Sun Nov 8 2026 this rule was named projects-lists-the-machines-registry-of-slasher-projects and titled "Projects lists the machine's registry of Slasher projects". Listing was the whole of what `/projects` did, and it acted on no project it listed.

Related:

- the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule — why the registry stays outside every repository

---

Authored by Scott Bellware on Mon Nov 2 2026 at 9:02:21 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 6:02:06 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:44:42 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:54:23 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 2:51:05 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 2:53:31 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 3:20:28 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 8:56:08 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 9:39:05 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 10:05:09 PM PT
