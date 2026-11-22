# Where an entry carries no time, ask for one through the selection interface

**Trigger:** When creating a journal entry for which the writer gave no time

When creating a journal entry, where the writer has not given a **time**, ask them through the selection interface. Do not choose a default, and do not invent or guess a placeholder time.

**A date settles nothing about the time.** *Yesterday*, *today*, *last Tuesday*, and an explicit date each fix the day and say nothing about the hour. So the ask fires for each of them, and the answer decides only whether the entry carries a time and what it is.

**The ask carries these options:**

1. **No time.** The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`.
2. **Now**, with the current time in the label — `Now (2:01 PM)`. The filename takes the `YYYY-MM-DDTHH-MM` prefix.
3. **Enter the time.** The writer gives the value. A value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix. Every other value stops at the minute.

**`Now` is held to the minute, like every other answer.** It reads a clock that has a seconds value, and the stamp drops it. Seconds reach a filename only where the writer states them, so no answer here produces a resolution the writer did not give. See the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule.

**`Now` is offered only for an entry about today.** For a back-dated entry the current clock time is not the entry's time, and naming it `Now` would say it is. The ask then carries **No time** and **Enter the time**.

**A date-only entry sorts to the start of its day**, which matches the filename sort, where `-` precedes `T`.

**The date is settled before the ask, and the ask does not revisit it.** Where the writer referred to a day, the entry takes that day. Where they referred to none, it takes today. The journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule's dating default governs that, and this rule governs the time alone.

**Why:** the writer owns the timestamp, and a guessed time is a fabricated fact. Asking keeps the journal accurate.

The trigger is the **time** rather than the whole datetime because a day-granular phrase is the ordinary way a person refers to when something happened. *Yesterday* is a complete answer about the day and no answer at all about the hour. A rule that fired only where the writer said nothing would take *yesterday* as settling the two, and would then have to invent an hour or drop one without asking.

Offering the date-only form as an answer is what makes it reachable. It was formerly a separate signal the writer had to know to give, which is a capability nobody discovers.

**How to apply:** on a new entry, check whether the writer gave a time. Where they did not, ask through the selection interface. Offer **No time**, **Now** with the current time in its label, and **Enter the time**. Drop **Now** where the entry is not about today.

Stamp the filename to the minute under **Now**, and under a time the writer stated to the minute. Write seconds only where the writer stated seconds.

Name the file to match the answer. Settle the date first by the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule's dating default, and do not put the date to the writer.

## Compressed

1. When creating a journal entry where the writer has not given a **time**, ask them through the selection interface.
2. Do not choose a default time.
3. Do not invent or guess a placeholder time.
4. A date does not settle the time. *Yesterday*, *today*, *last Tuesday*, and an explicit date each fix only the day.
5. The ask fires for each of those date references.
6. The answer decides only whether the entry carries a time and what it is.
7. Settle the date before the ask, by the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule's dating default.
8. Where the writer referred to a day, the entry takes that day. Where they referred to none, it takes today.
9. The ask does not revisit the date. Do not put the date to the writer.
10. This rule governs the time alone.

## The ask carries these options

1. **No time.** The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`.
2. Under **No time**, the stamp is a date alone.
3. **Now**, with the current time in the label, as in `Now (2:01 PM)`.
4. Under **Now**, the filename takes the `YYYY-MM-DDTHH-MM` prefix.
5. Under **Now**, the stamp stops at the minute.
6. **Enter the time.** The writer gives the value.
7. A value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix.
8. Every other entered value stops at the minute.

## Applying the answer

1. Offer **Now** only for an entry about today.
2. For a back-dated entry, offer only **No time** and **Enter the time**.
3. Hold **Now** to the minute. Drop the clock's seconds value from the stamp.
4. Write seconds in a filename only where the writer stated seconds. No answer produces a resolution the writer did not give.
5. A date-only entry sorts to the start of its day, matching the filename sort where `-` precedes `T`.
6. Name the file to match the answer.

## Compression

- 2026-10-24, compressed: compression 0.38, change 0.83, solubility 43 → 74, clarity 0.52 → 0.81, 24 directives, 24 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 74 → 70, clarity 0.81 → 0.81; checked: 24 directives, 24 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the `Explain` option and every statement about the free-text option are removed, at the engineer's direction; checked: 26 directives, 26 kept, 0 less precise, 0 lost; what is not kept was left out on purpose, in this revision or an earlier one, or is stated in the pre-loaded present-every-prompt-to-the-engineer-through-the-selection-ui rule
- 2026-11-22, revised: dates and times take the named formats, a record's title carries no date, and a journal entry carries no datetime line; checked: 16 directives, 16 kept, 0 less precise, 0 lost

## History

Until Sun Nov 22 2026 a journal entry carried a datetime line under its title, as `Sat Nov 21 2026 at 18:01`, under the a-journal-entry-has-a-human-readable-datetime-line-under-its-title rule. The dates-and-times-are-written-in-named-formats rule settled that it carries none, and that rule is discontinued.

Until Sun Oct 25 2026 this rule was named ask-for-entry-time-or-omit-it.

Until Thu Oct 29 2026 the ask also carried an `Explain` option, offered under the foundation package's present-every-prompt-to-the-engineer-through-the-selection-ui rule. The rule also held that `Enter the time` was an answer within the question rather than an agent-supplied free-text option, since the harness supplies its own free-text option for anything else.

Related:

- the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule — the dating default that settles the date, and the filename stamp
- the foundation package's present-every-prompt-to-the-engineer-through-the-selection-ui rule — the interface

---

Authored by Scott Bellware on Fri Aug 14 2026 at 09:55:45 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 13:05:44 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 13:10:10 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 14:01:46 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 14:06:30 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 14:54:56 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PT
Changed by Scott Bellware on Sat Oct 24 2026 at 14:41:36 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:22:48 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:20 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:25 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:41 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 18:12:53 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 18:45:58 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:29:24 PT
Changed by Scott Bellware on Thu Oct 29 2026 at 13:34:54 PT
Changed by Scott Bellware on Thu Oct 29 2026 at 13:40:05 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:08:40 PT
