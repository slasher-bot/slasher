# Work Session — Harmonized states (2026-11-09)

This work session began with a request to discontinue a work item, and items had no Discontinued state. It became a comparison of the states and commands of items and implementations, a plan to give both one set of each, and a feature that built the plan. It ended with the feature Completed and merged, and the plan Realized.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the item `2026-11-09T23-10-40Z-a-discontinued-state-for-items-and-a-discontinue-command`, the superseded plan `2026-11-10T00-13-50Z-item-and-implementation-states-and-commands-are-harmonized`, the restated plan `2026-11-10T00-58-24Z-item-and-implementation-states-and-commands-are-harmonized-restated`, the feature record `2026-11-10T04-49-07Z-harmonized-states`, the migration record `2026-11-10T05-05-09Z-existing-records-take-the-harmonized-states`, and the log.

## 1. A Discontinued state for items

The engineer asked to discontinue the work item to adopt a version number scheme, and items had no such state. The engineer recorded the idea of a Discontinued state and a `/discontinue` command, and it was built on `master`. **Discontinued** means stopped, with no plan to do it. The version-scheme item was left Open, since no state was chosen for it.

## 2. Comparing items and implementations

A comparison of the two sets of states and commands found four gaps. A Suspended item could not be brought back. The conclude commands followed the kind of record rather than whether it had a forecast. Deferred and Discontinued overlapped. Items used `/reopen` where implementations used `resume`.

## 3. The plan, settled and restated

The engineer settled the plan one decision at a time, and the plan was restated once the decisions had moved past its first text. The settled design, in short:

1. Each kind of item starts and concludes in its own states: an idea, an improvement, and a plan are Realized; a work item and a rework item are Done; a correction and a mistake are Corrected; a problem is Resolved; a goal and an aspiration start Recorded and are Realized when the engineer says so; a design and an observation stay Recorded.
2. A feature or an experiment can conclude Completed, Affirmed, Refuted, or Inconclusive, whether or not it has a forecast.
3. Every record that changes state takes Deferred, Suspended, Discontinued, Obsolete, Superseded, and Abandoned.
4. The commands are paired by meaning, and each state-change command acts on an item, a feature, or an experiment. `/reopen` is removed, and `/resume` takes back any concluding state.

A second pass found nine open matters, which the engineer settled or deferred: what state resume returns an item to, that any terminal state can be reversed, that a goal can be made Active, what `/complete` gives an implementation, that `new` creates the branch, and that `[idea]` has primacy over `[design]`.

## 4. The feature

The engineer started the feature in a branch and worktree, with no forecast, unattended for its code. The rules and commands were content work, written directly. The plan's nine tasks were built in four commits: the rules, the commands, the scripts, and the migration of existing records. The scripts were changed test first. The migration made the eleven items tagged `[design]` alone Recorded, three of them in place of Abandoned or Superseded, each with a dated addition naming its earlier state.

## 5. The Implementation state

During the feature the engineer added a rule: when an item turns into an implementation, it takes the state **Implementation**. It follows the implementation: when the implementation is Completed or Affirmed, the item takes its kind's concluding state, and otherwise the engineer is asked.

## 6. The check, and the conclusion

The engineer asked for the compressed text of the seven revised rules to be checked against their bodies. The check found a contradiction in the items rule, a correction concluding both Done and Corrected, and a lost directive in the implementations rule. Both were repaired and checked again. The feature was then Completed and merged into `master`, its branch and worktree removed, and the plan Realized.

## Takeaways

- Items and implementations take one set of states and one set of commands.
- A record's kind decides its starting and concluding states. A forecast decides only whether `/complete` asks which concluding state.
- Any concluding state can be taken back with `/resume`.
- An item that turns into an implementation is Implementation until the implementation concludes.

## Glossary

- **Discontinued** — stopped, with no plan to do it. **Deferred** is kept to do later.
- **Corrected** — what was wrong is put right. The concluding state of a correction and a mistake.
- **Resolved** — the problem no longer stands. The concluding state of a problem.
- **Implementation** — the state of an item whose work a feature or an experiment carries.

## Where the durable records live

- The rules: the-items-directory-holds-one-file-per-item, the-implementations-directory-holds-one-record-per-implementation, an-implementation-runs-on-a-branch-to-a-declared-end, a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state, a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case, a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows, and the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice.
- The commands: the `item`, `feature`, and `experiment` skills, and the state-change skills from `start` to `resume`.
- The items, the feature record, and the migration record named above, and the log entries dated 2026-11-09 and 2026-11-10.

---

Authored by Scott Bellware on Mon Nov 9 2026 at 9:44:18 PM PT
