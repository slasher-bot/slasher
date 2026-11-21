# Feature — An item started directly is an implementation

**Tags:** [feature]

## Intent

**As the engineer stated it:** Do #4 unattended, with #4 the work item `2026-11-21T01-48-00Z-call-an-item-started-directly-an-implementation`, which reads: *When an item is started directly, call it an implementation rather than a featyre*.

**An item the engineer asks to start or do, without naming a kind, takes an implementation, not a feature.**

Realizes the work item `2026-11-21T01-48-00Z-call-an-item-started-directly-an-implementation`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/item-starts-an-implementation`
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

## Confirmations

- **2026-11-21** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-21** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-21** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 6:13:39 PM PT
