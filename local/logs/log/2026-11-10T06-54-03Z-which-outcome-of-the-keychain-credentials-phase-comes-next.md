# Which outcome of the Keychain credentials phase comes next? — A credential is stored, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which outcome of the Keychain credentials phase comes next?

The options:

- **A credential is stored** — credential.sh stores a credential for a host and user, so a mailbox can be set up without the security command
- **A missing credential fails** — Reading a host and user with no stored credential exits with an error
- **The phase is complete** — Reading is all this phase needs, and the mailbox fetch comes next

The engineer's answer: **A credential is stored**
