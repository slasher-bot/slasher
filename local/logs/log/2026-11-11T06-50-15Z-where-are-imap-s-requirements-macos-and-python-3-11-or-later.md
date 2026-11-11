# Where are imap's requirements, macOS and Python 3.11 or later, checked? — When the scripts run (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where are imap's requirements, macOS and Python 3.11 or later, checked?

The options:

- **When the scripts run (Recommended)** — credential.sh, fetch.py, and list.py each check what they need when they start, and stop with a message naming what is missing. It works however the package arrived, and needs no change to the installer.
- **When the installer adds it** — A package may carry a check script, and the installer runs it after adding the package, and warns where it fails. It needs a change to the installer, and a check missed at install still fails later at run time.
- **Both** — A check at install, as a warning, and the same checks when the scripts run.

The engineer's answer: **When the scripts run (Recommended)**
