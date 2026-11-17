# You said "/packages update" should be used when updating many packages. How should that be recorded? — Amend the package update rule, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> You said "/packages update" should be used when updating many packages. How should that be recorded?

The options:

- **Amend the package update rule** — Change the rule for package update and install, and the command help: /packages update updates many or all packages, and /package update updates one.
- **New local rule** — A rule in local/rules/ for this project's own writing: instructions to users say /packages update when updating many packages. The commands stay as they are.
- **Note** — An item tagged [note] in local/items/, while the thinking is not settled.
- **Don't record it** — Only fix the instructions to users. Record nothing.

The engineer's answer: **Amend the package update rule**
