# Accept the plan? (#4 is the item "`/unattended` takes the shortcut `/#`, and `/estimate-confidence` takes `/%`".) — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan? (#4 is the item "`/unattended` takes the shortcut `/#`, and `/estimate-confidence` takes `/%`".)
>
> 1. Start an unattended feature for the item, on branch `feature/worktree/shortcuts-hash-and-percent`, in a new worktree. The work states no forecast.
> 2. `/#` becomes the shortcut of `/unattended`.
> 3. `/%` becomes the shortcut of `/estimate-confidence`.
> 4. `/!` is removed and names no command.
> 5. Change the two command table rows, the shortcuts table, the PROCESS help, and the README table to match.
> 6. Change the estimate-confidence rule's trigger and body. Add a History line.
> 7. Change the command-table rule's list of rows. Add a History line.
> 8. Compile, run the automated suite, and commit on the feature branch.
> 9. The merge to master waits for your selection.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
