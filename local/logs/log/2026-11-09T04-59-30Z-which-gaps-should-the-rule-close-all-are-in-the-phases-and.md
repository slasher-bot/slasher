# Which gaps should the rule close? All are in the Phases and End sections of the implementation rule. — Phases merge with --no-ff, The record names each phase's start, "Phase branches deleted with -D, origin too", "Wording: content and message, --force-with-lease", selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which gaps should the rule close? All are in the Phases and End sections of the implementation rule.

The options:

- **Phases merge with --no-ff** — Each phase merges with a merge commit, so its boundaries stay visible and its start is the merge's first parent.
- **The record names each phase's start** — The implementation record gives the commit each phase branched from, so the rebuild never depends on the reflog.
- **Phase branches deleted with -D, origin too** — After the squash, phase branches are deleted with -D, and the deletion covers the implementation branch on origin.
- **Wording: content and message, --force-with-lease** — A commit outside a phase keeps its content and message, not its ID. The force-push uses --force-with-lease against the pushed tip.

The engineer's answer: **Phases merge with --no-ff, The record names each phase's start, "Phase branches deleted with -D, origin too", "Wording: content and message, --force-with-lease"**
