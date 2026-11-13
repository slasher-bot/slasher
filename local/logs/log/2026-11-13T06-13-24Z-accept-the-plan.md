# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write a foundation rule for private documents. It loads when the engineer asks to write, read, list, or move one.
> 2. The rule puts each project's private documents in ~/.local/share/slasher/documents/<project>/. The agent makes the directory when the first document is written.
> 3. The rule keeps a private document out of commits, out of the session-start read, and out of the log.
> 4. The agent writes, reads, or lists a private document only on the engineer's command.
> 5. A private document moves into the project only on the engineer's command, to the place the engineer names.
> 6. The rule states what private does not promise. A document the agent reads or writes passes through the session.
> 7. Add the term "private document" to the foundation vocabulary.
> 8. Add a /document command with the subcommands new, read, list, move, and help. Add its command-table rows and its help text.
> 9. Add the rule to the foundation README.
> 10. Compile the rules, build the plugin, and run the suite.
> 11. Offer a commit on the branch when the suite passes.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
