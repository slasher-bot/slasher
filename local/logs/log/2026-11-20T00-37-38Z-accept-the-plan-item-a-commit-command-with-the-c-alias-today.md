# Accept the plan? (Item: A /commit command, with the /c alias. Today /c is an alias of /current, so /c moves to /commit.) — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan? (Item: A /commit command, with the /c alias. Today /c is an alias of /current, so /c moves to /commit.)
>
> 1. Start an unattended feature, feature/worktree/commit-command, in a new worktree. The worktree keeps the uncommitted expanded-answer changes out of this work. The feature states no forecast.
> 2. Commit the feature record, the item's Implementation state, and their log entries on master. Accepting this plan selects that commit.
> 3. Write a git rule: /commit runs the automated suite, commits the working tree's changes under the commit-message rules, and pushes nothing. /c does exactly what /commit does.
> 4. Add the /commit and /c skills to the git package. Remove the /c skill from foundation.
> 5. Add /commit and /c to the PUSH help, and add a /commit, /c row to the command table.
> 6. Take /c off /current in the shortcuts table, the table header, the startup table, the PROCESS help, and the command-table rule.
> 7. Change the startup's current line to: Type /current or /' for open and active work.
> 8. Compile, and run the automated suite.
> 9. Commit on the feature branch, and complete the feature and the item.
> 10. Stop before the merge to master. The merge waits for your selection.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
