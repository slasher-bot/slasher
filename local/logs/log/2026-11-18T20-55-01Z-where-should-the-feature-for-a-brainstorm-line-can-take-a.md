# Where should the feature for "A brainstorm line can take a single input and then end" be built? (You chose unattended work.) — The current branch, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for "A brainstorm line can take a single input and then end" be built? (You chose unattended work.)

The options:

- **Branch only** — Create feature/brainstorm-text and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create feature/worktree/brainstorm-text and check it out in a new worktree at ../slasher-feature-worktree-brainstorm-text. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **The current branch**
