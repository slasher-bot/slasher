# Loop record — A command and a shortcut commit and push

`/commit-and-push`, with the shortcut `/cp`, runs the automated suite, commits the work, and pushes the current branch. The engineer accepted the plan as first shown.

**Mode:** unattended.

## 1. The names

- **Hinge:** what the command and its shortcut are called.
- **Decision:** `/commit-and-push` and `/cp`. The name says the two acts in their order. Neither name is taken by a Claude Code built-in or another Slasher command.

## 2. The package and the domain

- **Hinge:** where the command lives, and which help lists it.
- **Decision:** the `git` package, in the PUSH domain beside `/push`. The command ends with the push `/push` makes, and the commit rules are the `git` package's. PUSH's description now names both acts.

## 3. Asking

- **Hinge:** what the command asks before it acts.
- **Decision:** nothing, except about changes the session did not make. Typing the command is the request, as typing `/push` is, so no commit prompt is put, on `master` either. Changes the session did not make may be work the engineer has not finished, so those are asked about.

## 4. The suite

- **Hinge:** whether the suite runs before the commit.
- **Decision:** it runs first, and a failure stops both acts. The run-the-test-suite rule makes the run a precondition of every commit, and the command does not set it aside.

**Outcome:** the `commit-and-push` and `cp` skills, the rule, the PUSH help, the rows, and the shortcut. The automated suite passed: 73 test files.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 4:10:15 PM PT
