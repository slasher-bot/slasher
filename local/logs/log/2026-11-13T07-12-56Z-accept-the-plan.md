# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Add `/private session <instruction>` to the private-records rule. From that command until the session ends, the session is a private session.
> 2. In a private session, every record the agent writes goes to the private directory, never into the project.
> 3. Records include items, log entries, journal entries, work session records, implementation records, and loop records. Add a private directory for each kind that has none.
> 4. The agent carries out the instruction after `session` in the private session. With no instruction, the private session starts and the agent waits.
> 5. The log-entry hook still writes into the project. In a private session, the agent moves each entry the hook writes to the private log directory.
> 6. A file that is not a record, such as code, a rule, or a README, still changes in the project. The engineer asked only for the session's records to be private.
> 7. Nothing written in a private session takes a commit, and nothing about it is logged in the project.
> 8. `/private session end` ends the private session before the session ends.
> 9. The agent says once, when the private session starts, that the session's records go to the private directory.
> 10. Add the term "private session" to the foundation vocabulary. Update the command, its help, and the README.
> 11. Compile the rules, build the plugin, and run the suite.
> 12. Offer a commit on the branch when the suite passes.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
