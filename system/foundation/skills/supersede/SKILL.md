---
name: supersede
description: Make an item, a feature, or an experiment Superseded. An alias of /item supersede, /feature supersede, and /experiment supersede.
argument-hint: "[<item> | <feature> | <experiment> | help]"
disable-model-invocation: true
---

The engineer typed `/supersede $ARGUMENTS`. `/supersede` acts on an item, as `/item supersede` does, or on a feature or an experiment, as `/feature supersede` and `/experiment supersede` do.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Where the words name an item, make it Superseded, as `/item supersede` does. From the project root, run `slasher/system/foundation/load-rules.sh the-items-directory-holds-one-file-per-item`.
3. Where the words name a feature or an experiment, make it Superseded, as `/feature supersede` or `/experiment supersede` does. A feature or an experiment is superseded only after it is suspended. From the project root, run `slasher/system/foundation/load-rules.sh` with `an-implementation-runs-on-a-branch-to-a-declared-end`, then with `the-implementations-directory-holds-one-record-per-implementation`.
4. Where no words were typed, or the words do not say which record is meant, ask which, through the selection interface. Offer the current items and the current features and experiments that can take the state.
5. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` in place of `slasher/system/foundation/load-rules.sh`. Follow each rule it prints, and the rules its triggers then name.
