# What does the packaging and installation phase cover? — "Install by name, tested", Refresh and activate, Checks at install, Repository and publish (exception), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What does the packaging and installation phase cover?

The options:

- **Install by name, tested** — An interactive test installs imap by name into a temporary project, as sh install default imap does, and checks its scripts, its /email command, and its table row arrive.
- **Refresh and activate** — refresh-packages.sh, /package activate, and /package deactivate handle imap as they do any package, with a test of each.
- **Checks at install** — The installer, or imap's own install-dependencies.sh, checks for macOS and Python 3.11 or later, and says what is missing.
- **Repository and publish (exception)** — The package repository slasher-bot/imap is created, and the package published to it, from this feature. This is the exception to the rule that a publish waits for master.

The engineer's answer: **"Install by name, tested", Refresh and activate, Checks at install, Repository and publish (exception)**
