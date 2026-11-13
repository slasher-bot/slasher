# Accept the plan? (#4 is the item "`/idk` says I don't know to the agent".) — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan? (#4 is the item "`/idk` says I don't know to the agent".)
>
> 1. Start an unattended feature for the item, on branch `feature/worktree/idk-command`, in a new worktree. The main working tree keeps its uncommitted private-session files. The work states no forecast.
> 2. Write a foundation rule for `/idk`. `/idk` answers the agent's last question with "I don't know".
> 3. The rule says the agent does not take `/idk` as a selection.
> 4. The agent explains in plain words what the question decides and what each option does, with an example.
> 5. The agent gives its recommendation and its reason.
> 6. The agent puts the question again, with the recommended option first.
> 7. Words after `/idk` say what the engineer does not know. The explanation answers those words.
> 8. Where no question was put, the agent says so and puts nothing.
> 9. Add the `/idk` skill in the foundation package. Add `/idk` to the PROCESS help, after `/ask-again`. Give it no row in the command table, as `/brief` has none.
> 10. Compile, run the automated suite, and commit on the feature branch.
> 11. The merge to master waits for your selection.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
