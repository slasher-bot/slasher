# An account whose credential has no name is fetched by host or with every account. Where does its mail go? — A folder named for host and login, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> An account whose credential has no name is fetched by host or with every account. Where does its mail go?

The options:

- **A folder named for the login** — Its mail goes under its login, which is unique on a host, as in slasher/local/email/you@gmail.com/. Its fetch file, if any, sits there too.
- **A folder named for host and login** — Its mail goes under the host and the login together, as in slasher/local/email/imap.gmail.com/you@gmail.com/.
- **It is skipped** — Every account to be fetched has a name. One without is skipped, and the fetch says so.

The engineer's answer: **A folder named for host and login**
