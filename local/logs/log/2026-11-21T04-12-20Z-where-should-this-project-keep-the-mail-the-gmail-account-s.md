# Where should this project keep the mail the gmail account's test fetch takes? — Private store, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should this project keep the mail the gmail account's test fetch takes?

The options:

- **Private store** — store = "private": the messages go outside the repository, under ~/.local/share/slasher/, so no mail is committed here
- **Project store** — store = "project": the messages go into local/email/gmail/ in this repository, as Career's do

The engineer's answer: **Private store**
