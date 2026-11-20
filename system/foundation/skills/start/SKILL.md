---
name: start
description: Make an item, a feature, an experiment, or content Active. An alias of /item start, /feature start, /experiment start, and /content start.
argument-hint: "[<item> | <feature> | <experiment> | <content> | help]"
disable-model-invocation: true
---

The engineer typed `/start $ARGUMENTS`. `/start` acts on an item, as `/item start` does, or on a feature, an experiment, or content, as `/feature start`, `/experiment start`, and `/content start` do.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Where the words name an item, make it Active, from Open, or from Recorded for a goal or an aspiration, as `/item start` does. From the project root, run `slasher/system/foundation/load-rules.sh the-items-directory-holds-one-file-per-item`.
3. Where the words name a feature, an experiment, or content, make it Active, from Open, as `/feature start`, `/experiment start`, or `/content start` does. From the project root, run `slasher/system/foundation/load-rules.sh` with `a-progression-runs-on-a-branch-to-a-declared-end`, then with `the-progressions-directory-holds-one-record-per-progression`. Where it is content, run it with `content-is-a-progression-without-the-steps-that-serve-only-code` too.
4. Where the record named cannot take the state, say so, name the state its kind takes instead, and do nothing more.
5. Where no words were typed, or the words do not say which record is meant, ask which, through the selection interface. Offer the items, features, experiments, and content that can take the state.
6. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` in place of `slasher/system/foundation/load-rules.sh`. Follow each rule it prints, and the rules its triggers then name.
