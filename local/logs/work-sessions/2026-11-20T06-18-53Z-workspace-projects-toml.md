# Work Session — A workspace project's own projects.toml

The work session started with an idea that held one sentence: a workspace project can have its own `projects.toml`. It became a set of suggestions for the decisions the idea left open, then an unattended feature that built them. It ended with a check of the `/projects` rule's compressed text, which found gaps from this feature and from four earlier revisions, and with the feature Completed on `master`.

This is the communicable record of the work session, a guided tour. The durable records it points to are the source of truth.

## 1. The idea, explained

The engineer listed the current items with `/i` and asked for the idea `2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml` to be explained. The idea held only its title. The explanation set it beside what existed: every Slasher project on the machine is listed in one per-machine file, `~/.config/slasher/projects.toml`, and the **workspace project** is the project a group of sibling projects shares, named by `slasher.toml` in their parent directory. The workspace project had no list of its own. The idea left open whether its list replaces the machine's list or is added to it, where the file sits, and which commands read it.

## 2. Suggestions for the open decisions

The engineer asked for suggestions, then asked for them to be added to the idea. They were added as a dated section that says none of them is settled (commit `853776ae`):

- The **workspace list** is added to the machine's list, and a project in both is listed once.
- The file is committed, in the workspace project's local directory, and its paths are relative, so it is correct on every machine.
- A workspace entry holds only a path. Settings that differ between machines, such as `local` and `journal`, stay in the machine's list.
- `list-projects.sh` and `resolve-project.sh <name>` read it, and only in a workspace.

## 3. The feature, created and planned

The engineer asked for an unattended feature for the idea. The working location was branch and worktree, and the work stated no forecast. The plan was accepted as written. The feature record `2026-11-20T05-36-34Z-workspace-projects-toml` was written Active on `master`, and the idea took the state Progression (commit `b9e3c217`).

## 4. The build

Five cycles, recorded in the loop record `2026-11-20T05-41-23Z-workspace-projects-toml`, each began with a test that failed:

- The normal path: the two lists are read together, each project once.
- No machine list: the workspace list is read alone.
- A workspace entry with another setting, an absolute path, or a path that starts with `~` is refused, and the error names its line.
- `resolve-project.sh <name>` finds a project only the workspace list names. No code was written for it. It reads `list-projects.sh`.

`list-projects.sh` finds the workspace list with `local-directory.sh`, so a relocated local directory is honored. A relative path that names an existing directory is read to its full path, so the two lists compare equal. The projects rule, its skill, and its help name the workspace list (commit `c4846888`).

## 5. The compressed text, checked

The engineer asked whether the feature was ready to complete. The answer named one gap: the rule's compressed text had been revised and not checked, as with its earlier revisions. The engineer asked for the check.

The **compressed text** is the shorter version of a rule that the loader prints and the agent follows. Its check is two fresh agents: a lister, which lists the directives of the body, and a checker, which judges each against the compressed text as kept, less precise, or lost. Of 59 directives, 45 were kept, 5 were less precise, and 9 were lost. Five came from this feature's revision, and nine from four earlier revisions recorded as *not re-checked*. Each was repaired, and a second checker kept all 59 (commit `83216753`).

## 6. The conclusion

`master` had gained one unrelated commit. The branch was rebased onto it, the suite passed, and `master` was fast-forwarded. The feature is Completed, the idea is Realized, and the branch and the worktree are deleted (commit `33b1e354`).

## Takeaways

- A workspace project's `projects.toml` lists its member projects by relative path, and is added to the machine's list.
- A list committed in a repository holds only what is the same on every machine.
- An unchecked compressed text can drift from its body over several revisions. Recording *not re-checked* did not stop the drift.

## Glossary

- **workspace project** — the project a group of sibling projects shares, named by `workspace-project` in `slasher.toml` in their parent directory.
- **workspace list** — `projects.toml` in the workspace project's local directory, listing its member projects by relative path.
- **registry** — the machine's list of Slasher projects, `~/.config/slasher/projects.toml`, which also holds each project's per-machine settings.
- **compressed text** — the shorter version of a rule, in its `## Compressed` section, which the loader prints.

## Where the durable records live

- The idea: `local/items/2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml.md`
- The feature record: `local/progressions/2026-11-20T05-36-34Z-workspace-projects-toml.md`
- The loop record: `local/logs/loops/2026-11-20T05-41-23Z-workspace-projects-toml.md`
- The rule: the projects-lists-the-registry-and-carries-out-an-instruction-in-another-project rule
- The code: `system/foundation/list-projects.sh`, and the tests under `test/automated/list-projects/` and `test/automated/resolve-project/`
- The log entries under `local/logs/log/` dated 2026-11-20, from `05-35-26Z` to `06-13-48Z`

---

Authored by Scott Bellware on Thu Nov 19 2026 at 22:18:53 PT
