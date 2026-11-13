# Where does the re-adding of packages under slasher/system/ happen, after waytide/ moves? — Does this change the installer used by every user, or is it just for this migration, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where does the re-adding of packages under slasher/system/ happen, after waytide/ moves?

The options:

- **The installer, whole** — install.sh commits the move, then re-adds every installed package under slasher/system/, one commit each. One run carries a project across. The installer starts committing.
- **Installer and refresh** — install.sh commits the move and re-adds foundation, which it needs. refresh-packages.sh re-adds any other package that was only ever added under waytide/, in place of the pull that would fail.
- **The refresh, whole** — install.sh commits the move only. refresh-packages.sh re-adds every package that was only ever added under waytide/, foundation included.

The engineer's answer: **Does this change the installer used by every user, or is it just for this migration**
