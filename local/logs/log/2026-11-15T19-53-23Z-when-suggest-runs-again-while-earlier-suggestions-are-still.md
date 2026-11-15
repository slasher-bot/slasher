# When /suggest runs again while earlier suggestions are still neither accepted nor rejected, what happens to them? — Added, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> When /suggest runs again while earlier suggestions are still neither accepted nor rejected, what happens to them?

The options:

- **Replaced** — The new suggestions replace the pending ones, and numbering starts again from 1. The earlier ones are dropped without being applied, and remain only in the earlier chat output.
- **Added** — The new suggestions are added after the pending ones, and numbering continues, so `/suggest accept 4` can follow suggestions 1 to 3. Nothing is lost.
- **Asked first** — The agent asks, through the selection interface, whether to accept, reject, or drop the pending suggestions before it suggests new ones. Nothing is lost without your selection.

The engineer's answer: **Added**
