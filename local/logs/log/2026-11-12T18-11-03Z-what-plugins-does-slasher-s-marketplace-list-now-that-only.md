# What plugins does Slasher's marketplace list, now that only the install command is useful in a plugin? — One, named slasher, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What plugins does Slasher's marketplace list, now that only the install command is useful in a plugin?

The options:

- **One, named slasher** — One plugin carrying /install, named slasher. Installed as slasher@slasher, and its command is /slasher:install, beside the project's other /slasher: commands. Replaces the plan of one plugin per package and a bundle.
- **One, named foundation** — Keep the plugin as built: foundation@slasher, with /foundation:install. Replaces the plan of one plugin per package and a bundle.
- **Keep the original plan** — One plugin per package plus a slasher bundle, though every package but foundation builds as a manifest alone.

The engineer's answer: **One, named slasher**
