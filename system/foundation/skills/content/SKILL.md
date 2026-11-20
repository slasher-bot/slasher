---
name: content
description: Start a piece of writing on its own branch, show its status, list the current content, or change its state.
argument-hint: "[new | status [<content>] | start | complete | defer | suspend | discontinue | obsolete | supersede | abandon | resume | list | help]"
disable-model-invocation: true
---

The engineer typed `/content $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints, and the rules its triggers then name. Load content-is-a-progression-without-the-steps-that-serve-only-code for every subcommand but `help`.
2. Read the first word typed as the subcommand.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. Where nothing was typed, ask which subcommand is meant, through the selection interface, in these groups. Then ask again within the group selected, where it holds more than one.
   - **Start:** `new`, `start`
   - **Conclude:** `complete`
   - **Set aside:** `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`
   - **Other:** `resume`, `status`, `list`, `help`
5. **`new`**: create the content's branch and write its record Open. Load the-progressions-directory-holds-one-record-per-progression and a-progression-runs-on-a-branch-to-a-declared-end. The words after it, where any were typed, state what the content is.
6. **`status [<content>]`**: report the content's phases, its state, what exists, and what is left, for the content named, or the one the conversation is on. Load progression-status-reports-its-phases-its-state-what-exists-and-what-is-left and a-phase-starts-by-stating-its-goal.
7. **`complete`**: offer the review, then conclude the content Completed, as the content rule says. Load a-progression-runs-on-a-branch-to-a-declared-end and the-progressions-directory-holds-one-record-per-progression.
8. **A change of state**, `start`, `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`, or `resume`: change the content's state, as the root command of the same name does for content. Load a-progression-runs-on-a-branch-to-a-declared-end and the-progressions-directory-holds-one-record-per-progression.
9. **`list`**: list the current content, as `/contents` does. Load a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows. The words after it pass to `/contents` unchanged.
10. **`affirm`**, **`refute`**, **`inconclusive`**, **`new with phases`**, and **`realize`** are not subcommands of `/content`. Say so, and do nothing more. Content concludes Completed, with `complete`, and the writer adds phases with `/phase new`.
11. **`start`** where no content is Open: create content as `new` does, and write its record Active. The words after it, where any were typed, state what the content is.
12. Steps 7 and 8 act on the content the conversation is on. Where that is not clear, or more than one content progression is open, ask which, through the selection interface.
13. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, as step 4 does.
