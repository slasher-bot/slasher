# Where should the /prose command feature be worked? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the /prose command feature be worked?

The options:

- **Branch only** — Create the branch feature/prose-command and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/prose-command and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-prose-command. This working tree stays on master.
- **The current branch** — Build it on master, where the working tree already is, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
