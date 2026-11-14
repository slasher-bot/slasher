# Where should the feature that leaves out the load line when Claude Code is started with /load be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature that leaves out the load line when Claude Code is started with /load be built?

The options:

- **Branch only** — Create the branch feature/load-line-omitted-when-started-with-load and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/load-line-omitted-when-started-with-load and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-load-line-omitted-when-started-with-load. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
