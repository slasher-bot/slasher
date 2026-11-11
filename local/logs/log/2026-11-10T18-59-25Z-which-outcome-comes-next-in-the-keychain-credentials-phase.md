# Which outcome comes next in the Keychain credentials phase? — Write with a name (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which outcome comes next in the Keychain credentials phase?

The options:

- **Write with a name (Recommended)** — credential.sh write some-host some-user --name some-name stores the name as the item's label, so a read by name can find it
- **Read by host alone** — credential.sh read some-host reads the host's one credential, in place of host and user

The engineer's answer: **Write with a name (Recommended)**
