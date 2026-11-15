# How should the smtp commands come under /email? (/email is the imap package's command, and /smtp is the smtp package's.) — /email send, /smtp gone, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How should the smtp commands come under /email? (/email is the imap package's command, and /smtp is the smtp package's.)

The options:

- **/email send, /smtp gone** — /email send <name> <message-file> sends, and EMAIL's help lists it. /smtp and the SMTP help section are removed. Where the smtp package is not installed, /email send says so.
- **/email send, /smtp kept** — /email send <name> <message-file> sends, and EMAIL's help lists it. /smtp send stays as an alias of /email send, listed in EMAIL's help. The SMTP help section is removed.
- **Help only** — The commands stay /smtp send, but EMAIL's help lists them, and the SMTP help section is removed.

The engineer's answer: **/email send, /smtp gone**
