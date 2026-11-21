# Where is the feature for the work item "Call an item started directly an implementation" built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the feature for the work item "Call an item started directly an implementation" built?

The options:

- **Branch only** — Create the branch feature/item-starts-an-implementation and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/item-starts-an-implementation in a new worktree at ../slasher-feature-worktree-item-starts-an-implementation. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
