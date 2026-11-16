# A Slasher rule says only one command in each command group takes `help`. For the package commands, that is `/package`, so `/packages` takes none. How should `/packages help` work? — Own help text, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> A Slasher rule says only one command in each command group takes `help`. For the package commands, that is `/package`, so `/packages` takes none. How should `/packages help` work?

The options:

- **Prints /package help** — `/packages help` prints the help of the package commands, the same text as `/package help`. The rule is amended so a group's other commands may do this too, or only `/packages` may.
- **Own help text** — `/packages` becomes a command group of its own, with its own heading and help text. `/package help` no longer covers it.
- **Something else — say what to change** — `/packages help` does something else. Say what it does.

The engineer's answer: **Own help text**
