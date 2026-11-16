# What should a root `/status` command do? — Status of the work under way, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What should a root `/status` command do?

The options:

- **Status of the work under way** — Bare, it reports on the implementation the conversation is on, or else the one Active item. With an identifier, it reports on that item, feature, or experiment.
- **Alias of /item status** — `/status` does exactly what `/item status` does, and acts on items only.
- **The project status report** — `/status` prints the fixed whole-project status report: tasks, waiting work, the slasher/ map, recent work, and the test suite.
- **Something else — say what to change** — Some other act. Say what it is.

The engineer's answer: **Status of the work under way**
