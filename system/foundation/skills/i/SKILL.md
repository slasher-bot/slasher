---
name: i
description: List the current items. An alias of /items.
disable-model-invocation: true
---

The engineer typed `/i $ARGUMENTS`. `/i` is an alias of `/items`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, list the current items, the Open and Active ones, as `/item list current` does. `/i current` does the same. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
