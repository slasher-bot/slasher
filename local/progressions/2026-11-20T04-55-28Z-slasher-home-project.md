# Feature — A built-in slasher-home project

**Tags:** [feature]

## Intent

**As the engineer stated it:** Start an unattended feature for #1, with #1 the idea `2026-11-20T02-52-38Z-a-built-in-slasher-home-project`.

**`/projects -slasher-home <instruction>`, and its short form `/slasher-home <instruction>`, carry out the instruction in the Slasher home directory**, the directory that holds the development version of Slasher. The machine's Slasher config directory declares where it is. Where it declares none, the target does not resolve to a project.

Realizes the idea `2026-11-20T02-52-38Z-a-built-in-slasher-home-project`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/slasher-home-project`
- **Base:** `09a8a2db`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-slasher-home-project`
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T02-52-38Z-a-built-in-slasher-home-project`

## Plan, as accepted on 2026-11-19

1. Write the feature record and its log entry on master, and make the idea Progression.
2. Create the branch at the selected location.
3. Write the test for -slasher-home first. It prints the path that a slasher-home.toml file declares.
4. Write the test for a missing slasher-home.toml. The script fails and prints nothing.
5. Implement the -slasher-home case in resolve-project.sh, so that both tests pass. SLASHER_HOME_PROJECT names another file for a test.
6. Add the /slasher-home skill, as /system is made.
7. Name -slasher-home in the projects skill, its help, and the projects rule.
8. Write the loop record for the code.
9. Compile the source, and run the suite.
10. Commit the change on the branch.

## What happened

- `resolve-project.sh -slasher-home` prints the path that `~/.config/slasher/slasher-home.toml` declares. `SLASHER_HOME_PROJECT` names another file in its place, for a test.
- Where the file is missing, or declares no path, the script prints *No Slasher home directory is declared in <file>* and exits 1. The target then does not resolve to a project.
- A leading `~` in the declared path is the home directory, so the path may be written `~/projects/slasher/slasher`.
- `/slasher-home <instruction>` is an alias of `/projects -slasher-home <instruction>`.
- The projects rule, its compressed text, the projects skill, and its help name the new target and its alias. The compressed text is not checked again, as with the rule's earlier revisions.
- Three tests: `test/automated/resolve-project/slasher-home.sh`, `test/automated/resolve-project/slasher-home-without-slasher-home-toml.sh`, and `test/automated/resolve-project/slasher-home-under-the-home-directory.sh`.
- The loop record is `2026-11-20T04-56-25Z-slasher-home-project`.
- The automated suite passes: 124 tests.
- This machine's `slasher-home.toml` declares `~/projects/slasher/slasher`.

## Confirmations

- **2026-11-19** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-19** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-19** — Forecast: No forecast, selected by the engineer.
- **2026-11-19** — Plan: Accept, selected by the engineer.
- **2026-11-19** — Conclusion: Completed, requested by the engineer with `/feature Complete`.
- **2026-11-19** — Branch deletion and worktree removal: Delete the branch and worktree, selected by the engineer.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 20:55:28 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 20:57:44 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 21:05:17 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 21:17:03 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 21:18:20 PT
