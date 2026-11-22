# Loop record — Datetime normalization

The implementation `2026-11-22T20-39-10Z-datetime-normalization` gives Slasher two scripts: `format-datetime.sh`, which prints a UTC file name prefix in a named datetime format in local time, and an `install.sh` migration, `migrate_datetimes`, which carries a project's records to the named formats. This record holds the hinges of those two scripts.

**Mode:** unattended, as the engineer asked when starting the work.

## Cycle 1 — the helper's actuation

- **Hinge:** how a use names the moment and the format.
- **Decision:** `format-datetime.sh <format> [<prefix>]`, the format first. A use always knows its format, and may have no moment, so the format leads and the prefix is optional. With no prefix the helper prints the present moment. The prefix may be a whole file name, since a list reads file names, and the helper reads its leading UTC prefix.

## Cycle 2 — the helper's observation

- **Hinge:** what the helper's output is checked against.
- **Decision:** each test fixes the zone with `TZ=America/Los_Angeles` and checks the printed text exactly, one file per format. A daylight-saving-time moment is checked separately, since the zone abbreviation must not change with the season: `PT`, not `PDT`. An unknown format fails, in its own file.

## Cycle 3 — the helper's implementation

- **Hinge:** how the zone abbreviation drops the season.
- **Decision:** a North American zone whose abbreviation is three letters ending `ST` or `DT`, as `PST` or `EDT`, takes its first letter and `T`. Any other zone is printed as `date` names it. The rule names `PT` as its example, and no other zone has a season-free abbreviation that `date` prints.

## Cycle 4 — the migration's actuation and observation

- **Hinge:** what the migration reaches, and what it leaves.
- **Decision:** it acts on the project's local directory only, since a project's `slasher/system/` is refreshed from the published packages. It drops a date from a work session title in three forms, keeps the word Session, drops a journal datetime line with the blank line after it, and converts a footer line in the 12-hour form with seconds. A footer line that stops at the hour, a time outside a footer, and a journal file name are left as they are. Each is a test outcome.

## Cycle 5 — the migration's naming

- **Hinge:** how the migration reports what it did.
- **Decision:** it counts each changed record once, however many of its parts changed, and names the three changes in one line. A record changed in two ways was first counted twice, and the count was corrected before the commit.

**Outcome:** `format-datetime.sh` with ten tests under `test/automated/format-datetime/`, and `migrate_datetimes` with three tests under `test/automated/install-datetimes/`. The automated suite passed: 152 test files.

---

Authored by Scott Bellware on Sun Nov 22 2026 at 13:16:51 PT
