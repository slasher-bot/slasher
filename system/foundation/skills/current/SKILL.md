---
name: current
description: List the current items. An alias of /items current.
argument-hint: ""
disable-model-invocation: true
---

The engineer typed `/current $ARGUMENTS`. `/current` is an alias of `/items current`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. List the current items alone, the Open and Active ones, as `/item list current` does.
