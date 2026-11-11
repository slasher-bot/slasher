---
name: ".."
description: Put the last question the engineer escaped again. An alias of /ask-again.
disable-model-invocation: true
---

The engineer typed `/.. $ARGUMENTS`. `/..` is an alias of `/ask-again`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh ask-again-puts-the-last-escaped-question-again`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
