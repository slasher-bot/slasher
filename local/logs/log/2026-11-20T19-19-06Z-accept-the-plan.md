# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write the feature record and its log entry on master. Make the work item Progression, with its log entry. Commit them.
> 2. Create the branch at the selected location.
> 3. Add a last line to the item status report: Ready to conclude, yes or no. Where no, name what stands in the way.
> 4. An item is ready to conclude when everything it asks for exists and no decision it needs is open.
> 5. Add the same line to the progression status report. A progression is ready to conclude when its plan is done, its work is committed, the automated suite passes, and its branch merges without a conflict.
> 6. State in the /status rule that its report carries the line, for an item and for a progression.
> 7. The line reports and offers nothing. It does not conclude the record or ask whether to.
> 8. Check the compressed text of each changed rule, and repair it.
> 9. Compile the source, and run the suite.
> 10. Commit the change on the branch.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
