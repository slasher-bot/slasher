---
name: shortcuts
description: Print the shortcuts table, each shortcut alias and what it does.
disable-model-invocation: true
---

The engineer typed `/shortcuts $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/slasher help` prints the help of every Slasher command. Do nothing more.
2. Otherwise, print the shortcuts table. From the project root, run `slasher/system/foundation/load-rules.sh the-command-domain-table-prints-when-the-rules-have-loaded`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Print the shortcuts table in the rule it prints, word for word, and nothing else.
