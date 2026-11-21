# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write the feature record Active and its log entry. Make the work item Progression, with its log entry. Commit them on master, on your selection.
> 2. Create the branch feature/worktree/item-starts-an-implementation in a new worktree at ../slasher-feature-worktree-item-starts-an-implementation.
> 3. An item is started directly when the engineer asks to start or do it without naming a kind, as in "Do #4 unattended".
> 4. An item started directly takes an implementation, not a feature. Its record is titled "Implementation — <name>" and tagged [implementation]. Its branch is implementation/<subject>.
> 5. A request that names a kind, as "Start #1 as an unattended feature", still creates that kind.
> 6. /item start and /start keep their meaning. They make an item Active and create no progression.
> 7. State this in the unattended rule, the items rule, and the progressions rule.
> 8. Check the compressed text of each changed rule, and repair it.
> 9. Compile the source, and run the suite.
> 10. Commit the change on the branch.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
