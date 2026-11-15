---
name: record
description: Copy the path of, print, or open the previous reply's principal record.
argument-hint: "[copy | print | open]"
disable-model-invocation: true
---

The engineer typed `/record $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh the-record-command-copies-prints-or-opens-the-previous-replys-principal-record`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Read the first word typed as the subcommand. **`copy`**, **`print`**, or **`open`**: do what the rule says of it. **Nothing typed**: ask which, through the selection interface: `copy`, `print`, or `open`.
4. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface: `copy`, `print`, or `open`.
