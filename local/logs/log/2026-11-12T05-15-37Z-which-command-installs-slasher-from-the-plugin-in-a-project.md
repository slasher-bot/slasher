# Which command installs Slasher from the plugin, in a project without Slasher? — A new /install, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which command installs Slasher from the plugin, in a project without Slasher?

The options:

- **/package install** — The existing command. Its skill gains a step: where the project has no rule loader, it skips loading rules and downloads and runs the installer itself.
- **A new /install** — A new skill, typed /foundation:install or /install, whose steps need no rules. /package install stays as it is, for a project that already has Slasher.

The engineer's answer: **A new /install**
