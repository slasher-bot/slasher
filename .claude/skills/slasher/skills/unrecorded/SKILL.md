---
name: unrecorded
description: Start a session in which no record is written anywhere, or end it.
argument-hint: "[<instruction> | end | help]"
disable-model-invocation: true
---

The engineer typed `/unrecorded $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh an-unrecorded-session-writes-no-record`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. **`end`**: end the unrecorded session.
4. **Nothing typed**: start an unrecorded session, and wait for the engineer's request.
5. **Any other words**: start an unrecorded session, and carry out the words as the engineer's instruction in it.
