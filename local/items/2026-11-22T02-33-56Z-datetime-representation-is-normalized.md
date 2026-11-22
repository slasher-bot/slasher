# Datetime representation is normalized

**State:** Open

**Tags:** [work]

**As the engineer stated it:** Normalize datetime representation

Slasher writes dates and times in a normalized set of forms. Today it writes them in six forms, each set out in its own rule, and a seventh, the short date in a printed list, is settled by the work item `2026-11-22T02-02-49Z-lists-show-a-short-form-of-the-date`:

- the file name prefix, as `2026-11-22T02-01-28Z`, in UTC
- the journal file name stamp, as `2026-11-21T18-01`, in local time
- the footer datetime, as `Sat Nov 21 2026 at 18:31:40 PT`
- the title datetime, as `Sat Nov 21 2026 18:01`
- the journal datetime line, as `Sat Nov 21 2026 at 18:01`
- the date, as `2026-11-21`
- the short date, as `Sat Nov 21`

## Settled

- **2026-11-21** — **As the engineer stated it:** A person reading a file has already chosen a low-level experience. Low-level datetime formats are not innappropriate at that level
- **2026-11-21** — **As the engineer stated it:** I would also like to define named datetime formats and then use those in specific circumstances. ie: There wouldn't be a "footer format" because that's a use case - an efferent, rather than an afferent defined format. I would need to name the different formats and specify their formatting.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 18:33:56 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 19:40:45 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 19:45:30 PT
