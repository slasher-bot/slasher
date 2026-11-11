# Work Session — Observation items become note items (2026-11-11)

This work session began with the idea that observation items become note items, so that *observation* names only what a test reads in Design By Efferent. It became a rewritten rule, a new command, an installer migration, and the retagging of this project's items. Along the way, `/ask-again` was changed to put an answered question again. It ended with the idea Realized.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the idea `2026-11-10T07-16-59Z-observation-items-become-note-items`, the migration record of the same name, the rules named below, and the log.

## 1. The decisions

The engineer settled five matters through process questions. The existing items are retagged. `/note` replaces `/observation` and `/observe`. A **note** is any remark worth keeping, broader than a working hypothesis. A note keeps the one state Recorded, which never changes. The installer retags the items of consuming projects. The engineer then accepted a seven-step plan.

## 2. The rule and the commands

A migration record was written first, since a renamed tag is a migration. The observation rule became a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes. Its compressed text was checked by two separate agents: one directive was less precise, and after one repair all 19 were kept. Twelve foundation rules, the vocabulary, the README, the help, and the command table now name notes.

## 3. Ask-again, amended

During the test's design, the engineer answered a hinge, then asked for it again. `/aa` refused, because the question had been answered. The engineer amended the rule: `/ask-again` puts the last question again, answered or escaped, and the work that followed an earlier answer is redone. The rule is now ask-again-puts-the-last-question-again.

## 4. The installer

The test `install-note-tag.sh` was designed through the five hinges: the installer run in `agents-md` mode, the Tags line read, an item tagged `[observation] [design]`, a direct implementation, and the name *Retags an observation as a note*. Two older tests of the Stated-to-Recorded rename broke, because their items were retagged too. The engineer had their controls tagged `[note]`.

## 5. This project's items

The 18 items tagged `[observation]` were retagged `[note]`. Their filenames kept `-RECORDED`. Items that name `[observation]` only in their text were left as written.

## Takeaways

- *Observation* has one meaning in Slasher: what a test reads about an actuation's outcome.
- A note is a remark worth keeping, and its state never changes.
- A migration that rewrites content can break the tests of an earlier migration that sets up the same content.
- An answered question can be asked again, and the new answer replaces the old.

## Glossary

- **note** — a remark worth keeping that binds nothing, tagged `[note]`, whose one state, Recorded, never changes.

## Where the durable records live

- The rules a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes and ask-again-puts-the-last-question-again.
- The skill `system/foundation/skills/note/`, the installer's `migrate_note_tag`, and `test/automated/install-note-tag.sh`.
- The idea, the migration record `2026-11-11T18-43-28Z-observation-items-become-note-items`, and the log entries dated 2026-11-11.

---

Authored by Scott Bellware on Wed Nov 11 2026 at 12:15:25 PM PT
