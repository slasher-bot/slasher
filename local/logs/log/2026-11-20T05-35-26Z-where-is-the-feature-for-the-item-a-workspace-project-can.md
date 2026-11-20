# Where is the feature for the item "A workspace project can have its own projects.toml" built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the feature for the item "A workspace project can have its own projects.toml" built?

The options:

- **Branch only** — Create the branch feature/workspace-projects-toml and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/workspace-projects-toml and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-workspace-projects-toml. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
