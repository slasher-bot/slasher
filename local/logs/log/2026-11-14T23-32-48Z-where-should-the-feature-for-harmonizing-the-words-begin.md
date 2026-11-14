# Where should the feature for harmonizing the words begin, start, end, conclude, and their like be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for harmonizing the words begin, start, end, conclude, and their like be built?

The options:

- **Branch only** — Create the branch feature/begin-start-end-conclude-harmonized and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/begin-start-end-conclude-harmonized and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-begin-start-end-conclude-harmonized. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
