# Which piece of the status-line feature comes next? — Installed (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which piece of the status-line feature comes next?

The options:

- **Installed (Recommended)** — current-implementation.sh also finds records under slasher/local/implementations/, so the second line appears in installed projects.
- **Several current** — Only the implementation most recently acted upon is printed, not one line each.
- **With a phase** — The branch of the phase under way is printed, such as feature/receipt.tax-line.
- **None current** — Nothing is printed, which the script already does. The test records it.

The engineer's answer: **Installed (Recommended)**
