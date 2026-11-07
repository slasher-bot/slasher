# Controls hinge: how does current-implementation.sh know a phase is under way? — Phase branch (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Controls hinge: how does current-implementation.sh know a phase is under way?

The options:

- **Phase branch (Recommended)** — A branch named <implementation branch>.<phase> exists. The latest-committed one wins.
- **Record names it** — A new line in the record. A rule change: the phase commands write and clear it.
- **Phases list** — Read the record's prose list of phases for the one started and not concluded.

The engineer's answer: **Phase branch (Recommended)**
