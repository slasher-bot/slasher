# Where should James Hughes's example image be filed? The repository is public, and the image shows code from his project, so committing it publishes that code. The items directory holds only items, and an item holds no code samples. — Beside the item, same name, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should James Hughes's example image be filed? The repository is public, and the image shows code from his project, so committing it publishes that code. The items directory holds only items, and an item holds no code samples.

The options:

- **A new attachments directory** — local/attachments/2026-11-13T22-41-29Z-question-code-examples.png, with the item linking to it. local/ has no attachments directory today, so a local rule defines it and a log entry records it. Committed and public.
- **A private record** — Kept under ~/.local/share/slasher/, outside the repository, with the item naming it as a private record. Nothing of his project is published, and only this machine has the image.
- **Beside the item, same name** — local/items/2026-11-13T22-41-29Z-a-questions-code-examples-are-shown-in-the-chat-before-the-selection.png. It sorts next to its item, but puts a file that is not an item in the items directory, which its rule forbids. Committed and public.
- **Not filed** — The item keeps its description in words, and the image stays on the Desktop.

The engineer's answer: **Beside the item, same name**
