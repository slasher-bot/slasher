---
name: review
description: Suggest numbered edits to content. /review accept and /review reject are /prose accept and /prose reject. An alias of /prose suggest.
argument-hint: "[<content> | accept [<n> ...] | reject [<n> ...] | help]"
disable-model-invocation: true
---

The engineer typed `/review $ARGUMENTS`. `/review` is an alias of `/prose suggest`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/prose help` prints the help of its command domain. Do nothing more.
2. Otherwise, do what `/prose suggest` does, with the words typed passed on unchanged. From the project root, run `slasher/system/foundation/load-rules.sh prose-reviews-content-through-its-subcommands`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rule it names for `/prose suggest`.
