# Which language is the mailbox fetch written in? — Python, standard library, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which language is the mailbox fetch written in?

The options:

- **Python, standard library** — A Python script on imaplib, ssl, and email, as RCC's working fetch is. It parses messages and attachments with the standard library, and needs Python 3 on the machine, which macOS developer tools provide.
- **Shell, with curl** — A /bin/sh script like the credential script, fetching with curl's IMAP support. It needs nothing beyond macOS, but parsing messages, encodings, and attachments in shell is limited.

The engineer's answer: **Python, standard library**
