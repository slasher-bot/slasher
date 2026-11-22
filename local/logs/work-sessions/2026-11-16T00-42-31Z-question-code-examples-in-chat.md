# Work Session — Code examples in questions, and the AGENTS.md problem

This work session took an item James Hughes proposed, that a question's code examples be shown in the chat before the selection, and built it as an unattended feature. It also recorded a second report from him, that the installer fails silently where a project already has an `AGENTS.md`. It ended with the feature merged to `master` and the problem item Open.

This is the communicable record of the work session, a guided tour. The items, progression record, loop record, rules, and log entries it points to are the source of truth.

## 1. The item, explained

The engineer asked for the item to be explained and printed. The selection interface renders no markdown, so code in an option's description loses its highlighting and its line breaks. James Hughes's local rule prints each example in the chat under a label, and the selection takes the same labels. The agent added that the selection interface's preview shows code in a fixed-width font beside each option, though without highlighting.

- Item: `2026-11-13T22-41-29Z-a-questions-code-examples-are-shown-in-the-chat-before-the-selection`, Completed

## 2. The feature, unattended

The engineer started the feature in a worktree, unattended, with no forecast, and accepted the plan as first shown.

- The foundation present-every-prompt-to-the-engineer-through-the-selection-ui rule has a section on code examples. Each is printed in the chat in a fenced block with a language tag, under a short label. The selection follows in the same response, each option labeled with its example's label and described by its key line.
- A single-select question also puts each example in its option's preview, since text printed before a question may not be on screen while the question is open.
- The design-by-efferent hinge-cycle rule shows an artifact longer than one line the same way.
- Both rules' compressed texts were checked by a fresh lister and a fresh checker. The hinge rule's check found two lost and three less precise directives from before this change. They were repaired, and both rules were re-checked.

- Progression record: `2026-11-16T00-25-10Z-question-code-examples-in-chat`
- Loop record: the loop record for the feature, under `local/logs/loops/`

## 3. The AGENTS.md problem

James Hughes reported that installing Slasher into a project with an `AGENTS.md` changed nothing and said nothing. He worked around it by adding the bootstrap as `SLASHER.md` and importing it from his `AGENTS.md`. The engineer recorded it as a problem item, with his suggestions of a warning or a prompt kept in his words.

- Item: `2026-11-16T00-38-17Z-the-installer-fails-silently-where-a-project-already-has-an-agents-md`, Open

## 4. The conclusion

The engineer concluded the feature Completed. It merged to `master`, and the automated suite passed: 73 test files. The worktree and the branch were removed on the engineer's selection.

## Takeaways

- A question's code examples are printed in the chat, labeled, and the selection takes the labels, with the code in each option's preview where the question is single-select.
- A compressed-text check can find gaps from before the change it was run for.
- The installer's handling of an existing `AGENTS.md` is an open problem.

## Glossary

- **key line** — the line of a code example that tells it apart from the other examples, used as its option's description.

## Where the durable records live

- `local/items/`: the code examples item, Completed, and the AGENTS.md problem item, Open.
- `local/progressions/`: the question code examples progression record.
- `local/logs/loops/`: the loop record for the feature.
- `local/logs/log/`: an entry for each decision and each change of state.
- `system/foundation/` and `system/design-by-efferent/`: the two rules.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 16:42:31 PT
