# Where should the feature for "A pros and cons command for the last question" be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for "A pros and cons command for the last question" be built?

The options:

- **Branch only** — Create the branch feature/pros-and-cons-command and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/pros-and-cons-command and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-pros-and-cons-command. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
