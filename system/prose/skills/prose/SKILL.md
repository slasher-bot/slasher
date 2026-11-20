---
name: prose
description: Review content with the subcommands line-edit, suggest, critique, accept, and reject.
argument-hint: "[line-edit | suggest | critique | accept | reject | help] [<words>]"
disable-model-invocation: true
---

The engineer typed `/prose $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rules that govern the act. From the project root, run `slasher/system/foundation/load-rules.sh prose-reviews-content-through-its-subcommands`, then `slasher/system/foundation/load-rules.sh content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule names. Follow the rules they print.
3. Read the first word typed as the subcommand. **`line-edit`**: load the line-edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence rule the same way, and follow it with the words after `line-edit`. **`suggest`**, **`accept`**, or **`reject`**: load the prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them rule, and follow it. **`critique`**: load the prose-critique-gives-an-overall-critical-review-of-content rule, and follow it. **Nothing typed**: ask which subcommand is meant, through the selection interface. **Any other first word**: say it is not a subcommand of `/prose`, and ask which is meant.
