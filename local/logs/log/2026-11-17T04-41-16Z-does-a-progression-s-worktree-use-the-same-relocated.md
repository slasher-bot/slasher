# Does a progression's worktree use the same relocated local directory? — One shared directory, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Does a progression's worktree use the same relocated local directory?

The options:

- **One shared directory** — Every worktree uses the one relocated directory. Records are seen at once everywhere and never merge.
- **Matching worktree of its repo** — Where the directory is a git repository, each worktree gets a worktree of it on the same branch name. Records merge with the feature.
- **A copy for each worktree** — Each worktree gets its own copy of the directory, and its records are brought back at the conclusion.

The engineer's answer: **One shared directory**
