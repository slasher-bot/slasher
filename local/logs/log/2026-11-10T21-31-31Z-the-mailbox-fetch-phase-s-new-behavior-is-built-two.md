# The mailbox fetch phase's new behavior is built. Two behaviors in the code have no test: the sent folder fetched by default, and a repeat fetch skipping messages already fetched. What next? — Cover both, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The mailbox fetch phase's new behavior is built. Two behaviors in the code have no test: the sent folder fetched by default, and a repeat fetch skipping messages already fetched. What next?

The options:

- **Cover both** — Add a coverage test for each, through the hinges, then end the phase
- **Cover the repeat fetch** — Add a coverage test for skipping messages already fetched, which keeps a repeat fetch from writing duplicates, then end the phase
- **End the phase** — The phase concludes Completed and merges into the feature's branch, with both behaviors untested

The engineer's answer: **Cover both**
