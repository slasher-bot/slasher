# How should the installer stop colliding with a project's own install file? — Rename it in the repo, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How should the installer stop colliding with a project's own install file?

The options:

- **Rename it in the repo** — Rename the root install script to slasher-install, with the README, the shell-scripts rule, the tests, and the imap README, and /install fetches slasher-install. The download fails until the rename is on GitHub's master.
- **Save it as slasher-install** — /install downloads the script under the name slasher-install, with curl -o, and runs that. The repository's file stays named install for now, and trials keep working.
- **Both, in order** — Save the download as slasher-install now, and record renaming the repository's file as an item, done once the experiment merges.

The engineer's answer: **Rename it in the repo**
