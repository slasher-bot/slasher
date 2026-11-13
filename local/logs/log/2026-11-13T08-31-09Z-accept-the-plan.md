# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Create the branch feature/worktree/smtp-operational in a new worktree, and the feature record.
> 2. Add an automated test that a refresh brings an smtp change down, as imap's refreshed.sh does.
> 3. Add an interactive test that installs smtp by name, with imap, from the published repositories.
> 4. Add an interactive test that sends one real message through an account you name, to an address you name. You run it.
> 5. Compile, run the direct-commit check and the automated suite, and commit.
> 6. Create the public repository slasher-bot/smtp, with the description "Slasher SMTP. Email sent through an SMTP account, with its credential read from the macOS Keychain, where the imap package keeps it."
> 7. Split system/smtp and push it to that repository's master.
> 8. Stop for you to run the two interactive tests.
> 9. The merge to master waits for your selection.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
