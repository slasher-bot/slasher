# A single record's path can't wrap with a hanging indent and also have no bullet: the terminal gives wrapped lines that indent only inside a list item, which shows its bullet. Which form should a single record take? — Blockquote, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> A single record's path can't wrap with a hanging indent and also have no bullet: the terminal gives wrapped lines that indent only inside a list item, which shows its bullet. Which form should a single record take?

The options:

- **Keep the bullet** — Print the path as a list item under Record:, `- ` then the path in backticks. A wrapped line keeps the indent. Only the heading differs from Records:.
- **Blockquote** — Print the path as a blockquote under Record:, `> ` then the path in backticks. The terminal shows a bar at the left in place of a bullet, and a wrapped line keeps the indent. I have not seen how it renders here.
- **Indent, no hanging** — Keep the current form: indented, no bullet. A wrapped line starts at the left edge.

The engineer's answer: **Blockquote**
