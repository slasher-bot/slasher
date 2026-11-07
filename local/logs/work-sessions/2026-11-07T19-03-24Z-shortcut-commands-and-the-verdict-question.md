# Work Session — Shortcut commands, and the verdict question explains a verdict (2026-11-07)

This work session began with a shortcut command for the question *What are we doing?*. It became a set of three one-character commands and a smaller command table, passed through the README's wording, and ended with the verdict question offering to explain what a verdict is.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the rules, the item, and the log.

## 1. Three shortcut commands

The engineer asked for `/?` to answer *What are we doing?*. The assignments then changed several times, and settled as:

- `/?` prints the command table. It is an alias of `/command-table`.
- `/.` is an alias of `/recent`, which says what was recently done and what's next.
- `/'` is an alias of `/items`, which lists the current items and the current features and experiments.

A skill's directory cannot carry every punctuation name, and Claude Code shows the directory's name, not the command's. So a punctuation command's directory is named in words: `dot` for `/.` and `apostrophe` for `/'`. The the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule states this.

## 2. The command table is made smaller

The engineer removed the rows for `/command-table`, PROCESS, LOAD, LANGUAGE, PACKAGES, RELEASE, and PROJECTS. Their help is still printed by `/slasher help` and by each domain's own help command. The three shortcut commands take rows two to four, below `/slasher help`. `/items` moved below `/item`. A row no longer opens with *This command* or *These commands*. The `/test` and `/unattended` descriptions were reworded. The the-command-domain-table-prints-when-the-rules-have-loaded rule holds the table.

## 3. The README is reworded

The README now says the engineer has *the option to take over*. Its heading went through three wordings in turn and settled as *Humanity in the Loop AI*. The startup display still reads *Slasher: Humanity in the Loop AI*.

## 4. The verdict question explains a verdict

The engineer started the item that proposed a *What's a verdict* option, as an item only, with no feature. The question asked when a feature or an experiment starts now has a third option, *What's a verdict?*. Selecting it explains in a sentence or two that a verdict is the engineer's declaration that the work is Affirmed, Refuted, or Inconclusive, against a forecast stated before the work, and that work without a verdict ends Completed. The question is then asked again.

The engineer then added the question mark to the option, and put *Conclude without an engineer's verdict* ahead of *Conclude with an engineer's verdict*. The rule fixes what the explanation says, not its exact words. The item's two open questions were left as they stood: the other start questions take no like option. The engineer declared the item complete, and it is Realized.

## Takeaways

- `/?`, `/.`, and `/'` are the only aliases with rows in the command table.
- A punctuation command's skill directory is named in words.
- The verdict question lists the option without a verdict first, and can explain a verdict before it is answered.

## Glossary

- **Verdict** — the engineer's declaration that work is Affirmed, Refuted, or Inconclusive, against a forecast stated before the work.

## Where the durable records live

- The an-implementation-runs-on-a-branch-to-a-declared-end rule — the verdict question and its three options
- The the-command-domain-table-prints-when-the-rules-have-loaded rule — the command table
- The the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the directory names of punctuation commands
- The item: `local/items/2026-11-07T09-18-22Z-the-verdict-question-offers-whats-a-verdict`
- The log entries from `local/logs/log/2026-11-07T10-35-01Z-the-question-mark-command-answers-what-are-we-doing` to `local/logs/log/2026-11-07T19-02-24Z-the-verdict-question-item-is-realized`

---

Authored by Scott Bellware on Sat Nov 7 2026 at 11:03:24 AM PT
