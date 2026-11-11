# Work Session — Ask-again shortcut (2026-11-11)

This work session began with the work item for a shortcut that puts an escaped question again. It became the `/ask-again` command, a rearranged command table, and `current` for `/features` and `/experiments`. It ended with the shortcut settled as `/aa`, after `/..` and `/,`, and the work item Done.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the work item `2026-11-11T02-53-35Z-ask-again-shortcut`, the rules it names below, and the log.

## 1. The command and its first shortcut

The engineer started the work item and chose, through two process questions, the shortcut `/..` and the command `/ask-again`. The new ask-again-puts-the-last-escaped-question-again rule puts the last question the engineer escaped again, as it was asked, with its decision marker, and says so where no question was escaped. The present-every-prompt-to-the-engineer-through-the-selection-ui rule names the command as how the engineer asks. The engineer then reworded the command's description to *Repeat the agent's previous multiple-choice question*.

## 2. The command table

The engineer moved the rows of `/clarify`, `/ask-again`, `/estimate-confidence`, and `/unattended` from the table's top rows to its bottom, above `/shortcuts`. Each row now sits beside its own skill, and the `/clarify` row belongs to the `language` package. The engineer then had every row with a shortcut alias name the command first, as `/recent, /.`. The a-command-domain-carries-its-rows-of-the-command-table rule states both.

## 3. Current features and experiments

`/features` and `/experiments` take `current`, as `/items` does, per the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule. The work was pushed, and the `foundation` and `language` packages were published.

## 4. The shortcut, settled

After the publish, the engineer changed the shortcut to `/,` and then to `/aa`. The skill directory followed each name: `dot-dot`, `comma`, `aa`. Each changed rule records the earlier aliases in its History. The work item was completed as Done.

## Takeaways

- An escaped question is put again only when the engineer asks, with `/ask-again` or `/aa`.
- A command's own row sits beside its skill, so the table's order follows the help order with no change to the build.
- A row with a shortcut alias names the command first.
- An alias made of letters, as `/aa` and `/sc`, is named in the startup table's sentence of other commands.

## Glossary

- **escaped question** — a selection the engineer refused, stopped to clarify, or interrupted.

## Where the durable records live

- The rules ask-again-puts-the-last-escaped-question-again, present-every-prompt-to-the-engineer-through-the-selection-ui, a-command-domain-carries-its-rows-of-the-command-table, and a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows.
- The skills `ask-again` and `aa` in `system/foundation/skills/`, and the rows files beside the four skills.
- The work item and the log entries dated 2026-11-11.

---

Authored by Scott Bellware on Wed Nov 11 2026 at 10:40:50 AM PT
