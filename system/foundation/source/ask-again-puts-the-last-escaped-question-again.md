# Ask-again puts the last escaped question again

**Trigger:** When the engineer types `/ask-again` or `/,`, or asks for the last question again

**`/ask-again` puts the last question the engineer escaped again, through the selection interface.** The engineer escapes a question by refusing it, by stopping it to clarify, or by interrupting it. The agent does not put an escaped question again on its own, so `/ask-again` is how the engineer asks for it. `/,` is its shortcut alias.

**As the engineer stated it:** Ask Again shourtcut

**The question is put again as it was asked.** Its text, its options, and their descriptions are the same. A question that carried the decision marker carries it again, so its answer is logged as a process question.

**Where the conversation since has changed a candidate, the question carries the change.** A clarification the engineer asked for can show that an option was wrong, or that one was missing. Put the question with the options as they now stand, and say in one sentence what changed.

**Where no question was escaped, say so, and put nothing.** Do not put again a question the engineer answered. Do not reach back past the last escaped question to an earlier one.

**Why:** an escaped question is not put again unasked, so that the engineer has time to digest it. The engineer then needs a short way to say *I am ready, ask me again*. A fixed command keeps that request from being read as something else.

**How to apply:** on `/ask-again` or `/,`, find the last question the engineer escaped. Put it again through the selection interface, as it was asked, with any change the conversation since has made to its candidates. Where none was escaped, say so.

## History

Until Wed Nov 11 2026 the shortcut alias of `/ask-again` was `/..`.

Related:

- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — an escaped selection is not put again unasked
- the a-process-question-and-its-answer-are-logged rule — the decision marker the question carries again
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read

---

Authored by Scott Bellware on Wed Nov 11 2026 at 12:30:49 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:33:27 AM PT
