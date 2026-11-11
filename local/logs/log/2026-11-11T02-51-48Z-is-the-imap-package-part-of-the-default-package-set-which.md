# Is the imap package part of the default package set, which every project installs when it names none? — In default, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Is the imap package part of the default package set, which every project installs when it names none?

The options:

- **Not in default** — A project that fetches email installs it by name, as sh install default imap. The default set is unchanged.
- **In default** — Every project gets credential.sh and fetch.py, whether it fetches email or not.

The engineer's answer: **In default**
