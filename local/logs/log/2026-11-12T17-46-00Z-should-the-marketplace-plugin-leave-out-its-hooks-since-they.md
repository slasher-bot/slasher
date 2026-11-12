# Should the marketplace plugin leave out its hooks, since they do nothing before /install and run twice after it? — Leave out the hooks, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Should the marketplace plugin leave out its hooks, since they do nothing before /install and run twice after it?

The options:

- **Leave out the hooks** — The marketplace build copies skills and writes the manifest, and no hooks. The installed project's own plugin runs them once. (Recommended)
- **Keep the hooks** — The marketplace plugin keeps its hooks, and the doubled display is solved some other way.

The engineer's answer: **Leave out the hooks**
