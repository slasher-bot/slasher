# The imap fetch has no way to say which email accounts belong to a project: a bare /email fetch fetches every account stored in the machine's Keychain. How should this be recorded? — Problem item, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The imap fetch has no way to say which email accounts belong to a project: a bare /email fetch fetches every account stored in the machine's Keychain. How should this be recorded?

The options:

- **Problem item** — Record it as an item tagged [problem], Open, with the cause found in fetch.py.
- **Work item** — Record it as an item tagged [work], Open: a project names the email accounts that apply to it, and a bare fetch fetches only those.
- **Don't record it** — Record nothing.

The engineer's answer: **Problem item**
