# Work Session — /package update runs the installer's migrations

This work session started with a question: does an install migrate a Slasher project? It found that the migrations ran only when `install.sh agents-md` was run by hand after an update. It became a work item, and a feature that made `/package update` run the pulled installer's migrations. It ended with the feature merged and the item Completed.

This is the communicable record of the work session, a guided tour. The item, the feature record, the loop record, the rule, and the log entries it points to are the source of truth.

## 1. Two steps

The engineer asked whether the install migrates a Slasher project, and whether `/packages update` does. `install.sh agents-md` runs the migrations. `/package update` and `/packages update` pull the packages and run none. A project needed both, in that order, so that the newly pulled installer ran. The agent recommended that the update run the pulled installer's migrations itself, and the engineer had it recorded as a work item.

- Item: `2026-11-17T07-48-33Z-package-update-runs-the-installers-migrations`, Completed

## 2. The feature, unattended

The engineer chose a branch and worktree, unattended work, and no forecast, and accepted a nine-step plan. The installer gained a **migrate mode**, which runs its migrations alone, asks nothing, places nothing a project has not got, and prints only what it changed. `refresh-packages.sh` runs that mode after the pull, where the pulled installer has it. Fresh agents checked the update rule's changed compressed text. Two gaps were repaired. On the re-check, the two checkers disagreed on one point, and the source decided it.

- Feature record: `2026-11-17T07-50-01Z-update-runs-migrations`, Completed
- Loop record: `2026-11-17T07-55-01Z-update-runs-migrations`
- Rule: the package-refresh-and-install-run-foundations-scripts rule

## 3. The conclusion

The engineer concluded the feature Completed. Master had gained two commits from another session, which added items only, so the merge was clean. The automated suite passed on `master` with 114 tests, and the branch and worktree were deleted.

## Takeaways

- One `/package update` brings a Slasher project both its new packages and their migrations.
- `install.sh migrate` asks nothing, so it can run inside an update with no one to answer.
- Adding the import line to an `AGENTS.md` with no Slasher section still needs the engineer's consent.

## Glossary

- **migrate mode**: `install.sh migrate`, which runs the installer's migrations alone, asks nothing, and prints only what it changed.

## Where the durable records live

- Scripts: `system/foundation/install.sh` and `system/foundation/refresh-packages.sh`, with tests in `test/automated/install-migrate/` and `test/automated/refresh-packages/migrations.sh`
- The item, feature record, and loop record named above
- Commits: `b9741890` through `b107017e` on `master`

---

Authored by Scott Bellware on Tue Nov 17 2026 at 00:03:36 PT
