# Where should the feature for the idea "A journal can be configured as private entirely" be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for the idea "A journal can be configured as private entirely" be built?

The options:

- **Branch only** — Create the branch feature/fully-private-journal and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/fully-private-journal and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-fully-private-journal. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
