# Dates and times are written in named formats

**Trigger:** When writing a date or a time into a file, a file name, or a printed list

**Every date and time Slasher writes takes one of the named formats below.** A format is named for its form, not for the place it is used. Each use names the format it takes, in the mapping below. Do not write a date or a time in a form the table does not name.

**As the engineer stated it:** I would also like to define named datetime formats and then use those in specific circumstances. ie: There wouldn't be a "footer format" because that's a use case - an efferent, rather than an afferent defined format. I would need to name the different formats and specify their formatting.

## The formats

| Name | Form | Example |
|---|---|---|
| **iso-full** | `YYYY-MM-DDTHH-MM-SS` | `2026-11-21T18-01-28` |
| **iso-date-short-time** | `YYYY-MM-DDTHH-MM` | `2026-11-21T18-01` |
| **iso-date** | `YYYY-MM-DD` | `2026-11-21` |
| **date** | `Ddd Mmm D YYYY` | `Sat Nov 21 2026` |
| **short-date** | `Ddd Mmm D` | `Sat Nov 21` |
| **date-time-text** | `Ddd Mmm D YYYY at HH:MM:SS` | `Sat Nov 21 2026 at 18:01:28` |

**The time is 24-hour, and the day of the month takes no leading zero.** An ISO format writes the time's colons as dashes, so the same form serves a file name and a file.

## The zone

**An ISO format can be written in UTC or in local time. A text format is written in local time only.** A text format is `date`, `short-date`, or `date-time-text`.

**A time in UTC ends in `Z`,** as `2026-11-22T02-01-28Z`.

**A time in local time in a text format ends in the zone abbreviation,** as `Sat Nov 21 2026 at 18:01:28 PT`. The abbreviation names the zone and not the season: `PT`, not `PST` or `PDT`.

**A time in local time in an ISO format has no suffix,** as `2026-11-21T18-01`. A numeric offset, such as `-08:00`, is never written.

**A format with no time has no suffix, and names the local day.**

**As the engineer stated it:** Numeric offsets shall not be used with ISO times

## The mapping

| Use | Format | Zone | Example |
|---|---|---|---|
| a dated record's file name prefix | iso-full | UTC | `2026-11-22T02-01-28Z` |
| a journal entry's file name stamp | iso-date-short-time | local | `2026-11-21T18-01` |
| a journal entry's file name stamp, where the writer gives seconds | iso-full | local | `2026-11-21T18-01-28` |
| a journal entry's file name stamp, where the writer gives no time | iso-date | local | `2026-11-21` |
| a provenance footer line | date-time-text | local | `Sat Nov 21 2026 at 18:01:28 PT` |
| a Settled resolution, a confirmation, or a Compression line | iso-date | local | `2026-11-21` |
| a History line | date | local | `Until Sat Nov 21 2026 …` |
| a printed list of records | short-date | local | `Sat Nov 21` |

**A record's title carries no date.** The file name prefix carries the moment the record was written.

**A journal entry carries no datetime line under its title.** Its file name stamp carries its time.

**A use the mapping does not name is added to the mapping before it is written.** It takes one of the formats above, or a new format is added to the table first.

## Converting

**Convert a UTC time to local time with `format-datetime.sh`, never by working it out.** The arithmetic across zones and daylight saving time is where a conversion goes wrong. `slasher/system/foundation/format-datetime.sh <format> <prefix>` prints the moment a UTC file name prefix names in the named format, in local time, as `format-datetime.sh short-date 2026-11-22T02-01-28Z` prints `Sat Nov 21`. With no prefix it prints the present moment.

**The precision of a time is the a-time-value-carries-minutes-and-seconds rule's.** That rule says when a time carries seconds. A value already written keeps the precision it was written with.

**Why:** each use had its own form, set out in its own rule, and no rule set them side by side. Six forms differed in small ways: 12-hour or 24-hour, `at` or not, a zone or none. A reader who opens a file has chosen a low-level view, so a low-level form is not out of place there. Naming each format once, by its form, lets a use take a format by name, and shows when two uses could share one.

**How to apply:** before writing a date or a time, find its use in the mapping, and write it in the format and zone the mapping gives. Where the time is in UTC and is shown in local time, convert it with `format-datetime.sh`. Where a use is not in the mapping, add it first.

## Compressed

1. Write every date and time in one of the named formats. A format is named for its form, not for where it is used.
2. Each use takes the format the mapping names. Do not write a date or a time in a form the table does not name.

## The formats

| Name | Form | Example |
|---|---|---|
| **iso-full** | `YYYY-MM-DDTHH-MM-SS` | `2026-11-21T18-01-28` |
| **iso-date-short-time** | `YYYY-MM-DDTHH-MM` | `2026-11-21T18-01` |
| **iso-date** | `YYYY-MM-DD` | `2026-11-21` |
| **date** | `Ddd Mmm D YYYY` | `Sat Nov 21 2026` |
| **short-date** | `Ddd Mmm D` | `Sat Nov 21` |
| **date-time-text** | `Ddd Mmm D YYYY at HH:MM:SS` | `Sat Nov 21 2026 at 18:01:28` |

1. The time is 24-hour. The day of the month takes no leading zero.
2. An ISO format writes the time's colons as dashes.

## The zone

1. An ISO format is written in UTC or local time. A text format, `date`, `short-date`, or `date-time-text`, is written in local time only.
2. A time in UTC ends in `Z`, as `2026-11-22T02-01-28Z`.
3. A time in local time in a text format ends in the zone abbreviation, as `18:01:28 PT`. Write `PT`, not `PST` or `PDT`.
4. A time in local time in an ISO format has no suffix. Never write a numeric offset.
5. A format with no time has no suffix, and names the local day.

## The mapping

| Use | Format | Zone | Example |
|---|---|---|---|
| a dated record's file name prefix | iso-full | UTC | `2026-11-22T02-01-28Z` |
| a journal entry's file name stamp | iso-date-short-time | local | `2026-11-21T18-01` |
| a journal entry's file name stamp, where the writer gives seconds | iso-full | local | `2026-11-21T18-01-28` |
| a journal entry's file name stamp, where the writer gives no time | iso-date | local | `2026-11-21` |
| a provenance footer line | date-time-text | local | `Sat Nov 21 2026 at 18:01:28 PT` |
| a Settled resolution, a confirmation, or a Compression line | iso-date | local | `2026-11-21` |
| a History line | date | local | `Until Sat Nov 21 2026 …` |
| a printed list of records | short-date | local | `Sat Nov 21` |

1. A record's title carries no date.
2. A journal entry carries no datetime line under its title.
3. Add a use to the mapping before writing it. A new form is added to the table first.

## Converting

1. Convert a UTC time to local time with `slasher/system/foundation/format-datetime.sh <format> <prefix>`, never by working it out. `format-datetime.sh short-date 2026-11-22T02-01-28Z` prints `Sat Nov 21`. With no prefix it prints the present moment.
2. When a time carries seconds is the a-time-value-carries-minutes-and-seconds rule's. A value already written keeps its precision.

## Compression

- 2026-11-22, compressed: written with the rule; checked: 40 directives, 40 kept, 0 less precise, 0 lost

Related:

- the a-time-value-carries-minutes-and-seconds rule — when a time carries seconds
- the dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not rule — the file name prefix
- the record-a-rules-authorship-in-a-provenance-footer rule — the footer line
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — the lists that show the short date
- the `journal` package's journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule — the journal file name stamp

---

Authored by Scott Bellware on Sun Nov 22 2026 at 12:52:10 PT
