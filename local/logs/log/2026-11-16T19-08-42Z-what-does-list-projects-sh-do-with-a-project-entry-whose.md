# What does list-projects.sh do with a [[project]] entry whose path is not a Slasher project, such as a folder that was moved or deleted? — Report it and go on, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What does list-projects.sh do with a [[project]] entry whose path is not a Slasher project, such as a folder that was moved or deleted?

The options:

- **Report it and go on** — Print the other projects, and say on standard error which path is not a Slasher project, as the reader does today for a missing folder.
- **List it anyway** — Print every entry's path, unchecked. The registry is taken as the truth.
- **Refuse the registry** — Stop with an error naming the entry. Nothing is listed until it is fixed.

The engineer's answer: **Report it and go on**
