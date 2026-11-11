# Where should the feature for "Email is fetched through a general mechanism, with a general token or credential store" be worked? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for "Email is fetched through a general mechanism, with a general token or credential store" be worked?

The options:

- **Branch only** — Create the branch feature/general-email-fetch and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/general-email-fetch and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-general-email-fetch. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
