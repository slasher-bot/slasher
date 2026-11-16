# How does a new journal entry reach the private journal where the project's setting is journal = "private"? — Skill and rule instruction, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How does a new journal entry reach the private journal where the project's setting is journal = "private"?

The options:

- **Skill and rule instruction** — The /journal skill and the journal-entries rule tell the agent to run read-project-setting.sh journal, and to write a private entry where it prints private. No new script and no test. It also covers an entry begun by saying "new entry".
- **A journal-directory script** — A journal script, built on read-project-setting.sh and tested, prints the directory a new entry goes to: slasher/local/journal/<username>/ or ~/.local/share/slasher/journal/<project>/. The skill and the rule tell the agent to write there.

The engineer's answer: **Skill and rule instruction**
