# Feature — A workspace project's own projects.toml

**Tags:** [feature]

## Intent

**As the engineer stated it:** Start an unattended feature for #1, with #1 the idea `2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml`.

**A workspace project can have its own `projects.toml`**, which lists its member projects. That list is added to the machine's list in `~/.config/slasher/projects.toml`. The machine's list keeps every setting that differs from one machine to another.

Realizes the idea `2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/workspace-projects-toml`
- **Base:** the commit holding this record as first written, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-workspace-projects-toml`
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T04-39-16Z-a-workspace-project-has-its-own-projects-toml`

## Plan, as accepted on 2026-11-19

1. Write the feature record and its log entry on master. Make the item "A workspace project can have its own projects.toml" Implementation, with its log entry. Commit them.
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

## Confirmations

- **2026-11-19** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-19** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-19** — Forecast: No forecast, selected by the engineer.
- **2026-11-19** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 9:36:34 PM PT
