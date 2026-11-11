# What does /email fetch do with no name or host, and so what does a bare /email do? — Fetches every account, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What does /email fetch do with no name or host, and so what does a bare /email do?

The options:

- **Fetches every account** — Every account in the Keychain is fetched, each following its own fetch file, as a fetch by host does for one host.
- **Asks which account** — The agent puts the accounts to you through the selection interface, and fetches the one you pick.

The engineer's answer: **Fetches every account**
