# Which installer sets include the prose package? (default today: foundation, language, testing, git, versioning, design-by-efferent, journal. content today: foundation, language, git, versioning, journal.) — content set only, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which installer sets include the prose package? (default today: foundation, language, testing, git, versioning, design-by-efferent, journal. content today: foundation, language, git, versioning, journal.)

The options:

- **content set only** — `sh slasher-install content` installs prose. The default set does not include it, and a default project installs it by naming it.
- **content and default** — Every project installed with no arguments, and every content project, gets prose.
- **Neither set** — prose is listed with imap and smtp, outside every set. A project installs it by naming it.

The engineer's answer: **content set only**
