# Where should the feature for the /records command and the configurable records line be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for the /records command and the configurable records line be built?

The options:

- **Branch only** — Create the branch feature/records-command and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/records-command and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-records-command. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
