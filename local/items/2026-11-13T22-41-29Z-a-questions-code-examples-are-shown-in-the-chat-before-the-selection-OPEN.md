# A question's code examples are shown in the chat before the selection

- **State:** Open
- **Tags:** [work]

**Where a question put through the selection interface has code examples, each example is shown in the chat first, as a labeled fenced code block, and the selection follows with the same labels.** The selection interface renders no markdown, so code in an option's description loses its highlighting and its line breaks. The chat renders markdown. The cost is that the code no longer sits directly beneath the option's label.

**Submitted by James Hughes, in the Eventide Slack.** They added it to their project as a local rule, `local/rules/question-code-format.md`, which reads:

> When a question has code examples, show each example in the chat before you open the option picker. Use a fenced Markdown code block with a language tag. Keep the original indentation. Give each example a short label and use the same label in the picker. Always show the labeled examples and the picker at the same time.

**As James Hughes stated it:** "It's a bummer that AskUserQuestion doesn't support markdown. I added local/rules/question-code-format.md with this content and it vastly improves readability (at the expense of locating the code directly beneath the answer label)." And: "It just hoists the code previews up into the chat section where markdown is possible."

**They also stated:** "I briefly tried to figure out how to add it to system/foundation/source/the-command-domain-table-prints-when-the-rules-have-loaded.md but it wasn't obvious to me how the ## Compression section is generated." The `## Compressed` text is written by the agent beside the body and checked against it, and the `## Compression` section records the figures of that check. The a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body rule governs both, and `./compile.sh` only copies the Compressed text into the package's rules file.

**Their example** is a controls hinge with three candidates, each a few lines of Swift test code shown as a highlighted block in the chat, then the selection with the three labels and each one's key line as its description.

The image they posted is beside this item: [`2026-11-13T22-41-29Z-a-questions-code-examples-are-shown-in-the-chat-before-the-selection.png`](2026-11-13T22-41-29Z-a-questions-code-examples-are-shown-in-the-chat-before-the-selection.png).

---

Authored by Scott Bellware on Fri Nov 13 2026 at 2:41:29 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 2:43:26 PM PT
