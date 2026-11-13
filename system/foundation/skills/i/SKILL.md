---
name: i
description: List every item, or the current ones with /i current. An alias of /items.
argument-hint: "[current]"
disable-model-invocation: true
---

The engineer typed `/i $ARGUMENTS`. `/i` is an alias of `/items`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, where nothing was typed, list every item, whatever its state. Where the first word is `current`, list the current items, the Open and Active ones, as `/item list current` does. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
