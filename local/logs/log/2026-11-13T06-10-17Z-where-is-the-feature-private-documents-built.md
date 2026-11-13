# Where is the feature "Private documents" built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the feature "Private documents" built?

The options:

- **Branch only** — Create the branch feature/private-documents and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/private-documents and check it out in a new worktree: a second working directory at /Users/sbellware/projects/slasher/slasher-feature-worktree-private-documents. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
