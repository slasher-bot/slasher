# How should a project limit which email accounts it fetches? (Today, a bare /email fetch fetches every account in the machine's Keychain into whatever project the session is in.) — List in the project, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How should a project limit which email accounts it fetches? (Today, a bare /email fetch fetches every account in the machine's Keychain into whatever project the session is in.)

The options:

- **Configured accounts only** — A project fetches only the accounts that have a slasher-email.toml in its email/<name>/ folder, in the project or its private store. RCC already has trustee and gmail. A new account needs that file, even an empty one, before the project fetches it.
- **List in the registry** — The project's entry in ~/.config/slasher/projects.toml lists its accounts, as email-accounts = ["trustee", "gmail"]. Per-machine, outside the repository. A project with no list fetches nothing.
- **List in the project** — A file in the project's local directory, such as email/slasher-email.toml, lists the project's accounts by name. It travels with the project's records. A project with no list fetches nothing.
- **Projects in the Keychain** — credential.sh records, with each stored account, the projects it applies to, and the fetch skips an account not marked for the current project. The limit lives with the credential, not the project.

The engineer's answer: **List in the project**
