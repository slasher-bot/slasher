# How are the commands split into plugins? — A plugin to a package, bundled, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How are the commands split into plugins?

The options:

- **A plugin to a package, bundled** — Each package is its own plugin, depending on foundation. A bundle plugin, slasher, depends on the default set, so one install brings them all
- **One plugin, checks packages** — One slasher plugin carries every command. A command whose package is inactive in the project says so and does nothing
- **A plugin to a package, no bundle** — Each package is its own plugin, depending on foundation. A user installs each one they want
- **Something else — say what to change** — Describe the split

The engineer's answer: **A plugin to a package, bundled**
