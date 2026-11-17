---
name: review
description: Suggest numbered edits to content, then accept or reject them.
argument-hint: "[<content> | accept [<n> ...] | reject [<n> ...] | help]"
disable-model-invocation: true
---

The engineer typed `/review $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh the-review-command-suggests-numbered-edits-and-accept-or-reject-settles-them`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints. Then run `slasher/system/foundation/load-rules.sh content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence`, or `system/foundation/load-rules.sh` with the same rule name, and follow it too.
3. Read the first word typed as the subcommand. **`accept`** or **`reject`**: do what the rule says of it, with the numbers after it, where any were typed. **Nothing typed**: suggest edits to the content the conversation is on. **Any other first word** starts the words that name the content, and the rule says what to do with them.
