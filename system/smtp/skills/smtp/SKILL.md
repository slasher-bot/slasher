---
name: smtp
description: Send a message through an email account whose credential is kept in the macOS Keychain.
argument-hint: "[send <name> <message-file> | help]"
disable-model-invocation: true
---

The engineer typed `/smtp $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Where nothing was typed, ask which subcommand is meant, through the selection interface: `send` or `help`.
3. Where the first word is `send`, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh smtp-sends-a-message-only-after-the-engineer-confirms-it`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
4. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface: `send` or `help`.
