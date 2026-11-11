---
name: current
description: List the current items. An alias of /item current.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/current $ARGUMENTS`. `/current` is an alias of `/item current`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Otherwise, list the current items, the Open and Active ones, as `/item list current` does. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
