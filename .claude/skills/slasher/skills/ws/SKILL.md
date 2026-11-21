---
name: ws
description: The status of the work under way, or of the item, feature, experiment, or content named. An alias of /work-status.
argument-hint: "[<item, feature, experiment, or content>]"
disable-model-invocation: true
---

The engineer typed `/ws $ARGUMENTS`. `/ws` is an alias of `/work-status`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh work-status-reports-on-the-work-under-way-or-the-record-named`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. The words typed, where any were, identify the record to report on.
