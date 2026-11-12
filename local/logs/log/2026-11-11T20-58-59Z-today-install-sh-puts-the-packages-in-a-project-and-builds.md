# Today install.sh puts the packages in a project and builds the plugin there from the active ones. What does the marketplace's plugin do? — Entry point to install, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Today install.sh puts the packages in a project and builds the plugin there from the active ones. What does the marketplace's plugin do?

The options:

- **Entry point to install** — The marketplace plugin carries /package install and the hooks. Installing it is how a project gets Slasher, in place of the curl install. The packages still go into slasher/system/
- **Every command, built once** — The marketplace plugin is built from every package's skills and published. install.sh still puts the rules in the project, and stops building a plugin there
- **Something else — say what to change** — Describe what the marketplace's plugin does

The engineer's answer: **Entry point to install**
