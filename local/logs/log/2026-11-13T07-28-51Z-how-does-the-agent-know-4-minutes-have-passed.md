# How does the agent know 4 minutes have passed? — A hook on each prompt, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How does the agent know 4 minutes have passed?

The options:

- **A hook on each prompt** — /private session writes its start time to a file outside the repository. A hook on each prompt reads it, and where 4 minutes have passed, tells the agent to ask before anything else. It survives compaction.
- **The agent checks the time** — The rule alone: the agent reads the clock before each act and asks where 4 minutes have passed. No script, but the start time can be lost when the conversation is compacted.

The engineer's answer: **A hook on each prompt**
