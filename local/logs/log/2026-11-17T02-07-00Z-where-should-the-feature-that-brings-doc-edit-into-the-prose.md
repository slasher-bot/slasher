# Where should the feature that brings doc-edit into the prose package be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature that brings doc-edit into the prose package be built?

The options:

- **Branch only** — Create the branch feature/prose-edit and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/prose-edit and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-prose-edit. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
