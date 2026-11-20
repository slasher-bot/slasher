# Feature — A workspace project's own projects.toml

**Tags:** [feature]

## Intent

**As the engineer stated it:** Start an unattended feature for #1, with #1 the idea `2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml`.

**A workspace project can have its own `projects.toml`**, which lists its member projects. That list is added to the machine's list in `~/.config/slasher/projects.toml`. The machine's list keeps every setting that differs from one machine to another.

Realizes the idea `2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/workspace-projects-toml`
- **Base:** `b9e3c217`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-workspace-projects-toml`
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml`

## Plan, as accepted on 2026-11-19

1. Write the feature record and its log entry on master. Make the item "A workspace project can have its own projects.toml" Progression, with its log entry. Commit them.
2. Create the branch feature/worktree/workspace-projects-toml in a worktree at ../slasher-feature-worktree-workspace-projects-toml.
3. Write the test first: list-projects.sh, run in a workspace, lists the projects in the machine list and the projects in the workspace list together, each once.
4. Write a test: with no machine list, list-projects.sh lists the workspace list's projects.
5. Write a test: a workspace entry with a setting other than path is refused, and the error names its line.
6. Write a test: a workspace entry with an absolute path or a path that starts with ~ is refused.
7. Write a test: resolve-project.sh <name> finds a project that only the workspace list names.
8. Implement each test's case in list-projects.sh. The workspace list is projects.toml in the workspace project's local directory. A relative path is read from the directory that holds slasher.toml.
9. Outside a workspace, nothing changes. The existing tests still pass.
10. Name the workspace list in the projects rule, the projects skill, and its help.
11. Write the loop record for the code.
12. Compile the source, and run the suite.
13. Commit the change on the branch.

## What happened

- `list-projects.sh`, run in a workspace, reads `projects.toml` in the workspace project's local directory beside the registry, and lists the projects in both, each once. The workspace is the one `slasher.toml`, in the directory above the project, names.
- A workspace entry holds only a path. The path is relative, read from the directory that holds `slasher.toml`. Another setting, an absolute path, or a path that starts with `~` is refused, and the error names its line.
- Where there is no registry but there is a workspace list, the workspace list is listed.
- `resolve-project.sh <name>` finds a project only the workspace list names, since it reads `list-projects.sh`.
- Outside a workspace, nothing changes.
- The projects rule, its compressed text, the projects skill, and its help name the workspace list.
- The compressed text was checked against the body on 2026-11-19, as the engineer asked. Of 59 directives, 45 were kept, 5 were less precise, and 9 were lost: 5 from this feature's revision, and 9 from earlier revisions that were not checked. Each was repaired, and a second check in full kept all 59.
- Six tests: `test/automated/list-projects/workspace.sh`, `workspace-without-machine-registry.sh`, `workspace-entry-with-another-setting.sh`, `workspace-entry-with-an-absolute-path.sh`, `workspace-entry-with-a-path-under-the-home-directory.sh`, and `test/automated/resolve-project/name-in-the-workspace-list.sh`.
- The loop record is `2026-11-20T05-41-23Z-workspace-projects-toml`.
- The automated suite passes: 130 tests.

## Confirmations

- **2026-11-19** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-19** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-19** — Forecast: No forecast, selected by the engineer.
- **2026-11-19** — Plan: Accept, selected by the engineer.
- **2026-11-19** — Conclusion: Completed, requested by the engineer with `/feature complete`. The branch was rebased onto `master`, which had gained one unrelated commit, and `master` was fast-forwarded to it.
- **2026-11-19** — Branch deletion and worktree removal: Delete the branch and worktree, selected by the engineer. The branch was never pushed.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 9:36:34 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 9:41:23 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 10:05:09 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 10:13:48 PM PT
