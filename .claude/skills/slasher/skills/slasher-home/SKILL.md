---
name: slasher-home
description: Carry out an instruction in the Slasher home directory, which holds the development version of Slasher. An alias of /projects -slasher-home.
argument-hint: "[<instruction>]"
disable-model-invocation: true
---

The engineer typed `/slasher-home $ARGUMENTS`. `/slasher-home` is an alias of `/projects -slasher-home`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/projects help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh projects-lists-the-registry-and-carries-out-an-instruction-in-another-project`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, with `-slasher-home` as the target and the words typed as the instruction.
