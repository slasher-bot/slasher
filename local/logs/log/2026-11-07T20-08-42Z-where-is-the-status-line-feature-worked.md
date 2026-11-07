# Where is the status-line feature worked? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the status-line feature worked?

The options:

- **Branch only** — Create the branch feature/status-line-second-line and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/status-line-second-line and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-status-line-second-line. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge. Only for work without a verdict.

The engineer's answer: **Branch and worktree**
