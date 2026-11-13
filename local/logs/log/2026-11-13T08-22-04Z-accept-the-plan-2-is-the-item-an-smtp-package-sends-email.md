# Accept the plan? (#2 is the item "An smtp package sends email".) — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan? (#2 is the item "An smtp package sends email".)
>
> 1. Start an unattended feature for the item, on branch `feature/worktree/smtp-package`, in a new worktree. The work states no forecast.
> 2. Add a package `smtp` at `system/smtp/`. It includes `imap`, so it uses imap's Keychain credentials and `credential.sh`.
> 3. `send.py <name> <message-file>` sends one message through the account with that name.
> 4. The message file holds headers, then the body, in the same form as a fetched message.
> 5. `send.py` reads the login and the password from the Keychain item, as `fetch.py` does.
> 6. The SMTP host comes from the account's IMAP host. `imap.example.com` gives `smtp.example.com`. Any other host is used as it is.
> 7. `send.py` connects with TLS on port 465. It adds a From header with the login where the file has none.
> 8. A `/smtp send <name> <message-file>` command runs it.
> 9. A rule in the package makes the agent show the From, To, Cc, Bcc, and Subject lines, and get your confirmation, before each send. A credential never passes through the chat.
> 10. Write the tests first, with a local test SMTP server, as the imap tests use a local IMAP server.
> 11. Add the README, the LICENSE, `install-dependencies.sh`, the help, and the command-table row. Name `smtp` in `slasher-install` and the root README beside `imap`. It is not in the default package set.
> 12. Saving a message to drafts in place of sending is out of scope. Nothing is published.
> 13. Compile, run the automated suite, and commit on the feature branch. The merge to master waits for your selection.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
