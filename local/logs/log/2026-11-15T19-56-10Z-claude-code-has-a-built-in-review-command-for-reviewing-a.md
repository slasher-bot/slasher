# Claude Code has a built-in /review command, for reviewing a pull request. A plugin command named /review may be shadowed by it, so typing /review could run the built-in instead, and the plugin form would be /slasher:review. How should the rename to /review go? — /review, rename all, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Claude Code has a built-in /review command, for reviewing a pull request. A plugin command named /review may be shadowed by it, so typing /review could run the built-in instead, and the plugin form would be /slasher:review. How should the rename to /review go?

The options:

- **/review, rename all** — The command is /review, with /review accept and /review reject. The branch, worktree, and feature record are renamed to review-command. Whether the built-in shadows it is checked when the skill is written.
- **/review, keep names** — The command is /review, with /review accept and /review reject. The branch, worktree, and feature record keep the name suggest-command.
- **Something else — say what to change** — Choose another name, or keep /suggest.

The engineer's answer: **/review, rename all**
