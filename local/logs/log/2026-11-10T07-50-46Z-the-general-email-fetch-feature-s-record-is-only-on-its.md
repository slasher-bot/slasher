# The general-email-fetch feature's record is only on its branch, so the status line, running on master, can't see it. How should this be fixed? — Both, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The general-email-fetch feature's record is only on its branch, so the status line, running on master, can't see it. How should this be fixed?

The options:

- **Put the record on master** — Commit the feature record and the idea's Implementation state to master too. This fixes it now, and nothing in the system changes.
- **Read worktrees' records** — Change the status line's script, test first, to also read the records in each worktree of the repository, so a feature started on its branch shows wherever the session is.
- **Both** — Put the record on master now, and change the script so it doesn't happen again

The engineer's answer: **Both**
