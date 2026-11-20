# Done items become Completed

This migration conforms the work items and rework items in the Done state to Completed, in this repository and in each consuming project. It serves the feature `2026-11-14T23-32-59Z-begin-start-end-conclude-harmonized`, which carries out the work item `2026-11-14T20-44-27Z-begin-start-end-and-conclude-are-harmonized`. That item settles that a work item and a rework item conclude Completed, not Done.

## Source and destination

- **This repository:** the 13 items in `local/items/` whose file ends `-DONE.md`. Each is renamed to end `-COMPLETED.md`, its `**State:**` line reads Completed, and its footer takes a `Changed by` line.
- **Consuming projects:** `install.sh` renames each item whose file ends `-DONE.md` to end `-COMPLETED.md`, and changes its `**State:**` line to Completed, on install and on refresh. Where both files are present, neither is touched.
- **Left as written:** every log entry, work session record, and progression record that names the Done state, and every reference to an item by its prefix and name, which carries no state suffix.

## Increments

1. The items rule and the rules that list the item states name Completed for a work item and a rework item, and no longer name Done.
2. `/done` and `/item done` are removed. `/complete` concludes a work item or a rework item Completed.
3. `install.sh` renames Done items to Completed, with a test.
4. The 13 items in this repository are conformed.

## What is true in between

Until the fourth increment, 13 items carry Done while the rules name Completed. The rules are authoritative. No content is duplicated or unavailable.

## What happened

1. The items rule names Completed for a work item and a rework item, in its table, its concluding states, and its work item section. The rule on an item's log entries and the work sessions rule no longer name Done.
2. `/done` and `/item done` are removed. The item command's help names Completed among the concluding states.
3. `install.sh` renames Done items to Completed, tested by `install-work-state.sh`.
4. The 13 items were renamed to end `-COMPLETED.md`, with their State lines and footers changed.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 4:02:23 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 4:04:33 PM PT
