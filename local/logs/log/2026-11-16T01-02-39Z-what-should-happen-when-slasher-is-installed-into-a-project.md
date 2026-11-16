# What should happen when Slasher is installed into a project that already has an AGENTS.md and no terminal is attached, as under /install? — Ask through /install (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What should happen when Slasher is installed into a project that already has an AGENTS.md and no terminal is attached, as under /install?

The options:

- **Ask through /install (Recommended)** — The installer takes an explicit answer, such as --append-agents-md. Without it, it stops and exits non-zero, naming the choice. /install puts the choice to you through the selection interface, then runs the installer with your answer.
- **SLASHER.md import** — As James did: write the bootstrap to SLASHER.md, and add one line, @SLASHER.md, to the end of the existing AGENTS.md, without asking. A terminal run asks first, as now.
- **Append without asking** — With no terminal, append the bootstrap to the existing AGENTS.md without asking, and say so in the output. A terminal run asks first, as now.
- **Loud warning, exit non-zero** — Change nothing in AGENTS.md, but end the output with the warning and exit non-zero, so /install reports a failure and the steps to finish by hand.

The engineer's answer: **Ask through /install (Recommended)**
