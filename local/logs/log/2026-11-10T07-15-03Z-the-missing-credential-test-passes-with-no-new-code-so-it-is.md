# The missing-credential test passes with no new code, so it is coverage, not design. Keep it? — Keep it as coverage, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The missing-credential test passes with no new code, so it is coverage, not design. Keep it?

The options:

- **Keep it as coverage** — The test stays, preventing a regression where a missing credential reads as empty and succeeds
- **Drop it** — The test file is removed, and the outcome is not part of the design

The engineer's answer: **Keep it as coverage**
