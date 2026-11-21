# Where is the implementation for the work items "Summarize messages after imap receives them" and "Summarize a message after smtp sends it" built? It is one implementation for both items. — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the implementation for the work items "Summarize messages after imap receives them" and "Summarize a message after smtp sends it" built? It is one implementation for both items.

The options:

- **Branch only** — Create the branch implementation/email-summaries and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as implementation/worktree/email-summaries in a new worktree at ../slasher-implementation-worktree-email-summaries. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch and worktree**
