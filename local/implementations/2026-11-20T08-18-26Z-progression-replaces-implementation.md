# Feature — Progression replaces implementation

**Tags:** [feature]

## Intent

**As the engineer stated it:** Start a worktree feature for #3 unattended, with #3 the work item `2026-11-20T07-31-09Z-progression-replaces-implementation`.

**Progression replaces implementation** as the name of a bounded piece of work on its own branch, carried to a declared end, and a progression's file is a progression record. The rename reaches the rules, the vocabulary, the scripts, the skills, `install.sh`, and this repository's own records, as the work item settles. The migration record `2026-11-20T08-18-26Z-implementation-becomes-progression` plans the change in each repository.

Realizes the work item `2026-11-20T07-31-09Z-progression-replaces-implementation`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/progression-replaces-implementation`
- **Base:** the commit holding this record as first written, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-progression-replaces-implementation`
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T07-31-09Z-progression-replaces-implementation`

## Plan, as accepted on 2026-11-20

1. Write the feature record Active and its log entry on master. Make the item Implementation, with its log entry.
2. Write the migration record in local/migration/ on master. It states the source, the destination, the increments in order, and what holds in between. Commit them.
3. Create the branch feature/worktree/progression-replaces-implementation in a worktree at ../slasher-feature-worktree-progression-replaces-implementation.
4. Write the install.sh tests first. Write one test for each change: the directory, the item state line, the branch line in records that have not concluded, the Implementation line in items, the paths in items, the record text, and the file names.
5. Implement each change in install.sh, so that its test passes.
6. Change the status line script and every other script to read progressions/ and the Progression branch line. Update their tests.
7. Rename the rules. Change their text only where implementation means the record.
8. Add progression and progression record to the foundation vocabulary, with the substitution.
9. Change the skills, their help, and the command table.
10. Conform this repository's own records with the same changes. Do not run install.sh here. Leave the journal entries as written.
11. Conform the idea to "Progressions can be created and started directly".
12. Check the compressed text of each changed rule, and repair it.
13. Write the loop record. Compile the source, and run the suite.
14. Commit the change on the branch.

## Confirmations

- **2026-11-20** — Participation: Unattended, stated by the engineer in the request. The agent's confidence was last estimated at 65%, with the warning line shown.
- **2026-11-20** — Working location: Branch and worktree, stated by the engineer in the request.
- **2026-11-20** — Forecast: No forecast, selected by the engineer.
- **2026-11-20** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 12:18:26 AM PT
