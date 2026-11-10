# Existing records take the harmonized states

**This record plans the conversion of existing items and implementation records to the states the harmonized-states plan settles.** It realizes the plan's last two tasks, in the item `2026-11-10T00-58-24Z-item-and-implementation-states-and-commands-are-harmonized-restated`, on the feature `2026-11-10T04-49-07Z-harmonized-states`.

## Source and destination

- **Within this repository**, in `local/items/` and `local/implementations/`. The records stay where they are. Their `**State:**` lines, their filename suffixes, and one tag change.
- **The design items:** a design starts and stays Recorded. The eleven items tagged `[design]` alone take Recorded: eight Realized, two Abandoned, and one Superseded. Each takes a dated addition naming the state it held, so the earlier state is kept in the record.
- **The item tagged both `[idea]` and `[design]`** keeps Realized, since the idea has primacy.
- **The work-item tag:** the one item tagged `[work-item]` is tagged `[work]`, the tag's name since 2026-10-29. It keeps Done.
- **Every other item** already holds a state its kind takes. An idea, a plan, an aspiration, and a work item conclude as they did, and an observation stays Recorded.
- **The implementation records** already hold states an implementation takes. None is converted.

## Increments

1. Convert the eleven design items to Recorded, with `git mv`, a changed `**State:**` line, a dated addition, a `Changed by` line, and a log entry for each.
2. Tag the work item `[work]` in place of `[work-item]`.
3. Run the suite, and commit the conversion with this record.

## What is true in between

- **Until the feature merges, `master` is unchanged.** Its rules and its records agree with each other, in the old states. The feature branch is authoritative for the new states.

## What happened

- Each increment ran as planned, in one commit on the feature branch.

---

Authored by Scott Bellware on Mon Nov 9 2026 at 9:05:09 PM PT
