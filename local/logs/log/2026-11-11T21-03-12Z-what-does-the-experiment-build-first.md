# What does the experiment build first? — Foundation alone, locally, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What does the experiment build first?

The options:

- **Foundation alone, locally** — A marketplace.json listing only a foundation plugin, added from the worktree's local path with /plugin marketplace add, to try install end to end before anything is pushed
- **Every package and the bundle** — A plugin for each package, each depending on foundation, and the slasher bundle, all listed in marketplace.json, then tried locally
- **Lay out phases first** — Name the experiment's phases and their order before building anything

The engineer's answer: **Foundation alone, locally**
