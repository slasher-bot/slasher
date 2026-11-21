---
name: conclude
description: Conclude the work under way, or the item, feature, experiment, or content named, in the concluding state the engineer selects.
argument-hint: "[<item> | <feature> | <experiment> | <content> | help]"
disable-model-invocation: true
---

The engineer typed `/conclude $ARGUMENTS`. `/conclude` is the engineer telling the agent *conclude*, and does exactly what that word does when typed. It names no concluding state.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Find the record. Where words were typed, they name the record, as `/work-status <record>` names one. Where none were typed, the record is the work under way, found as `/work-status` finds it. To find it, from the project root, run `slasher/system/foundation/load-rules.sh work-status-reports-on-the-work-under-way-or-the-record-named`, and follow how it finds the record. Do not print its report.
3. Where no record is found, say so, and do nothing more. Where more than one record is a candidate, ask which, through the selection interface, each candidate an option.
4. Where the record is an item, conclude it as the items rule says for an item concluded with no state named: put the concluding states it can take to the engineer through the selection interface, and conclude it in the state selected. From the project root, run `slasher/system/foundation/load-rules.sh the-items-directory-holds-one-file-per-item`.
5. Where the record is a feature, an experiment, an implementation, or content, conclude it as the progressions rules say for a progression concluded with no state named: put the concluding states it can take to the engineer through the selection interface, and conclude it in the state selected. From the project root, run `slasher/system/foundation/load-rules.sh` with `a-progression-runs-on-a-branch-to-a-declared-end`, then with `the-progressions-directory-holds-one-record-per-progression`. Where it is content, run it with `content-is-a-progression-without-the-steps-that-serve-only-code` too.
6. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` in place of `slasher/system/foundation/load-rules.sh`. Follow each rule it prints, and the rules its triggers then name.
