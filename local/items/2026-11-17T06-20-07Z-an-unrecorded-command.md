# An `/unrecorded` command

**State:** Realized

**Tags:** [idea]

An "/unrecorded" command that mirrors "/private", but instead of routing records to the private directory, the records are not written at all.

## Plan

Added Mon Nov 16 2026. `/unrecorded` mirrors the session half of `/private`. While an unrecorded session lasts, no record is written anywhere, and files that are not records still change as usual.

- [ ] A bare `/unrecorded`, or `/unrecorded` with an instruction, starts an unrecorded session, and `/unrecorded end` ends it.
- [ ] The prompt hook keeps the session's state outside every repository, as it does for a private session, and removes it when the session ends.
- [ ] After 4 minutes with no prompt, the agent asks whether to continue the unrecorded session or end it, as it does for a private session.
- [ ] The hook that logs a process question writes nothing while the session lasts, so nothing is left to remove afterwards.
- [ ] A foundation rule says what an unrecorded session does: no record is written, even where another rule asks for one. Files that are not records still change, and can still be committed.
- [ ] The agent says once at the start of the session that nothing will be recorded, and says again when the session ends.
- [ ] A reply in the session prints no *Record:* line.
- [ ] Where the work would change an existing record's content or state, the agent says so and asks whether to end the session first, as the private rule does.
- [ ] Tests come first, one for each outcome: the session starts and ends, the 4-minute question is asked, and the process question is not logged during the session and is logged again after it.
- [ ] The command's skill, its help, and the README say what it does.

## Which records go unrecorded

Added Mon Nov 16 2026. The plan uses the private rule's definition of a record: a file under `slasher/local/` that a rule tells the agent to write.

**Not written, under the plan:**

- items, including notes and every other item kind
- log entries, including those the hook writes for a process question
- journal entries
- work session records
- progression records, for features and experiments
- loop records

**Not settled:**

- migration records, which a rule tells the agent to write, but which the private rule's list leaves out
- package set declarations, which decide which rules load, and work more like configuration than a history
- brainstorm collection files, which are already outside the repository, and are neither logged nor committed
- private records, which a private session writes, where starting either session might end the other
- fetched email, which is data the project receives, not a record the agent writes about the work

**Still written, since they are not records:** code, tests, rules, local rules, vocabularies, READMEs, and skills, and their commits on the engineer's selection.

## Open decisions

Added Mon Nov 16 2026.

- Whether `/unrecorded` is the session only, or also takes the single-record subcommands of `/private`, which have nothing to do when nothing is written. The session only is recommended.
- Whether it sits in the PRIVATE section of the help, beside `/private`, or in a section of its own. The PRIVATE section is recommended.
- Whether starting either session ends the other. That it does is recommended, so records only ever go one way.
- Whether the agent asks to end the session before starting a feature or an experiment, whose record keeps it from being left silently open. That it asks is recommended.
- Whether the private session's log hook also changes, to write straight to the private log. That is a change to `/private`, and is recommended as a separate item.

**Progression:** `2026-11-17T06-37-31Z-unrecorded-command`, the feature that builds it.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 10:20:07 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 10:33:32 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 10:37:31 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 10:48:03 PM PT
