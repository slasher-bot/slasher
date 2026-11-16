# Where should the feature for item 1, "The installer fails silently where a project already has an AGENTS.md", be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for item 1, "The installer fails silently where a project already has an AGENTS.md", be built?

The options:

- **Branch only** — Create the branch feature/existing-agents-md-install and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/existing-agents-md-install and check it out in a new worktree: a second working directory at /Users/sbellware/projects/slasher/slasher-feature-worktree-existing-agents-md-install. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
