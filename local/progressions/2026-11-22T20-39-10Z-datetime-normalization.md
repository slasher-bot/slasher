# Implementation — Datetime representation is normalized

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Do #3 unattended, with #3 the work item `2026-11-22T02-33-56Z-datetime-representation-is-normalized`

**Slasher writes every date and time in one of a set of named formats, each defined by its form, and each use names the format it takes.** The work item states the formats, the mapping, the conversion of existing records, and the tasks.

Realizes the work item `2026-11-22T02-33-56Z-datetime-representation-is-normalized`.

## State

- **State:** Active

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/datetime-normalization`
- **Base:** `0fafbec0`, from `master`, the commit holding this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-datetime-normalization`. The main working tree stays on `master`.
- **Participation:** unattended, as the engineer asked.
- **Forecast:** none given.
- **Item:** `2026-11-22T02-33-56Z-datetime-representation-is-normalized`

## Plan, as accepted on 2026-11-22

1. Start an unattended implementation for #3 on a branch and a worktree. Write its record Active, make the item Progression, and log both, committed on `master` on the engineer's selection.
2. Write a foundation rule that names each datetime format, its form, the zone rules, and the format each use takes.
3. Amend the footer, minutes-and-seconds, file-names, work-session, and journal file name rules, so each names a format. The work session title becomes `# Work Session — <name>`.
4. Discontinue the record-title date rule and the journal datetime-line rule. Reconcile what cites them, and log each.
5. Check each changed compressed text with fresh agents, and record the figures.
6. Write the tests first, then `format-datetime.sh`, which prints a UTC prefix in a named format in local time.
7. Write the tests first, then an `install.sh` migration. In a project's local directory it drops work session title dates and journal datetime lines, and converts 12-hour footer lines with seconds to 24-hour. It leaves lines that stop at the hour.
8. Write a migration record under `local/migration/`.
9. Convert this repository: the migration converts `local/`, and a one-time script converts the footers and iso-date History lines under `system/`.
10. Add no `Changed by` line for the conversion. The migration record holds it. Log the journal change that #3 directs.
11. Keep a loop record of the decisions made for the scripts.
12. Compile, run the automated suite, and commit on the branch in steps.
13. The merge to `master` and the conclusion wait for the engineer.

## What happened

## Confirmations

- **2026-11-22** — Creation: started unattended, as the engineer asked. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-22** — Participation: unattended, as the engineer asked.
- **2026-11-22** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Sun Nov 22 2026 at 12:39:10 PT
