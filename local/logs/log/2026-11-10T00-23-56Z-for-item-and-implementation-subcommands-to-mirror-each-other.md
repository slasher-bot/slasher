# For item and implementation subcommands to mirror each other, how should the states that only one of them has be handled? — Pair by meaning (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> For item and implementation subcommands to mirror each other, how should the states that only one of them has be handled?

The options:

- **Pair by meaning (Recommended)** — Commands are named for what they do, and each kind maps the name to its own state. /complete makes an item Realized or Done, and an implementation Completed. Where no state matches, the command is refused.
- **Same list, some refused** — The command lists are identical and the states stay as they are. A command naming a state the record can't take is refused.
- **Every state for both** — Both kinds take every state, so the lists are identical and nothing is refused. An item can be Affirmed, and a feature Realized or Deferred.

The engineer's answer: **Pair by meaning (Recommended)**
