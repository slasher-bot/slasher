# Work Session — Relocatable local directory

This work session started as a plan proposed for one idea: that a project's `local` directory can be located in any directory. The engineer settled the open decisions one at a time, then started a feature, which built the capability unattended and was merged to `master`.

This is the communicable record of the work session, a guided tour. The item, the feature record, the loop record, the rule, and the log entries it points to are the source of truth.

## 1. A plan before a feature

The engineer stopped the creation question for the feature and asked for a plan first. The agent proposed one script that finds the directory, every script asking it, one rule, and tests, with four decisions left to the engineer. The engineer recorded the practice of proposing a plan before starting a feature as an idea.

- Item: `2026-11-17T04-09-35Z-propose-a-plan-before-starting-a-feature`, Open

## 2. The decisions

The engineer settled each decision, and each is a dated resolution in the item:

- The registry key is `local`, beside `journal`.
- A configured directory that does not exist stops with an error. Nothing falls back.
- A record is committed in the git repository that holds the relocated directory.
- Every worktree uses the one relocated directory. The engineer asked for the options, their pros and cons, and a recommendation, and noted that the capability is used in content projects, where branches are rarer.

- Item: `2026-11-16T05-06-34Z-a-projects-local-directory-can-be-located-in-any-directory`, Realized

## 3. The feature, unattended

The engineer chose a branch and worktree, unattended work, and no forecast, and accepted a ten-step plan. `local-directory.sh` was written test first. A worktree reads its project's entry through the common git directory. The loader, the session-start notice, the status line, the plugin build, the installer's migrations, and two hooks ask it. Where no git repository holds the directory, a record is not committed, and the reply says so. The agent decided this, and the plan the engineer accepted named it.

- Feature record: `2026-11-17T04-44-33Z-relocatable-local-directory`, Completed
- Loop record: `2026-11-17T04-51-24Z-relocatable-local-directory`
- Rule: the a-projects-local-directory-may-be-relocated-by-its-registry-entry rule

## 4. The conclusion

The engineer concluded the feature Completed. It merged to `master` cleanly, the automated suite passed there with 93 tests, and the branch and worktree were deleted.

## Takeaways

- `slasher/local/` in every rule means the project's local directory, wherever its registry entry puts it.
- `local-directory.sh` is the one place that finds it.
- Every worktree shares a relocated directory, so its records never merge.
- A record outside any git repository is not committed, and the reply says so.

## Glossary

- **local directory**: the directory that holds a project's own rules, vocabulary, journal, logs, items, progressions, and migration records. `slasher/local/` by default.
- **relocated**: of a local directory, placed outside the project by the `local` key in the project's registry entry.
- **project registry**: `~/.config/slasher/projects.toml`, the per-machine list of Slasher projects and their settings.

## Where the durable records live

- Rule: `system/foundation/source/a-projects-local-directory-may-be-relocated-by-its-registry-entry.md`
- Script: `system/foundation/local-directory.sh`, and its tests in `test/automated/local-directory/`
- The items, feature record, and loop record named above
- Commits: `ac090d9c` through `4e463ab0` on `master`

---

Authored by Scott Bellware on Mon Nov 16 2026 at 20:58:10 PT
