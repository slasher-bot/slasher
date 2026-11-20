---
name: reject
description: Reject pending suggestions by their numbers. An alias of /prose reject.
argument-hint: "[<n> ...] | help"
disable-model-invocation: true
---

The engineer typed `/reject $ARGUMENTS`. `/reject` is an alias of `/prose reject`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/prose help` prints the help of its command domain. Do nothing more.
2. Otherwise, do what `/prose reject` does, with the words typed passed on unchanged. From the project root, run `slasher/system/foundation/load-rules.sh prose-reviews-content-through-its-subcommands`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rule it names for `/prose reject`.
