---
name: edit
description: Walk content paragraph by paragraph, then sentence by sentence, with findings and no rewrites.
argument-hint: "[<content> | next | previous | p<n> | sentences [p<n> ...] | print | help]"
disable-model-invocation: true
---

The engineer typed `/edit $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/review help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rules that govern the act. From the project root, run `slasher/system/foundation/load-rules.sh edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence`, then `slasher/system/foundation/load-rules.sh content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule names. Follow the rules they print.
3. Read the first word typed as the subcommand. **`next`**, **`previous`**, **`p<n>`**, **`sentences`**, or **`print`**: do what the rule says of it. **Nothing typed**: walk the content the conversation is on. **Any other first word** starts the words that name the content to walk.
