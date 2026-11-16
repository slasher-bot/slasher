# `/item status <item>` takes an item identifier. What can the identifier be? — Number from the last list, Datetime prefix, Words from the title, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> `/item status <item>` takes an item identifier. What can the identifier be?

The options:

- **Number from the last list** — The number of a row in the last list of items printed, as in `/item status 6`.
- **Datetime prefix** — The item's datetime, as in `/item status 2026-11-16T19-30-13Z`.
- **Words from the title** — Words that match one item's title, as in `/item status packages command`.

The engineer's answer: **Number from the last list, Datetime prefix, Words from the title**
