---
name: accept
description: Accept pending suggestions by their numbers. An alias of /prose accept.
argument-hint: "[<n> ...] | help"
disable-model-invocation: true
---

The engineer typed `/accept $ARGUMENTS`. `/accept` is an alias of `/prose accept`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/prose help` prints the help of its command domain. Do nothing more.
2. Otherwise, do what `/prose accept` does, with the words typed passed on unchanged. From the project root, run `slasher/system/foundation/load-rules.sh prose-reviews-content-through-its-subcommands`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rule it names for `/prose accept`.
