# Feature — An item started directly is an implementation

**Tags:** [feature]

## Intent

**As the engineer stated it:** Do #4 unattended, with #4 the work item `2026-11-21T01-48-00Z-call-an-item-started-directly-an-implementation`, which reads: *When an item is started directly, call it an implementation rather than a featyre*.

**An item the engineer asks to start or do, without naming a kind, takes an implementation, not a feature.**

Realizes the work item `2026-11-21T01-48-00Z-call-an-item-started-directly-an-implementation`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/item-starts-an-implementation`
- **Base:** `10d2becb`, from `master`
- **Working location:** a branch and a worktree, at `../slasher-feature-worktree-item-starts-an-implementation`. The main working tree stays on `master`.
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none given.
- **Item:** `2026-11-21T01-48-00Z-call-an-item-started-directly-an-implementation`

## Plan, as accepted on 2026-11-21

1. Write the feature record Active and its log entry. Make the work item Progression, with its log entry. Commit them on master, on the engineer's selection.
2. Create the branch feature/worktree/item-starts-an-implementation in a new worktree at ../slasher-feature-worktree-item-starts-an-implementation.
3. An item is started directly when the engineer asks to start or do it without naming a kind, as in "Do #4 unattended".
4. An item started directly takes an implementation, not a feature. Its record is titled "Implementation — <name>" and tagged [implementation]. Its branch is implementation/<subject>.
5. A request that names a kind, as "Start #1 as an unattended feature", still creates that kind.
6. /item start and /start keep their meaning. They make an item Active and create no progression.
7. State this in the unattended rule, the items rule, and the progressions rule.
8. Check the compressed text of each changed rule, and repair it.
9. Compile the source, and run the suite.
10. Commit the change on the branch.

This feature is a feature, not an implementation, because the rules it changes were not yet in force when it was started.

## What happened

- An item the engineer asks to start or do, without naming a kind, takes an implementation: titled `Implementation — <name>`, tagged `[implementation]`, on an `implementation/<subject>` branch. A request that names a kind creates a progression of that kind. `/item start` and `/start` make an item Active and create no progression.
- The items rule, the progressions rule, and the unattended rule say so. The items rule's Progression state names a progression of any kind, not only a feature or an experiment.
- The compressed texts of the three rules are checked. Three repairs were made: the unattended rule names the items rule, and the items rule says a request naming a kind creates a progression of that kind, and what the Progression state means. Two directives of the items rule are left less precise, neither touched by this feature: where a brainstorm's reframed points sit, and the scope of the rule against code samples.
- The automated suite passes: 137 tests.

## Confirmations

- **2026-11-21** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-21** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-21** — Plan: Accept, selected by the engineer.
- **2026-11-21** — Concluding state: Completed, selected by the engineer.
- **2026-11-21** — Merge, worktree removal, and branch deletion: Merge, remove, and delete, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 6:13:39 PM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 6:17:03 PM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 6:19:32 PM PT
