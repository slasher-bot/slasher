# Observation items become note items

This migration conforms the items tagged `[observation]` to the `[note]` tag, in this repository and in each consuming project. It realizes the idea `2026-11-10T07-16-59Z-observation-items-become-note-items`.

## Source and destination

- **This repository:** the 18 items in `local/items/` whose `**Tags:**` line carries `[observation]`. Each takes `[note]` in its place, in the same file, with a `Changed by` footer line. Each filename keeps its `-RECORDED` suffix, since a note keeps the one state Recorded.
- **Consuming projects:** `install.sh` retags each item whose `**Tags:**` line carries `[observation]` as `[note]`, on install and on refresh.
- **Left as written:** an item that names `[observation]` only in its text, as `2026-08-18T04-57-09Z-one-ideas-directory` and `2026-10-29T16-24-42Z-waytide-skills` do, and every log entry, work session record, and implementation record.

## Increments

1. The rule that governed observations is renamed and rewritten for notes. A note is any remark worth keeping, and its one state, Recorded, never changes.
2. The foundation rules and vocabulary entries that name observations as items name notes.
3. `/note` and `/item note` replace `/observation` and `/observe`.
4. `install.sh` retags `[observation]` items as `[note]`, with a test.
5. The 18 items in this repository are retagged.

## What is true in between

Until the fifth increment, the 18 items carry `[observation]` while the rules name `[note]`. The rules are authoritative. No content is duplicated or unavailable.

## What happened

---

Authored by Scott Bellware on Wed Nov 11 2026 at 10:43:28 AM PT
