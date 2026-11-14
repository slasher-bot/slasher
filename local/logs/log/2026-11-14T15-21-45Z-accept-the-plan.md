# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write a test, test/automated/conform-email/unmatched.sh. Its export holds an empty message file and a file with no message's time and UID.
> 2. The test reads that each file reaches the store. The empty message takes an imap name from its old name's time, read as Pacific time, its UID, and its subject. The other file keeps its own name.
> 3. Change conform-email.sh so that every file under the export reaches the store. A file it cannot name as a message or an attachment is copied under its own name, and reported.
> 4. An empty .txt file whose name holds a time and a UID, and that matches no message, is named as a message from its name.
> 5. Name each new outcome.
> 6. Run the suite.
> 7. Run the conversion again into the private store, and confirm every folder matches the export.
> 8. Record the change in the experiment's record, and offer the commit.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
