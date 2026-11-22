---
name: progression
description: Start a progression with no kind, show its status, or change its state.
argument-hint: "[new [with phases] | status [<progression>] | start | complete | affirm | refute | inconclusive | defer | suspend | discontinue | obsolete | supersede | abandon | resume | help]"
disable-model-invocation: true
---

The engineer typed `/progression $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints, and the rules its triggers then name.
2. Read the first word typed as the subcommand. `new with phases` is one subcommand.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. Where nothing was typed, ask which subcommand is meant, through the selection interface, in these groups. Then ask again within the group selected, where it holds more than one.
   - **Start:** `new`, `new with phases`, `start`
   - **Conclude:** `complete`, `affirm`, `refute`, `inconclusive`
   - **Set aside:** `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`
   - **Other:** `resume`, `status`, `help`
5. **`new`**: write the progression's record Open, and create no branch. Ask neither the working-location question nor the participation question: `start` asks them, and creates the branch. A progression this command creates has no kind: it is titled `Progression — <name>`, tagged `[progression]`, on a branch named `progression/<subject>`. Load the-progressions-directory-holds-one-record-per-progression and a-progression-runs-on-a-branch-to-a-declared-end. The words after it, where any were typed, state the progression's intent or question.
6. **`new with phases`**: create the progression as `new` does, and ask for its phases. Load a-phase-starts-by-stating-its-goal too.
7. **`status [<progression>]`**: report the progression's phases, its state, what exists, and what is left, for the progression named, or the one the conversation is on. Load progression-status-reports-its-phases-its-state-what-exists-and-what-is-left and a-phase-starts-by-stating-its-goal.
8. **A change of state**, `start`, `complete`, `affirm`, `refute`, `inconclusive`, `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`, or `resume`: change the progression's state, as the root command of the same name does for a progression. Load a-progression-runs-on-a-branch-to-a-declared-end and the-progressions-directory-holds-one-record-per-progression. `affirm` is the engineer's declaration only, so the skill acts on it only when the engineer typed it.
9. **`realize`** maps to no state a progression takes. Say so, name `complete`, which concludes a progression, and do nothing more.
10. **`start`** where no progression is Open: create a progression as `new` does, and write its record Active. The words after it, where any were typed, state its intent or question.
11. Step 8 acts on the progression the conversation is on. Where that is not clear, or more than one progression is open, ask which, through the selection interface.
12. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, as step 4 does.
