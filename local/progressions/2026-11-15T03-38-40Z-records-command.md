# Feature — The records line is shown by a /records command, and its display is configurable

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature start for #5", with the item chosen as `2026-11-15T01-45-48Z-the-records-line-is-shown-by-a-records-command-and-its-display-is-configurable`.

**The records line, the *Recorded in:* list of the records a reply has written, is shown by a `/records` command, whose base command is `/records show`. How the records line is displayed is configurable, and can vary.**

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/records-command`
- **Base:** `0e18dc0b`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-records-command`, chosen when the feature was created.
- **Participation:** not asked. The work is content work, which the local rule on Design By Efferent and content work holds off the method.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-15T01-45-48Z-the-records-line-is-shown-by-a-records-command-and-its-display-is-configurable`

## What happened

- The engineer settled that `/records show` prints the previous reply's records line, and dropped the configurable display.
- `/records show`, or a bare `/records`, prints the previous reply's records line again, in the same form. Where that reply wrote no record, it says so.
- The rule a-reply-that-writes-a-record-ends-with-the-records-path says so, and the `records` skill in `foundation` hands the act to it.
- RECORDS follows LOG in the help and the command table.
- The automated suite passed: 72 test files.

## Confirmations

- **2026-11-15** — Creation: `/feature start`, with no feature Open, so the feature was created Active.
- **2026-11-15** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-15** — Forecast: No forecast, selected by the engineer.
- **2026-11-15** — Conclusion: Completed, with the merge to master, selected by the engineer. The work states no forecast.
- **2026-11-15** — Branch deletion and worktree removal: selected by the engineer.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 19:38:40 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 19:38:41 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 19:46:43 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 19:47:06 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 19:47:38 PT
