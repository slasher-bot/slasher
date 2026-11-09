# When are a phase's commits squashed? — At the implementation's conclusion, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> When are a phase's commits squashed?

The options:

- **At the implementation's conclusion** — Phases merge with their history during the work. At the conclusion the implementation's branch is rebuilt with one squashed commit per phase, and force-pushed where it was pushed.
- **When each phase concludes (as built)** — Each phase arrives as one squashed commit as soon as it concludes. No history is rewritten.

The engineer's answer: **At the implementation's conclusion**
