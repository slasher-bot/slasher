# "Progression — Test" will be created Open, not started. Where should its branch be created? — The current branch, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> "Progression — Test" will be created Open, not started. Where should its branch be created?

The options:

- **Branch only** — Create the branch progression/test and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as progression/worktree/test and check it out in a new worktree: a second working directory at ../slasher-progression-worktree-test. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **The current branch**
