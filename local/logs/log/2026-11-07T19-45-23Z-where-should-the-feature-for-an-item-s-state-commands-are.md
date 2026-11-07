# Where should the feature for "An item's state commands are typed without the /item prefix" be worked? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for "An item's state commands are typed without the /item prefix" be worked?

The options:

- **Branch only** — Create the branch feature/item-state-commands-without-prefix and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/item-state-commands-without-prefix and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-item-state-commands-without-prefix. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
