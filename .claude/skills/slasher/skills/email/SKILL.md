---
name: email
description: Fetch IMAP email into the project, or list the email accounts.
argument-hint: "[fetch [<name> | <host>] | list | help]"
disable-model-invocation: true
---

The engineer typed `/email $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Where nothing was typed, it is `/email fetch`.
3. Where the first word is `fetch` or `list`, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh email-fetches-the-accounts-named-and-lists-them-without-credentials`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
4. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface: `fetch`, `list`, or `help`.
