# Loop record — A question's code examples are shown in the chat before the selection

A question with code examples prints each example in the chat, labeled, and the selection takes the same labels. The foundation present-every-prompt-to-the-engineer-through-the-selection-ui rule says so, and the design-by-efferent hinge-cycle rule shows a long artifact the same way. The engineer accepted the plan as first shown.

**Mode:** unattended.

## 1. Where the directive lives

- **Hinge:** which rule carries it.
- **Decision:** a section of the foundation present-every-prompt-to-the-engineer-through-the-selection-ui rule. That rule already governs every question put through the selection interface, and is pre-loaded, so the directive is read before any question is put.

## 2. The preview

- **Hinge:** whether to rely on the chat alone, as the item says.
- **Decision:** also put each example in its option's preview, where the question is single-select. Text printed before a question may not be on screen while the question is open, which the item did not account for. The preview is shown beside the options, though without highlighting.

## 3. The hinge rule

- **Hinge:** the hinge rule says an option is the artifact, not a label for it, which the labels could appear to contradict.
- **Decision:** the hinge rule says an artifact longer than one line is shown in the chat and the preview, and that the label then does not stand in for it, since the artifact is still on screen.

## 4. The compressed text

- **Hinge:** whether the compressed texts are checked or marked not re-checked.
- **Decision:** checked, each by a fresh lister and a fresh checker, as the rule on compressed text requires for a new directive. The hinge rule's check found two directives lost and three less precise from before this change. They were repaired, and both rules were re-checked.

**Outcome:** the two rules, their compressed texts, and their figures. The automated suite passed: 73 test files.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 16:29:47 PT
