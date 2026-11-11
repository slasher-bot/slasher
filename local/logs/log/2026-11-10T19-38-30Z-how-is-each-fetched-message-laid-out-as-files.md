# How is each fetched message laid out as files? — As RCC does, with Slasher's prefix, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How is each fetched message laid out as files?

The options:

- **As RCC does** — One plain-text file per message, headers then body, with attachments as files beside it in the same folder, named with the message's date and UID. No raw copy is kept.
- **As RCC does, with Slasher's prefix** — The same files, named with the ISO-8601-UTC prefix the rest of the project's records use.
- **Raw message file** — One .eml file per message, exactly as the server sent it. Nothing is lost, and mail programs open it, but it is hard to read as text.
- **Text and raw** — The plain-text file and attachments for reading, and the raw .eml beside them, so nothing is lost.

The engineer's answer: **As RCC does, with Slasher's prefix**
