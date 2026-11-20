---
name: line-edit
description: Walk content paragraph by paragraph, then sentence by sentence, and accept, reject, or ignore each suggestion. An alias of /prose line-edit.
argument-hint: "[<content> | next | previous | p<n> [s<n>] | sentences [p<n> ...] | print | help]"
disable-model-invocation: true
---

The engineer typed `/line-edit $ARGUMENTS`. `/line-edit` is an alias of `/prose line-edit`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/prose help` prints the help of its command domain. Do nothing more.
2. Otherwise, do what `/prose line-edit` does, with the words typed passed on unchanged. From the project root, run `slasher/system/foundation/load-rules.sh prose-reviews-content-through-its-subcommands`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rule it names for `/prose line-edit`.
