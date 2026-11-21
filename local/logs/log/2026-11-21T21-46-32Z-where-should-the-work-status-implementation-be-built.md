# Where should the /work-status implementation be built? — The current branch, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the /work-status implementation be built?

The options:

- **Branch and worktree** — Create the branch as implementation/worktree/work-status and check it out in a new worktree at ../slasher-implementation-worktree-work-status. This working tree stays on master.
- **Branch only** — Create the branch implementation/work-status and switch this working tree to it. At the conclusion this working tree switches back.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **The current branch**
