# What should `/phase status` print? Today a bare `/phase`, or `/phase current`, prints the current phase, its goal, and its branch. `/feature status` prints the feature's phases in order, the current one emphasized, and the current phase's goal. — As feature status, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What should `/phase status` print? Today a bare `/phase`, or `/phase current`, prints the current phase, its goal, and its branch. `/feature status` prints the feature's phases in order, the current one emphasized, and the current phase's goal.

The options:

- **As feature status** — `/phase status` prints the phases in order, the current one emphasized, and the current phase's goal and branch, as `/feature status` and `/experiment status` do.
- **Alias of current** — `/phase status` prints what `/phase current` prints: the current phase, its goal, and its branch.

The engineer's answer: **As feature status**
