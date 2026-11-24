# Work status reports on the work under way, or on the record named

**Trigger:** When the engineer types `/work-status` or `/ws`, or asks for the status of the work under way

**`/work-status` reports the status of one item, feature, experiment, or content progression.** It finds the record, then reports on it as the command of its kind does: an item as `/item status` does, a feature as `/feature status` does, an experiment as `/experiment status` does, and content as `/content status` does. `/ws` is its shortcut alias, and does exactly what it does. It is in the PROCESS command domain, so `/work-status help` says that the command takes no `help`, and names `/process help`.

**As the engineer stated it:** Add a root "/status" command

**As the engineer later stated it:** "/work-status" instead of "/status", with the alias "/ws"

**A bare `/work-status` reports on the work under way.** That is the feature, experiment, or content the conversation is on. Where the conversation is on none, it is the one progression whose `**State:**` line reads Active, and where none is Active, the one Active item. Where more than one record is a candidate at the step that decides, ask which, through the selection interface, each candidate an option. Where no record is a candidate, say that no work is under way, and report nothing.

**`/work-status <record>` reports on the record the identifier names.** An identifier is any of three forms:

- **an ordinal**, of a row in the last list of records printed in the session: an item's row as `/work-status i3`, `3`, or `#i3`, and a progression's as `/work-status pB`, `B`, or `#pB`, in either case
- **a datetime prefix**, the record's ISO-8601-UTC filename prefix, looked for among the items and the progressions, as `/work-status 2026-10-02T14-10-05Z`
- **words from the title**, which match the title of one item or progression, as `/work-status cart payment`

**Where the identifier names no record, say so, and report nothing.** Where words match more than one record's title, ask which, through the selection interface, each match an option. Where an ordinal is given and no list of records was printed in the session, say so, and report nothing.

**The report ends with whether the record is ready to conclude**, for an item and for a progression alike, as the rule for its kind says.

**As the engineer later stated it:** "/status" invoked on either an item or a progression includes in the output whether it's ready to be concluded

**The report changes nothing.** It writes no record, changes no state, and offers no state change.

**Why:** the engineer asks *where does this stand?* without stopping to name the kind of record. One root command finds the work under way, or the record named, and gives the report its kind gives.

**How to apply:** on `/work-status`, find the record from the identifier, or the work under way where none was given. Then report on it under the item-status-reports-an-items-state-what-exists-and-what-is-left rule for an item, or the progression-status-reports-its-phases-its-state-what-exists-and-what-is-left rule for a feature or an experiment.


## History

Until Mon Nov 23 2026 a row was named by its bare ordinal, as `3` or `B`. A printed list now shows the prefixed ordinal, as `i3` or `pB`, and either form names the row.

Until Sat Nov 21 2026 the ordinal was a number for a progression's row too, since a list of progressions numbered its rows.

Until Sat Nov 21 2026 the command was `/status`, and this rule was named status-reports-on-the-work-under-way-or-the-record-named. Claude Code has a `/status` command of its own, so the Slasher command was typed `/slasher:status` to reach it.

Until Fri Nov 20 2026 `/status` reported on an item, a feature, or an experiment, since there was no content kind.

Until Fri Nov 20 2026 the report did not say whether the record was ready to conclude.

Until Fri Nov 20 2026 this rule said implementation where it now says progression, in the sense of a feature or an experiment and its record. The progression-replaces-implementation work item settled the change.

Related:

- the item-status-reports-an-items-state-what-exists-and-what-is-left rule — the report for an item
- the progression-status-reports-its-phases-its-state-what-exists-and-what-is-left rule — the report for a feature or an experiment
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read, and why it takes no `help`

---

Authored by Scott Bellware on Mon Nov 16 2026 at 14:26:06 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 00:22:43 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 11:19:39 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:21:01 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 13:46:54 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 14:26:02 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:58:30 PT
