# Where does fetched email go, in the project's local files and in its private store? — local/email and the private share, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where does fetched email go, in the project's local files and in its private store?

The options:

- **local/email and the private share** — In the project, under slasher/local/email/, committed with the project. Privately, under ~/.local/share/slasher/email/<project>/, outside the repository, as the private journal is kept. Each mailbox and folder has its own folder inside.
- **A folder the engineer names** — The fetch writes where it is told, as RCC's fetch does, and names no default for either place.

The engineer's answer: **local/email and the private share**
