# Consuming projects also hold items tagged [observation]. Does the installer convert them on refresh? — Installer converts them, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Consuming projects also hold items tagged [observation]. Does the installer convert them on refresh?

The options:

- **Installer converts them** — install.sh retags [observation] items as [note] on install and refresh, as it moved Stated to Recorded
- **Leave them as written** — The installer changes nothing. A consuming project's old items keep [observation]
- **Something else — say what to change** — Describe what happens in consuming projects

The engineer's answer: **Installer converts them**
