# Feature — A phase's commits are squashed into the implementation branch

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature #2", where #2 is the item `2026-11-07T08-27-35Z-a-phases-commits-are-squashed-into-the-implementation-branch`, titled *A phase's commits are squashed into the implementation branch*.

**When a phase concludes, its commits arrive on the implementation branch as one squashed commit, not merged with their history.** The item is the source of truth for what is settled. Its unsettled questions are settled before the rule changes: the squashed commit's message, whether the phase's branch is kept, and whether a phase that does not merge is affected.

The work changes a rule and no script, so it is content work, and runs through no hinges, per the local design-by-efferent-does-not-govern-content-work rule.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/phase-commits-squashed`
- **Base:** the commit on `master` that adds this record
- **Working location:** branch and worktree, chosen at the start. The worktree is `../slasher-feature-worktree-phase-commits-squashed`, and the main working tree stays on `master`.
- **Participation:** none asked. The work is content work.
- **Verdict:** it concludes without an engineer's verdict, selected at the start.

## Confirmations

- **2026-11-08** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-11-08** — The feature concludes without an engineer's verdict, selected by the engineer at the start.
- **2026-11-08** — No participation was asked. The work is content work, which the local rule keeps out of the hinges.

---

Authored by Scott Bellware on Sun Nov 8 2026 at 8:41:28 PM PT
