# The private journal leaves nothing in the project's files, so the setting lives outside the project. Where? — The project registry, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The private journal leaves nothing in the project's files, so the setting lives outside the project. Where?

The options:

- **The user file** — A key in ~/.config/slasher/user that names the projects whose journal is private, or all of them. Per machine. The file is already read to find the writer.
- **The project registry** — An entry for the project in ~/.config/slasher/consuming-projects.toml. Per machine. The registry holds only paths today, so it needs a per-project form, as the relocatable local directory idea also asks for.

The engineer's answer: **The project registry**
