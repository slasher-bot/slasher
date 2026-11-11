# Command table printing is optimized

- **State:** Implementation
- **Tags:** [work]

**As the engineer stated it:** Optimize command table printing. Maybe split into separate rules.

## Settled

- **2026-11-10** — The engineer asked for an approach, and settled it with its two choices:
  - Each package carries its own rows of the command table and of the shortcuts table, in files beside its skills.
  - The plugin build joins the active packages' rows, as it joins their help, and a package that is not active adds none.
  - `/command-table`, `/;`, `/commands`, `/shortcuts`, and `/sc` print the joined tables without loading a rule.
  - The rule splits into a short session-start rule and an on-demand rule for writing a row.
  - An automated test checks every command domain has a row whose description matches its help.
  - The startup table and its sentence naming the other commands are generated from the joined rows.
  - The help-order file that orders the help orders the table's rows too.

**Implementation:** the feature `2026-11-10T06-02-53Z-general-email-fetch`, in its command table phase, carries this item's work.

---

Authored by Scott Bellware on Tue Nov 10 2026 at 10:55:12 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 8:18:29 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 8:35:37 PM PT
