# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write a test that a bare /unrecorded writes the session's state file, and /unrecorded end removes it.
> 2. Write a test that after 4 minutes with no prompt, the hook tells the agent to ask whether to continue or end the session.
> 3. Make the prompt hook do both, with the state beside the private session's state.
> 4. Write a test that starting either session ends the other, so records only go one way.
> 5. Write a test that the process-question hook writes no log entry while an unrecorded session lasts, and writes one after it ends.
> 6. Make the process-question hook read the session's state and skip the entry.
> 7. Write a foundation rule for an unrecorded session. No item, log entry, journal entry, work session record, implementation record, loop record, migration record, or brainstorm collection is written. Package set declarations, fetched email, code, rules, and other files that are not records still change.
> 8. The rule says the agent announces the session's start and end, prints no Record: line, and asks to end the session before it changes an existing record or starts a feature or experiment.
> 9. Write the /unrecorded skill for the session only, and list it in the PRIVATE section of the help. The private session's log hook stays as it is.
> 10. Run compile.sh and the full suite.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
