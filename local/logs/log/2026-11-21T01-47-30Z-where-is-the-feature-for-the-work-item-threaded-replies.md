# Where is the feature for the work item "Threaded replies" built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the feature for the work item "Threaded replies" built?

The options:

- **Branch only** — Create the branch feature/threaded-replies and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/threaded-replies in a new worktree at ../slasher-feature-worktree-threaded-replies. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
