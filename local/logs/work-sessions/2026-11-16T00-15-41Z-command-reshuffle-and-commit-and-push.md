# Work Session — Prose commands, email send, and commit-and-push (2026-11-15)

This work session moved commands between packages and renamed them, then built one new command. `/reprint-and-review` moved to the `prose` package and became `/print-and-review`, with the shortcut `/pr`. Sending email moved under `/email`, and `/smtp` was removed. It ended with `/commit-and-push`, and its shortcut `/cp`, built as an unattended feature and merged to `master`.

This is the communicable record of the work session, a guided tour. The items, implementation record, loop record, rules, and log entries it points to are the source of truth.

## 1. Print-and-review moves to prose

The engineer moved `/reprint-and-review` and `/rr` to the `prose` package, and selected the REVIEW help to list them. The engineer then renamed the command `/print-and-review`, and its shortcut `/pr`. No built-in or Slasher command takes `/pr`. The rule is now the print-and-review-prints-the-draft-and-a-review-of-it rule, with History lines for the move and both renames.

## 2. Email send

The engineer asked for the smtp commands to come under `/email`, and selected `/email send`, with `/smtp` removed. The `imap` package's `/email` command loads the `smtp` package's rule for a send, and says so where `smtp` is not installed or is deactivated. The `smtp` package carries no command of its own. The test that a deactivated `smtp` leaves out `/smtp` was removed, since there is no `/smtp`.

## 3. The commit-and-push command

The engineer recorded *Commit and push command and shortcut* as a work item and started it as a feature on a branch, unattended, with no forecast. The engineer accepted the plan as first shown. `/commit-and-push`, with `/cp`, runs the automated suite, commits the work, and pushes the current branch. Typing it is the request, so it asks only about changes the session did not make. It is in the `git` package, in the PUSH domain, whose description now names both acts.

- Item: `2026-11-15T23-56-12Z-a-command-and-shortcut-commit-and-push`, Completed
- Implementation record: `2026-11-16T00-08-27Z-commit-and-push-command`
- Loop record: the loop record for the commit-and-push command, under `local/logs/loops/`

## 4. The conclusion

`/feature start` was typed while the feature was already Active. The agent put a question that the engineer stopped. `/.` then brought the conclusion, and the engineer selected Completed. The branch merged to `master`, the automated suite passed with 73 test files, and the branch was deleted on the engineer's selection.

## Takeaways

- `/print-and-review`, with `/pr`, is in the `prose` package, and REVIEW's help lists it.
- `/email send` sends, and `/smtp` is gone.
- `/commit-and-push`, with `/cp`, runs the suite, commits, and pushes.

## Glossary

- **commit-and-push** — the command that runs the suite, commits the work, and pushes the current branch, as one request.

## Where the durable records live

- `local/items/`: the commit-and-push work item, Completed.
- `local/implementations/`: the commit-and-push command implementation record.
- `local/logs/loops/`: the loop record for the feature.
- `local/logs/log/`: an entry for each decision and each change of state.
- `system/prose/`, `system/imap/`, `system/smtp/`, and `system/git/`: the commands, their rules, and their help.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 4:15:41 PM PT
