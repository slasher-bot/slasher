# Accept the plan? (#2 is the item "A `/reprint-and-review` command, with the shortcut `/rr`".) — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan? (#2 is the item "A `/reprint-and-review` command, with the shortcut `/rr`".)
>
> 1. Start an unattended feature for the item, on branch `feature/worktree/reprint-and-review`, in a new worktree. The work states no forecast.
> 2. The command goes in the `language` package, beside `/brief` and `/expand`, since it works on a draft's text.
> 3. `/reprint-and-review` prints the draft as it now stands, whole and unchanged. The draft is the text the conversation is working on. `/rr <file>` names a file in place of it.
> 4. A review follows the draft. It is a numbered list of findings, most important first. Each finding quotes the passage, says what is wrong, and suggests a change.
> 5. The review judges the draft by its purpose and its reader. Where the draft is Slasher's own prose, it also judges it by the language package's rules.
> 6. The command changes nothing in the draft. The engineer decides which findings to act on.
> 7. Where no draft is under way, the command says so and asks which text is meant.
> 8. A new language rule governs it, loaded on demand. Add the `/reprint-and-review` and `/rr` skills, the LANGUAGE help lines, a command-table row, the shortcuts-table row, and the command-table rule's mention of the row.
> 9. Compile, run the automated suite, and commit on the feature branch. The merge to master waits for your selection.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
