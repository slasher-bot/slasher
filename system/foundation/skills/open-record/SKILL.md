---
name: open-record
description: Open the previous reply's principal record in the application registered for it.
disable-model-invocation: true
---

The engineer typed `/open-record $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh open-record-opens-the-previous-replys-principal-record`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
