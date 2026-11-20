# Progression status reports its phases, its state, what exists, and what is left

**Trigger:** When the engineer types `/feature status`, `/experiment status`, or `/content status`, or asks for the status of a feature, an experiment, or content

**`/feature status` and `/experiment status` report the status of one progression.** A bare `/feature status` reports on the feature the conversation is on. Where that is not clear, it reports on the one feature whose `**State:**` line reads Active. Where no feature is Active, or more than one is, ask which feature is meant, through the selection interface, each Active feature an option where there are any. `/experiment status` does the same for an experiment, and `/content status` for content.

**As the engineer stated it:** Add the "status" subcommand to implementations

**`/feature status <feature>` reports on the feature the identifier names**, and `/experiment status <experiment>` on the experiment. An identifier is any of three forms:

- **a number**, the ordinal of a row in the last list of features or experiments printed in the session, as `/feature status 2`
- **a datetime prefix**, the record's ISO-8601-UTC filename prefix, as `/feature status 2026-10-02T14-10-05Z`
- **words from the title**, which match the title of one record of the kind, as `/feature status cart payment`

**Where the identifier names no record of the kind, say so, and report nothing.** Where words match more than one record's title, ask which, through the selection interface, each match an option. Where a number is given and no list of the kind was printed in the session, say so, and report nothing.

**Name the progression before the report**, by its record's title, so the engineer can see which one the identifier named.

**The report gives the phases, then the state, what exists, and what is left.** The phases are what the a-phase-starts-by-stating-its-goal rule prints for a status: the phases in the record's order, the current one emphasized, and the current phase's goal. Without phases, give the question or intent. Then each of the rest is a short list item:

- **State:** the word on its `**State:**` line.
- **What exists:** each thing the progression's question or intent asks for that now exists on its branch, such as a command, a rule, or a file.
- **What is left:** each thing it asks for that does not exist yet, and any decision it waits on.
- **Ready to conclude:** yes or no, last. Where no, name what stands in the way. A progression is ready to conclude when its plan is done, its work is committed, the automated suite passes, and its branch merges to its upstream branch without a conflict. A progression built on the current branch has nothing to merge. For work with a forecast, the line reports these facts only, since the length of that work is the engineer's judgment.

**As the engineer later stated it:** "/status" invoked on either an item or a progression includes in the output whether it's ready to be concluded

**Read the record, its branch, and the work when the command is typed, never from memory.**

**The report changes nothing.** It writes no record, changes no state, and offers no state change. Concluding the progression is the engineer's to ask for. *Ready to conclude* states a fact, and is not an offer to conclude.

**Why:** `/item status` reports where an item stands. A feature or an experiment is asked about the same way, and its phases are part of where it stands.

**How to apply:** on `/feature status`, `/experiment status`, or `/content status`, find the record from the identifier, or the one the conversation is on, or the one Active record of the kind. Name it, give its phases or its question or intent, then its state, what exists, what is left, and whether it is ready to conclude.


## History

Until Fri Nov 20 2026 there was no `/content status`, since there was no content kind.

Until Fri Nov 20 2026 the progression status report ended with what is left, and did not say whether the progression was ready to conclude.

Until Fri Nov 20 2026 this rule was named implementation-status-reports-its-phases-its-state-what-exists-and-what-is-left, and said implementation where it now says progression. The progression-replaces-implementation work item settled that progression replaces implementation in the record sense.

Related:

- the item-status-reports-an-items-state-what-exists-and-what-is-left rule — the same report for an item
- the a-phase-starts-by-stating-its-goal rule — the phases the report opens with
- the the-progressions-directory-holds-one-record-per-progression rule — a progression's record and its states
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — the lists whose numbers an identifier may name

---

Authored by Scott Bellware on Mon Nov 16 2026 at 2:23:56 PM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:22:11 AM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 11:19:39 AM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:21:01 PM PT
