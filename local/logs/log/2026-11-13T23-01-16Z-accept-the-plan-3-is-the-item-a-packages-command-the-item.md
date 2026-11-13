# Accept the plan? (#3 is the item "A `/packages` command". The item says only its name, so this plan reads it as listing the installed packages, as `/items`, `/features`, and `/notes` list theirs.) — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan? (#3 is the item "A `/packages` command". The item says only its name, so this plan reads it as listing the installed packages, as `/items`, `/features`, and `/notes` list theirs.)
>
> 1. Start an unattended feature for the item, on branch `feature/worktree/packages-command`, in a new worktree. The work states no forecast.
> 2. `/packages` lists every installed package, one row each, foundation first, then by name.
> 3. Each row is the package's name, whether it is Active or Deactivated, and the one-line description at the top of its README.
> 4. Below the table, it names the package set, where one is declared.
> 5. A new foundation rule governs it, loaded on demand when `/packages` is typed.
> 6. Add the `/packages` skill. List it in the PACKAGES help, after `/package-set`. Add a row below `/package` in the command table, and name that row in the command-table rule.
> 7. Compile, run the automated suite, and commit on the feature branch.
> 8. The merge to master waits for your selection.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
