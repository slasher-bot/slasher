# What happens to the git history on origin, which still holds every record as committed? — Rewrite and force-push, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What happens to the git history on origin, which still holds every record as committed?

The options:

- **Rewrite and force-push** — Rewrite master's history so no commit holds the removed content, then force-push to origin. Every commit SHA after the first affected commit changes, and every clone must be reset.
- **Leave the history** — Change master only. The history on origin still holds the removed content.

The engineer's answer: **Rewrite and force-push**
