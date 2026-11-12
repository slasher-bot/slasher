# Where does /install get the package sets and packages it offers for selection? — The installer lists them (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where does /install get the package sets and packages it offers for selection?

The options:

- **The installer lists them (Recommended)** — slasher-install gains a listing mode, such as `sh slasher-install --list`, that prints its sets and their packages, plus the packages outside every set. The list stays in one place, the installer, which the plugin carries.
- **The skill lists them** — The /install skill's text names the sets and packages. Nothing is added to the installer, but the list is kept in two places that can drift apart.
- **The build writes them** — build-marketplace-plugin.sh writes a list file into the plugin from the packages under system/. Every package is listed, but the sets still live only in the installer.

The engineer's answer: **The installer lists them (Recommended)**
