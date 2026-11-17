# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write a test for the migration. A Slasher project with suffixed items and implementations is updated, and each record loses its suffix. Its content does not change.
> 2. Write a test for a clash. Where the name without the suffix is already taken, the record keeps its name and the installer says so.
> 3. Add the migration to install.sh. It runs after the older migrations, which find records by their suffix.
> 4. Change the current-implementation test so its records carry no suffix. Then change current-implementation.sh to read the State line.
> 5. Change the statusline tests the same way.
> 6. Rewrite the suffix rule as a rule that a record's file name carries no state, and rename it. Change the items, implementations, notes, file-names, records-line, open, branch, and private rules to match, each with a History line.
> 7. Check each changed compressed text with two fresh agents, as the compression rule requires.
> 8. Rename this project's items and implementations with git mv, this feature's record too. Historical records stay as written.
> 9. Write a migration record for the change in Slasher projects.
> 10. Run compile.sh and the full suite.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
