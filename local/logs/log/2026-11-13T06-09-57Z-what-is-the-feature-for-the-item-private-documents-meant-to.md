# What is the feature for the item "Private documents" meant to build? The item holds only its title. — Outside the repository, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What is the feature for the item "Private documents" meant to build? The item holds only its title.

The options:

- **Outside the repository** — Documents kept outside the project's repository, beside the private journal, as ~/.local/share/slasher/documents/<project>/. Not committed and not read at session start. Read or written only on the engineer's command.
- **Inside, but ignored** — Documents kept in the project under slasher/local/, in a directory git ignores. Not committed, and not read at session start.
- **A private record kind** — Any record (an item, a note, a log entry) can be marked private and kept outside the repository, as the private journal is for journal entries.

The engineer's answer: **Outside the repository**
