# Accept the plan? — Revise, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Name the file account.toml. It sits where fetch.toml sits now: slasher/local/email/<name>/, or the private store.
> 2. Give it two tables. [imap] holds store and the [[imap.folder]] entries. [smtp] holds host, which replaces the host that send.py derives.
> 3. Write the test first: a send through an account.toml whose [smtp] host names an unreachable host.
> 4. Add account.py to the imap package. It finds and reads the account file, in the project and then in the private store.
> 5. Change fetch.py to read [imap] from account.toml through account.py.
> 6. Change send.py to read [smtp] host through account.py, and keep the derived host where none is given.
> 7. Keep fetch.toml as a fallback where no account.toml exists, so a project that has one still fetches. Write a test for it.
> 8. Conform the fetch tests to account.toml.
> 9. Change the imap and smtp READMEs and rules to name account.toml.
> 10. Run the suite.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Revise**
