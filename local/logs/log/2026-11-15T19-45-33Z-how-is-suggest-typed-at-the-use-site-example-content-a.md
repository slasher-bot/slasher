# How is /suggest typed at the use site? (Example content: a checkout project's receipt page copy.) — Target named, numbered, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How is /suggest typed at the use site? (Example content: a checkout project's receipt page copy.)

The options:

- **Target named, all-or-none** — `/suggest the receipt page copy` names the content. A bare `/suggest` acts on the content the conversation is on. `/suggest accept` and `/suggest reject` settle every pending suggestion together.
- **Target named, numbered** — `/suggest the receipt page copy` names the content, and a bare `/suggest` acts on the content the conversation is on. Suggestions are numbered. `/suggest accept 1 3` and `/suggest reject 2` settle some. A bare `/suggest accept` or `/suggest reject` settles all.
- **No target, all-or-none** — `/suggest` takes no words. It always acts on the content the conversation is on. `/suggest accept` and `/suggest reject` settle every pending suggestion together.

The engineer's answer: **Target named, numbered**
