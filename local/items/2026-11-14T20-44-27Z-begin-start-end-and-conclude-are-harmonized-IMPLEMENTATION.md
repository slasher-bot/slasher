# The words begin, start, end, conclude, and their like are harmonized

- **State:** Implementation
- **Tags:** [work]

**The words for beginning and ending work, such as *begin*, *start*, *end*, and *conclude*, are used consistently.**

**As the engineer stated it:** Harmonize begin. start, end, conclude, etc language

## Settled

**As the engineer stated it:** "My thoughts, for starters: I want to standardize on start and end, eliminating being. Work items should conclude with \"completed\" rather than \"done\"." *Being* is *begin*.

- **2026-11-14** — *Start* and *end* are the standard words for beginning and ending work. *Begin* is dropped.
- **2026-11-14** — *Conclude* stays the word for reaching a final state, as in *the concluding states*. *End* is the plain verb, as in `/brainstorm end`. Selected by the engineer.
- **2026-11-14** — A work item concludes Completed, not Done.
- **2026-11-14** — `/done` is retired. `/complete` concludes a work item Completed, as it concludes a feature. Selected by the engineer.
- **2026-11-14** — A rework item concludes Completed, not Done. **As the engineer stated it:** "Rework item should conclude Completed"
- **2026-11-14** — A feature has `start` and no `new`. `/feature start` creates the feature, its record and its branch, asks the start's questions, and makes it Active. **As the engineer stated it:** "Feature should have \"start\" but not \"new\""
- **2026-11-14** — An experiment follows a feature: `/experiment start` creates and starts it, and `/experiment new` is removed. Selected by the engineer.
- **2026-11-14** — Open is dropped as a state of a feature or an experiment, which is Active from the moment it is created. Items keep Open. Selected by the engineer.
- **2026-11-14** — The three resolutions above, that a feature and an experiment have `start` and no `new`, and no Open state, are reversed. A feature and an experiment keep `new`, which creates the implementation Open. `start` makes an Open implementation Active. Where no implementation is in place, `start` creates it and writes it Active. **As the engineer stated it:** "Reversal: Implementations have a new command, and they are open at that point. But if start is issued without first having an implementation in place, it starts the implementation in the active state."
- **2026-11-14** — The rules say a feature's or an experiment's location, forecast, and attended-or-unattended questions are asked when it is created, not "at the start". *Start* means only the work starting. Selected by the engineer.
- **2026-11-15** — `/phase new` replaces `/phase add`, so a phase is created by `new`, as a feature and an experiment are. **As the engineer stated it:** "phase add should be phase new"
- **2026-11-15** — `/phase` has a `status` subcommand, which prints what `/feature status` and `/experiment status` print: the phases in order, the current one emphasized, and the current phase's goal. **As the engineer stated it:** "The \"/phase\" command should also have a \"status\" subcommand". What it prints was selected by the engineer.

**Implementation:** `2026-11-14T23-32-59Z-begin-start-end-conclude-harmonized`

---

Authored by Scott Bellware on Sat Nov 14 2026 at 12:44:27 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 3:32:59 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 3:44:45 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 3:53:29 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 4:25:27 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 4:32:36 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 4:41:34 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 5:13:02 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 5:23:40 PM PT
