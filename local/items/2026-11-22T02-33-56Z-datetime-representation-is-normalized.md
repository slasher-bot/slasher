# Datetime representation is normalized

**State:** Completed

**Tags:** [work]

**As the engineer stated it:** Normalize datetime representation

Slasher writes dates and times in a set of named formats, each defined by its form rather than by where it is used. Each use names the format it takes, in the mapping below. Before this item, each use had its own form, set out in its own rule:

- the file name prefix, as `2026-11-22T02-01-28Z`, in UTC
- the journal file name stamp, as `2026-11-21T18-01`, in local time
- the footer datetime, as `Sat Nov 21 2026 at 18:31:40 PT`
- the title datetime, as `Sat Nov 21 2026 18:01`
- the journal datetime line, as `Sat Nov 21 2026 at 18:01`

The new formats to use:

- iso-full: 2026-11-21T18-01-28
- iso-date-short-time: 2026-11-21T18-01
- iso-date: 2026-11-21
- date: Sat Nov 21 2026
- short-date: Sat Nov 21
- date-time: Sat Nov 21 2026 18:01:28 (discontinued)
- date-short-time: Sat Nov 21 2026 18:01 (discontinued)
- date-time-text: Sat Nov 21 2026 at 18:01:28
- date-short-time-text: Sat Nov 21 2026 at 18:01 (discontinued)


An ISO format can be presented in UTC or local time. A text format is presented in local time only.
A time represented in UTC is suffixed with Z.
A time represented in local time in a text format is suffixed with the timezone abbreviation, eg: 18:31 PT or 18:31:28 PT.
A time represented in local time in an ISO format has no suffix, eg: 2026-11-21T18-01. Numeric offsets are not used with ISO times.
A format with no time carries no suffix. It names the local day.

Mapping the formats and zones to uses:

- the file name prefix: iso-full, in UTC, eg: 2026-11-22T02-01-28Z
- the journal file name stamp: iso-date-short-time, in local time
- the journal file name stamp, where the writer gives seconds: iso-full, in local time, eg: 2026-11-21T18-01-28
- the footer datetime: date-time-text, in local time
- the title datetime: Dated titles are discontinued
- the journal datetime line: none
- the date of a Settled resolution, a confirmation, or a Compression line: iso-date, the local day, eg: 2026-11-21
- the date of a History line, as in "Until Sat Nov 21 2026 …": date, the local day
- the short date in a printed list of records: short-date, the local day, as the work item `2026-11-22T02-02-49Z-lists-show-a-short-form-of-the-date` settles

Work session records should stop having the date in the title. A work session record's title is `# Work Session — <name>`. Existing work session titles should be migrated.

Journal entries should stop having the datetime line under the title. The journal file name stamp stays in local time, and stops at the minute unless the writer gives seconds.

Existing journal entries should be migrated.

Journal file name stamps that carry no time, as `2026-08-13`, stay as written. They are iso-date, the local day.

Existing footer lines in the 12-hour form with seconds should be migrated to date-time-text, as `Mon Oct 26 2026 at 5:52:41 PM PT` becomes `Mon Oct 26 2026 at 17:52:41 PT`. Footer lines that stop at the hour, as `Sat Jun 27 2026 at 1 PM PT`, stay as written, since they have no minutes or seconds to convert.

History lines that give their date as iso-date, as `Until 2026-10-25 …`, should be migrated to date, as `Until Sun Oct 25 2026 …`.

A journal entry's footer lines are migrated as every other footer line is: the 12-hour form with seconds becomes date-time-text, and a line that stops at the hour stays as written.

The migration is recorded in a migration record under `slasher/local/migration/`, and a Slasher project's records are migrated by an `install.sh` migration when its packages are updated.

## Progression

The implementation `2026-11-22T20-39-10Z-datetime-normalization` carries this item's work.

## Tasks

- [x] A rule names each datetime format, its form, and the zone rules, and maps each use to a format.
- [x] Each rule that set a form of its own names the format it takes instead.
- [x] The record-title date rule is discontinued, and the minutes-and-seconds rule no longer exempts dated titles.
- [x] The work session record's title is `# Work Session — <name>`.
- [x] A journal entry has no datetime line under its title.
- [x] A helper prints a UTC file name prefix in a named format in local time.
- [x] A migration record states the conversion of existing records.
- [x] This repository's work session titles carry no date.
- [x] This repository's journal entries carry no datetime line, and their 12-hour footer lines are date-time-text.
- [x] This repository's 12-hour footer lines with seconds are date-time-text, and lines that stop at the hour are unchanged.
- [x] This repository's History lines give their date as date, not iso-date.
- [x] A Slasher project's records are converted the same way by an install.sh migration when its packages are updated.

## Settled

- **2026-11-21** — **As the engineer stated it:** A person reading a file has already chosen a low-level experience. Low-level datetime formats are not innappropriate at that level
- **2026-11-21** — **As the engineer stated it:** I would also like to define named datetime formats and then use those in specific circumstances. ie: There wouldn't be a "footer format" because that's a use case - an efferent, rather than an afferent defined format. I would need to name the different formats and specify their formatting.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 18:33:56 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 19:40:45 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 19:45:30 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 22:58:16 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 23:14:41 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 23:16:33 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 23:21:18 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 23:27:50 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 23:32:34 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 23:33:56 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 12:39:10 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:16:51 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:38:24 PT
