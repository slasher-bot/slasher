# Where should the feature for the harmonized-states plan be worked? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for the harmonized-states plan be worked?

The options:

- **Branch only** — Create the branch feature/harmonized-states and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/harmonized-states and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-harmonized-states. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
