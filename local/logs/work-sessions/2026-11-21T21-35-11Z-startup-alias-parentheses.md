# Work Session — Startup sentence shortcut aliases (Sat Nov 21 2026)

The work session started with summaries of what Slasher gained since late October. It became a work item to change how the startup sentence shows shortcut aliases. That item was carried out as an unattended implementation, and the work session ended with the implementation Completed and merged.

This is the communicable record of the work session, a guided tour. The durable records it points to are the source of truth.

## 1. The summaries

The engineer asked for summaries of Slasher's improvements, grouped by date, for 10 days, then 15, then since November 1, October 29, and October 21. The summaries were drawn from the progression records and, before November 6, from the commits. Two entries were wrong where a record's title was read in place of what the work did. The `/records` feature dropped its configurable display, and the *complete implementation* feature renamed an option at the implementation hinge. Later summaries were drawn from each record's *What happened* section.

## 2. The work item

The engineer asked, with `/work`, for each shortcut alias in the startup sentence to be shown in parentheses after its command, as `/commit (/c)`, and asked to be asked about each alias first. The work item `2026-11-21T21-23-00Z-the-startup-sentence-puts-a-shortcut-alias-in-parentheses` records it.

The **startup sentence** is the sentence below the startup table that names every other command. A **shortcut alias** is a name the shortcuts table lists for a command.

## 3. The aliases and the plan

The engineer selected all five shortcut aliases the sentence names: `/p`, `/c`, `/cp`, `/aa`, and `/sc`. The engineer also declined three aliases that are names rather than shortcuts: `/proceed`, `/implementation`, and `/implementations`. The work item records the selection as a Settled resolution. The engineer accepted the plan, and the implementation `2026-11-21T21-24-19Z-startup-alias-parentheses` started unattended, on a branch and a worktree.

## 4. The implementation

A new test failed before the change. The plugin build now reads the shortcuts table, and writes each shortcut alias whose name starts with a letter in parentheses after its row's command. A shortcut added to the table later takes the same form. The a-command-domain-carries-its-rows-of-the-command-table rule states it. The automated suite passed, on 139 test files.

## 5. The conclusion

The engineer asked for the work to be completed. The implementation concluded Completed and merged into `master`, and the work item is Completed. The branch and its worktree are deleted.

## Takeaways

- The startup sentence names a shortcut alias in parentheses after its command, as `/commit (/c)`.
- The shortcuts table decides which names are shortcut aliases.
- A summary of past work is drawn from what each record says happened, not from its title.

## Glossary

- **startup sentence** — the sentence below the startup table that names every other command.
- **shortcut alias** — a name the shortcuts table lists for a command.

## Where the durable records live

- The work item: `local/items/2026-11-21T21-23-00Z-the-startup-sentence-puts-a-shortcut-alias-in-parentheses.md`
- The implementation: `local/progressions/2026-11-21T21-24-19Z-startup-alias-parentheses.md`
- The rule: the a-command-domain-carries-its-rows-of-the-command-table rule
- The build: `system/foundation/assemble-plugin.sh`
- The test: `test/automated/assemble-plugin/command-table-startup-shortcut-alias.sh`

---

Authored by Scott Bellware on Sat Nov 21 2026 at 1:35:11 PM PT
