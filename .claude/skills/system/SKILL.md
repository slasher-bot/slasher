---
name: system
description: Carry out an instruction in this machine's system project, as /projects -system does. A local command of the Slasher authoring source.
argument-hint: "[help | <instruction>]"
disable-model-invocation: true
---

The engineer typed `/system $ARGUMENTS`.

1. Where the first word is `help`, say that `/system` is this project's form of `/projects -system`, and that `/projects help` prints the help of its command. Do nothing more.
2. Otherwise, follow this project's local rule for the `/system` command. Load the rule that governs the act. From the project root, run `system/foundation/load-rules.sh projects-lists-the-registry-and-carries-out-an-instruction-in-another-project`. Follow the rule it prints, with `-system` as the target and the words typed as the instruction.
