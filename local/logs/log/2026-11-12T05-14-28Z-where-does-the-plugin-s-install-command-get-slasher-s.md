# Where does the plugin's install command get Slasher's installer, in a project that has no Slasher yet? — Downloaded from GitHub, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where does the plugin's install command get Slasher's installer, in a project that has no Slasher yet?

The options:

- **A copy in the plugin** — The plugin build copies the root install script into foundation's plugin. The command runs that copy, so the installer is the one released with the plugin, and no download is needed.
- **Downloaded from GitHub** — The command fetches install with curl from slasher-bot/slasher's master, as the README's install does. Nothing new goes in the plugin, and the installer is always the latest.

The engineer's answer: **Downloaded from GitHub**
