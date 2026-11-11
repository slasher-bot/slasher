# How does a repeat fetch skip messages already fetched? — By UID in file names (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How does a repeat fetch skip messages already fetched?

The options:

- **By UID in file names (Recommended)** — As RCC does: the UIDs are read from the file names already in the folder, and those messages are skipped. Nothing else is stored. If the server renumbers the mailbox, messages may be fetched twice.
- **By a fetch record** — A small file in the folder records the mailbox's UID validity and the last UID fetched. Only newer messages are fetched, and a renumbered mailbox is noticed and reported.

The engineer's answer: **By UID in file names (Recommended)**
