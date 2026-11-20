# Actuation hinge: which actuation does the status-line test make? (test/automated/statusline.sh) — current-progression.sh, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Actuation hinge: which actuation does the status-line test make? (test/automated/statusline.sh)

The options:

- **statusline.sh** — The status line script itself, as the harness runs it. Its second line is read from its output.
- **current-progression.sh** — A new script that only names the current progression and its phase, from the project it runs in. statusline.sh prints what it returns.
- **With the directory** — The same new script, with every use site stating the progressions directory it reads.

The engineer's answer: **current-progression.sh**
