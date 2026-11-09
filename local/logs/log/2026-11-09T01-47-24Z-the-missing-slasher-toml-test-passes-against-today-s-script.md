# The missing-slasher.toml test passes against today's script. Keep it as coverage, or drop it and move on? — Keep it as coverage, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The missing-slasher.toml test passes against today's script. Keep it as coverage, or drop it and move on?

The options:

- **Keep it as coverage** — Keep base-without-slasher-toml.sh. It prevents a later change from printing a path when slasher.toml is missing.
- **Drop it and move on** — Delete the test. The next outcome is -system with no system-project.toml.

The engineer's answer: **Keep it as coverage**
