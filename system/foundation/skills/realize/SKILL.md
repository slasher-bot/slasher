---
name: realize
description: Make an item Realized. An alias of /item realize.
argument-hint: "[<item> | help]"
disable-model-invocation: true
---

The engineer typed `/realize $ARGUMENTS`. `/realize` is an alias of `/item realize`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Otherwise, make the item Realized. Load the rule that governs items. From the project root, run `slasher/system/foundation/load-rules.sh the-items-directory-holds-one-file-per-item`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. The words typed name the item. Where none were typed, or the words name more than one, ask which, through the selection interface.
