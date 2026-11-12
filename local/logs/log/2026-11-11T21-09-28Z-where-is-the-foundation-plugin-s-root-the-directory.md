# Where is the foundation plugin's root, the directory marketplace.json points at? — A built directory, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the foundation plugin's root, the directory marketplace.json points at?

The options:

- **The package directory** — system/foundation is the plugin: a .claude-plugin/plugin.json is added, its skills/ is already in place, and the manifest names ./plugin/hooks/hooks.json. Nothing is built
- **A built directory** — A script assembles plugins/foundation/ from the package, as assemble-plugin.sh does today, and the build is committed
- **Something else — say what to change** — Describe where the plugin's root is

The engineer's answer: **A built directory**
