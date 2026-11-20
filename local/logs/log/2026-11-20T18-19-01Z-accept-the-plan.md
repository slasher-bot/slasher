# Accept the plan? — Revise, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write the feature record and its log entry on master. Make the idea Progression, with its log entry. Commit them.
> 2. Create the branch at the selected location.
> 3. Add the /progression command. It takes the subcommands /feature takes, and creates or changes a progression with no kind.
> 4. A progression with no kind is titled "Progression — <name>", tagged [progression], on a branch named progression/<subject>. Its lifecycle is a feature's.
> 5. Add the /progressions command. It lists the current progressions of every kind, as /features lists the features.
> 6. Write the command's help and its rows of the command table.
> 7. Change the progression rules to name a progression with no kind beside a feature and an experiment.
> 8. Check the compressed text of each rule whose meaning changed, and repair it.
> 9. Write the loop record where code changes. Compile the source, and run the suite.
> 10. Commit the change on the branch.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Revise**
