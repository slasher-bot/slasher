# Lists show a short form of the date

**State:** Progression

**Tags:** [work]

**As the engineer stated it:** Show short form of date in lists

A printed list of records shows a short form of the date. Today each row's handle is the full ISO-8601-UTC filename prefix, as `2026-11-22T02-01-28Z`. The short form is the short-date format, in local time.

## Settled

- **2026-11-21** — **As the engineer stated it:** The short for of the date should be, for example: Sat Nov 21
- **2026-11-21** — **As the engineer stated it:** The short form of the date in lists should convert the UTC time to local time
- **2026-11-22** — The short form is the short-date format in local time, as the dates-and-times-are-written-in-named-formats rule maps a printed list of records. `slasher/system/foundation/format-datetime.sh short-date <prefix>` prints it from a record's UTC file name prefix, as `format-datetime.sh short-date 2026-11-22T02-01-28Z` prints `Sat Nov 21`.
- **2026-11-22** — The short date replaces the file name prefix column in a printed list of records, selected by the engineer. A list then shows no file name prefix.
- **2026-11-22** — A list of commits keeps the short SHA in its first column, since a commit has no file name prefix.

## Progression

The implementation `2026-11-22T22-06-11Z-lists-show-short-date` carries this item's work.

## Tasks

- [ ] The printed-list rule says the first column of a list of records is its short date, in local time, and shows no file name prefix.
- [ ] The rule's example tables show the short date in the first column.
- [ ] Each list command prints the short date: /items, /current, /features, /experiments, /progressions, /contents, and /notes.
- [ ] The short date is printed by format-datetime.sh, never worked out by the agent.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 18:02:49 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 18:19:33 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 18:20:30 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 18:35:48 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:38:24 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:45:50 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:52:56 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:02:49 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:06:11 PT
