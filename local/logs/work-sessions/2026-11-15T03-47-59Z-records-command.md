# Work Session — The /records command

This work session started with two ideas about the records line, the *Recorded in:* list that ends a reply that wrote a record. It merged them into one idea, discontinued an idea it bore on, and built the idea as a feature. It ended with `/records show` printing the previous reply's records line again, and with the configurable display dropped.

This is the communicable record of the work session, a guided tour. The items, progression record, rule, and log entries it points to are the source of truth.

## 1. Two ideas, merged

The engineer recorded an idea for a configurable, variable display of the records recorded, then an idea for a `/records` command whose base command is `/records show`. The engineer asked for the two to be merged, and selected a new item that supersedes both. The new idea names each earlier one, and each names it.

- Ideas: `2026-11-15T00-45-53Z-configurable-variable-display-of-records-recorded` and `2026-11-15T01-38-34Z-a-records-command-shows-the-records-line`, both Superseded
- Merged idea: `2026-11-15T01-45-48Z-the-records-line-is-shown-by-a-records-command-and-its-display-is-configurable`

## 2. An idea discontinued

The engineer discontinued the idea that the last output is printed only on request.

- Idea: `2026-11-14T17-22-02Z-the-last-output-is-printed-only-on-request`

## 3. The feature, started with `/feature start`

No feature was Open, so `/feature start` created the feature Active, the first to be created that way. The engineer selected a branch and worktree and no forecast. It was content work, so attended or unattended was not asked.

Two decisions settled the design, each a dated resolution in the idea. `/records show` prints the previous reply's records line. The configurable display is dropped: the engineer answered the question about configuring with *Discontinue the configure subcommand*.

The rule a-reply-that-writes-a-record-ends-with-the-records-path now says that `/records show`, or a bare `/records`, prints the previous reply's records line again. The `records` skill in `foundation` hands the act to it, and RECORDS follows LOG in the help and the command table. The suite's check that a row matches its help caught a difference in the first draft of the help.

- Progression record: `2026-11-15T03-38-40Z-records-command`

## Takeaways

- `/records show`, or a bare `/records`, prints the previous reply's records line again.
- The records line's display is not configurable.
- `/feature start` creates a feature Active where none is Open.

## Glossary

- **records line** — the *Recorded in:* heading and its list of full paths, which ends a reply that wrote a record.

## Where the durable records live

- `local/items/`: the merged idea, Realized, and the two ideas it superseded.
- `local/progressions/`: the records command progression record.
- `local/logs/log/`: an entry for each change of state and each settled resolution.
- `system/foundation/skills/records/` and the rule a-reply-that-writes-a-record-ends-with-the-records-path.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 19:47:59 PT
