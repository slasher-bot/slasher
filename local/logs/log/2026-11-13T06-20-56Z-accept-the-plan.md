# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Rename the command from /document to /private. Rename the rule to anything-given-to-private-is-recorded-only-in-the-private-directory.
> 2. Every private record sits under ~/.local/share/slasher/, in one directory for each kind and project. The private journal keeps its directory, journal/<project>/.
> 3. /private <words> writes the words as a private document, in documents/<project>/.
> 4. /private <file path> moves that file into documents/<project>/. Where the file is tracked by git, the agent asks first, since the move deletes it from the repository.
> 5. /private item <words> writes an item in items/<project>/. It has the shape of an item, with no log entry and no commit.
> 6. /private log <words> writes a log entry in log/<project>/. It has the shape of a log entry, with no commit.
> 7. /private journal <words> writes a private journal entry, as /journal private does now.
> 8. /private read and /private list read and list the private records, of every kind or of one.
> 9. A private record moves into the project only on the engineer's confirmed command. The command has no subcommand for this.
> 10. Rewrite the vocabulary term as "private record". Update the help, the command table, and the README.
> 11. Compile the rules, build the plugin, and run the suite.
> 12. Offer a commit on the branch when the suite passes.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
