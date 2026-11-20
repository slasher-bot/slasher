---
name: implementations
description: List the current progressions of every kind. An alias of /progressions.
argument-hint: "[current] [<n>]"
disable-model-invocation: true
---

The engineer typed `/implementations $ARGUMENTS`. `/implementations` is an alias of `/progressions`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/progression help` prints the help of its command domain. Do nothing more.
2. Otherwise, list the current progressions of every kind. `/implementations current` does the same. Where the first word is `current`, read the word after it as the first word. Where the first word is a number, list only that many of the most recent current progressions. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
