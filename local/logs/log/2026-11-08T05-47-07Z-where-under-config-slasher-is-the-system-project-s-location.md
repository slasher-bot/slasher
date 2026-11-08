# Where under ~/.config/slasher is the system project's location recorded? — system-project.toml, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where under ~/.config/slasher is the system project's location recorded?

The options:

- **system-project.toml** — A file of its own, ~/.config/slasher/system-project.toml, holding path = "~/…". One file per concern, like consuming-projects.toml.
- **A key in the registry** — system-project = "~/…" inside consuming-projects.toml, beside included and excluded.
- **A general config.toml** — ~/.config/slasher/config.toml, holding system-project = "~/…", meant to collect future machine-wide settings.

The engineer's answer: **system-project.toml**
