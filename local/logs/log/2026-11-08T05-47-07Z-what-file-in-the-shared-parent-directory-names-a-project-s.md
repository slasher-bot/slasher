# What file in the shared parent directory names a project's base project, and what does it hold? — slasher.toml, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What file in the shared parent directory names a project's base project, and what does it hold?

The options:

- **slasher.toml** — A visible file, <parent>/slasher.toml, holding base-project = "<directory name of the sibling>".
- **.slasher.toml** — A hidden file, <parent>/.slasher.toml, with the same base-project key.
- **A .slasher/ directory** — <parent>/.slasher/config.toml, which leaves room for more parent-level configuration later, such as a registry of that directory's own.

The engineer's answer: **slasher.toml**
