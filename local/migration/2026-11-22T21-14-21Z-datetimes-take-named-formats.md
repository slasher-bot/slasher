# Datetimes take the named formats

The dates-and-times-are-written-in-named-formats rule names six datetime formats and the format each use takes. Records already written use the forms the rules set before it. This migration conforms them, under the the-migration-directory-holds-the-plans-for-moving-or-restructuring-content rule, which permits a migration to change historical records.

Realizes part of the work item `2026-11-22T02-33-56Z-datetime-representation-is-normalized`, in the implementation `2026-11-22T20-39-10Z-datetime-normalization`.

## Source and destination

The source and the destination are the same records, in place, in two repositories' kinds of content:

- **This repository**, the Slasher authoring source: `local/`, `system/`, and the root `AGENTS.md`, `README.md`, and `CONTRIBUTING.md`.
- **Each Slasher project**: its local directory, where `local-directory.sh` finds it. A project's `slasher/system/` is not touched there, since it is refreshed from the published packages.

## What changes

1. **A work session record's title drops its date**, as `# Work Session — Some work (Sat Nov 21 2026 18:01)` becomes `# Work Session — Some work`. Titles dated `(Sat Nov 21 2026)` or `(2026-07-26)` drop the date the same way. A title that reads `# Session — …` keeps the word Session.
2. **A journal entry drops its datetime line**, as `Sat Nov 21 2026 at 18:01`, with the blank line after it. Its file name is not renamed. A stamp with no time, as `2026-08-13`, stays as written: it is the iso-date format. The writer directed this change in the work item.
3. **A footer line in the 12-hour form with seconds becomes 24-hour**, as `Mon Oct 26 2026 at 5:52:41 PM PT` becomes `Mon Oct 26 2026 at 17:52:41 PT`. A footer line that stops at the hour, as `Sat Jun 27 2026 at 1 PM PT`, stays as written, since it has no minutes or seconds to convert.
4. **A History line dated in the iso-date format takes the date format**, as `Until 2026-10-25 …` becomes `Until Sun Oct 25 2026 …`. This reaches the rule sources in this repository only.
5. **No `Changed by` line is added for the conversion.** This record holds it.

## Increments, in order

1. The rule, `format-datetime.sh`, and the `install.sh` migration are written and committed on the implementation's branch, with their tests. Nothing is converted yet.
2. This record is written, before any content changes.
3. This repository's `local/` is converted by the same steps the `install.sh` migration runs, with its local directory as `local/`. `install.sh` itself is not run here, since it would write a Slasher project's bootstrap into this repository.
4. The footer lines and the iso-date History lines under `system/`, and the footer lines of the root `AGENTS.md`, `README.md`, and `CONTRIBUTING.md`, are converted by a one-time script that is not committed.
5. The packages are compiled, and the suite is run.
6. After the merge to `master` and a publish, each Slasher project is converted by its next `/packages update`, which runs the pulled installer's migrations.

## What is true in between

- Until increment 3, records written before the rule keep the old forms, and new records take the named formats. Both are readable.
- Until a Slasher project updates its packages, its records keep the old forms. Its installed rules say the new forms once the update pulls them, and the migration runs in the same update.
- Nothing is duplicated or unavailable at any point. Every change is in place.

## What happened

- Increments 1 and 2 went as planned.
- Increment 3 changed 448 records under `local/`: work session titles, the six journal entries' datetime lines, and footer lines. Footer lines that stop at the hour stayed as written.
- Increment 4 changed 167 files: 3,019 footer lines and 35 History lines.
- Two kinds of line were not converted. One footer line in `local/progressions/2026-08-14T19-57-24Z-diary-test.md` names no zone, so it fits no named format. The files under `scratch/` are neither records nor rules, and were left as they were.
- Increment 5: the automated suite passed, 152 test files.

---

Authored by Scott Bellware on Sun Nov 22 2026 at 13:14:21 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:16:51 PT
