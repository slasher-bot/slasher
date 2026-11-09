# Which of the second test's gaps should the rule close? — Remote branch deleted after upstream is pushed (Recommended), Phase merge commits are dropped, Body lists subjects as - lines, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which of the second test's gaps should the rule close?

The options:

- **Remote branch deleted after upstream is pushed (Recommended)** — The implementation's branch on the remote is deleted only once the upstream branch holding the work has been pushed.
- **Phase merge commits are dropped** — The rebuild drops each phase's --no-ff merge commit, since its squashed commit takes its place.
- **Body lists subjects as - lines** — The squashed commit's body lists each phase commit subject on its own line, after a dash, oldest first.
- **None** — Leave the rule as it is.

The engineer's answer: **Remote branch deleted after upstream is pushed (Recommended), Phase merge commits are dropped, Body lists subjects as - lines**
