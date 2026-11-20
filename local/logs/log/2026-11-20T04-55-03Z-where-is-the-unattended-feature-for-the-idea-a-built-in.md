# Where is the unattended feature for the idea "A built-in slasher-home project" built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the unattended feature for the idea "A built-in slasher-home project" built?

The options:

- **Branch only** — Create the branch feature/slasher-home-project and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/slasher-home-project and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-slasher-home-project. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
