# What does list-projects.sh do with a registry that still has an included or excluded list? — Refuse it, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What does list-projects.sh do with a registry that still has an included or excluded list?

The options:

- **Refuse it** — Stop with an error naming the line, and say that each project is now a [[project]] entry. A registry read in part is not reported as the whole one.
- **Ignore the lists** — Read the [[project]] entries and skip the lists silently. An old registry lists nothing until it is converted.

The engineer's answer: **Refuse it**
