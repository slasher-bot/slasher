# Where is the feature for the work item "/status says whether the record is ready to conclude" built? — The current branch, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the feature for the work item "/status says whether the record is ready to conclude" built?

The options:

- **Branch only** — Create the branch feature/status-readiness and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/status-readiness in a new worktree at ../slasher-feature-worktree-status-readiness. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **The current branch**
