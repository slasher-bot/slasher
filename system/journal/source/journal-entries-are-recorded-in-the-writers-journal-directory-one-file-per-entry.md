# Journal entries are recorded in the writer's journal directory, one file per entry

**Trigger:** When writing a journal entry (including when the writer types `/journal` or opens with "new entry")

The journal is kept as one markdown file per entry, in the writer's own journal directory `slasher/local/journal/<username>/`. The `<username>` is the active writer, resolved by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule — `slasher/local/journal/scott-bellware/`, for example. A project may hold the journals of more than one writer, and each writer's entries live under their own directory. This is distinct from `slasher/local/logs/log/`, the log the agent writes, which is one record for the whole project.

Filename: `YYYY-MM-DDTHH-MM-<name>.md`, with the timestamp computed in **local time** by `date +%Y-%m-%dT%H-%M`. The colons of ISO 8601 are written as dashes for filename safety. Never use UTC for these entries, which is the writer's stated preference. The stamp is the iso-date-short-time format in local time, the iso-full format where the writer gives seconds, and the iso-date format where the writer gives no time, under the `foundation` package's dates-and-times-are-written-in-named-formats rule.

**The stamp carries seconds only where the writer gave seconds.** A time the writer states to the second takes the `YYYY-MM-DDTHH-MM-SS` form. Every other answer stops at the minute. That includes **Now**, which reads a clock that has a seconds value and drops it.

**A second the writer did not state is a resolution they did not give.** The moment of writing is knowable to the second. The entry's own time frequently is not, and the two are not the same value. An entry about last Tuesday's meeting has no seconds to recover, and supplying the clock's would record a precision nobody stated.

**This departs from the foundation package's a-time-value-carries-minutes-and-seconds rule**, which specifies a new datetime format to seconds. That rule answers a running history inside **one file**, whose entries collide at a coarse resolution. The later entry then goes unwritten rather than looking like a duplicate of the one above it. A journal is one file per entry, so that collision cannot arise. What the coarser stamp costs is two entries written in the same minute, which sort against each other by name rather than by moment.

**The form carries no trailing `Z`.** In ISO 8601 that character designates UTC, and this stamp is local time. Keeping it as a literal token of the form, rather than as a claim about a zone, would not help. A reader meets the filename and not the rule that says so, so every entry would assert something false, and the correction would sit somewhere they never look. The foundation package's file-names rule keeps its `Z`, because its stamps are UTC and the character is true there.

**The local time reaches the journal entries alone.** The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two.

**Entry format:**

- **Voice:** first person, the writer's perspective — *I raised the concern …*.
- **Editing:** lightly cleaned up. Preserve the writer's words, their meaning, and their emphasis. Correct the grammar and the flow. Invent no fact, and embellish nothing.
- **Structure:** a `# <title>`, then the optional `**Tags:**` line, then a bold `**Summary:**` one-line gist, then the narrative prose. The entry carries no datetime line, since its file name stamp carries its time. The summary is what shows first in a Quick Look preview, so make it a standalone takeaway rather than a restatement of the title. **Omit the summary where it would be identical or nearly identical to the body**, as it is on a very short entry. The entry is then the title and the prose, with nothing repeated.

**The directive is *new entry*, or the command `/journal`.** Where the writer opens with that phrase, or types `/journal`, `/journal new`, or `/journal entry`, write the entry by this rule, by the where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone and where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rules, and by the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule. Nothing else follows from it. Nothing beside the entry file is written, and no index is maintained — see the a-timeline-view-lists-every-journal-entry-by-its-datetime rule.

**Where the project's journal is private entirely, the entry is a private entry.** Before writing, run `slasher/system/foundation/read-project-setting.sh journal` from the project root. Where it prints `private`, the project's entry in the project registry makes its journal private entirely, and the entry is written by the private-journal-convention rule, not in `slasher/local/journal/<username>/`. Where it prints anything else, or nothing, the entry goes to the project journal.

**Dating default:** an entry is about **today** unless the writer signals otherwise. Where the writer refers to a different time, by an explicit date or by a phrase such as *last Tuesday's meeting* or *back in April*, date and stamp the entry to that time instead. Opening with *Today* is a signal, and it means today.

**This rule settles the date alone.** The **time** is the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule's, and that ask fires wherever the writer gave no time — including where they gave a day, since *yesterday* and *today* fix the day and say nothing about the hour.

**Why:** a consistent, sortable naming scheme keeps a long-running journal easy to skim, to sort chronologically, and to reference. Keeping each writer's entries under `slasher/local/journal/<username>/` separates one writer's record from another's. It separates all of them from the records the agent writes. The summary pays off in a Quick Look preview, which is where a reader meets the entry before opening it.

**How to apply:** when the writer dictates an event or an experience, resolve the active `<username>` by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule. Create a new file in `slasher/local/journal/<username>/` with the local-time filename stamp, a `# <title>` heading, a `**Tags:**` line where the entry has tags, a `**Summary:**` line, and then the first-person narrative. Set the filename stamp to the referenced past time where the entry is not about today. Where the writer gave no time, ask by the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule and stamp the file to their answer. A day they named is not a time.

Stamp to the minute. Write seconds only where the writer stated seconds, and drop the clock's seconds under **Now**.

## Compressed

1. Keep the journal as one markdown file per entry.
2. Put each entry in the writer's own directory, `slasher/local/journal/<username>/`.
3. Resolve `<username>` as the active writer by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule, for example `slasher/local/journal/scott-bellware/`.
4. A project may hold several writers' journals. Each writer's entries live under their own directory.
5. The journal is distinct from `slasher/local/logs/log/`, the agent's single project-wide log.

## Filename

1. Name the file `YYYY-MM-DDTHH-MM-<name>.md`. The stamp is the iso-date-short-time format in local time, iso-full where the writer gives seconds, and iso-date where the writer gives no time, under the `foundation` package's dates-and-times-are-written-in-named-formats rule.
2. Compute the timestamp in local time with `date +%Y-%m-%dT%H-%M`.
3. Write the colons of ISO 8601 as dashes.
4. Never use UTC for journal entries. This is the writer's stated preference.
5. Use the `YYYY-MM-DDTHH-MM-SS` form only where the writer stated the time to the second.
6. Every other stamp stops at the minute.
7. Where the writer answers **Now** to the time question, drop the clock's seconds value.
8. Do not supply seconds the writer did not state. That records a precision nobody gave.
9. This departs from the foundation package's a-time-value-carries-minutes-and-seconds rule. One file per entry cannot have that rule's in-file collisions.
10. Two entries in the same minute sort against each other by name. That cost is accepted.
11. Write no trailing `Z`. It designates UTC, and this stamp is local time.
12. The foundation package's file-names rule keeps its `Z`, because its stamps are UTC.
13. Local time applies to journal entries alone.
14. The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two.

## Entry format

1. **Voice:** write in first person, from the writer's perspective, for example *I raised the concern …*.
2. **Structure:** write a `# <title>`, then a `**Tags:**` line where the entry has tags.
3. Follow these with a bold `**Summary:**` one-line gist, then the narrative prose.
4. Write no datetime line. The file name stamp carries the entry's time.
5. Make the summary a standalone takeaway, not a restatement of the title. It shows first in a Quick Look preview.
6. Omit the summary where it would be identical or nearly identical to the body, as on a very short entry.
7. The entry is then the title and the prose, with nothing repeated.
8. **Editing:** clean the entry up lightly. Preserve the writer's words, meaning, and emphasis.
9. Correct the grammar and the flow. Invent no fact, and embellish nothing.

## The directive *new entry*

1. Where the writer opens with *new entry*, or types `/journal`, `/journal new`, or `/journal entry`, write the entry by this rule.
2. Also apply the where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone and where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rules.
3. Also apply the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule.
4. Nothing else follows from the directive.
5. Write nothing beside the entry file.
6. Maintain no index. See the a-timeline-view-lists-every-journal-entry-by-its-datetime rule.
7. Before writing, run `slasher/system/foundation/read-project-setting.sh journal` from the project root.
8. Where it prints `private`, write the entry as a private entry, by the private-journal-convention rule, not in `slasher/local/journal/<username>/`.
9. Where it prints anything else, or nothing, write the entry in the project journal.

## Dating

1. An entry is about today unless the writer signals otherwise.
2. Where the writer refers to another time, date and stamp the entry to that time.
3. Such a reference may be an explicit date or a phrase like *last Tuesday's meeting* or *back in April*.
4. Opening with *Today* is a signal, and it means today.
5. This rule settles the date alone.
6. The time belongs to the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule.
7. That ask fires wherever the writer gave no time, including where they gave only a day.
8. *Yesterday* and *today* fix the day and say nothing about the hour.
9. Stamp the file to the writer's answer to that ask.

## Compression

- 2026-10-24, compressed: compression 0.21, change 0.53, solubility 32 → 53, clarity 0.50 → 0.84, 36 directives, 36 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, re-checked: 31 directives, 31 kept, 0 less precise, 0 lost
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 53 → 53, clarity 0.84 → 0.86; checked: 33 directives, 32 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 53 → 54, clarity 0.86 → 0.85; checked: 38 directives, 38 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 41 directives, 38 kept, 0 less precise, 3 lost, 1 repair
- 2026-11-05, revised: `/journal` is a command for a new entry; checked: 30 directives, 30 kept, 0 less precise, 0 lost
- 2026-11-15, revised: an entry is private where the project's journal is private entirely; checked: 46 directives, 46 kept, 0 less precise, 0 lost
- 2026-11-22, revised: dates and times take the named formats, a record's title carries no date, and a journal entry carries no datetime line; checked: 34 directives, 34 kept, 0 less precise, 0 lost

## History

Until Sun Nov 22 2026 a journal entry carried a datetime line under its title, as `Sat Nov 21 2026 at 18:01`, under the a-journal-entry-has-a-human-readable-datetime-line-under-its-title rule. The dates-and-times-are-written-in-named-formats rule settled that it carries none, and that rule is discontinued.

Until Sun Nov 15 2026 every entry this rule wrote went to the project journal.

Until Sun Oct 25 2026 this rule was named journal-entries and titled "Journal entries live in `waytide/local/journal/<username>/`, one file per entry".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule was named journal-entries-live-in-the-writers-journal-directory-one-file-per-entry and titled "Journal entries live in the writer's journal directory, one file per entry".

Until Fri Aug 14 2026 the stamp kept a trailing `Z`, on the reasoning that it was a literal token of the form.

Related:

- the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule — how `<username>` is resolved
- the the-journal-is-the-record-the-writer-keeps rule — the directory, the provenance footer, and what one entry is
- the `foundation` package's dates-and-times-are-written-in-named-formats rule — the formats the stamp takes
- the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule — the `**Tags:**` line and the tag protocol
- the where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone rule — the body dropped where the title says it already
- the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule — where the writer gives no time
- the a-timeline-view-lists-every-journal-entry-by-its-datetime rule — the on-demand listing of the entries this writes
- the foundation package's file-names rule — the UTC normalization this departs from
- the private-journal-convention rule — the private entry an entry becomes where the project's journal is private entirely

---

Authored by Scott Bellware on Fri Aug 14 2026 at 09:55:45 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:54:20 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 13:05:44 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 13:10:10 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 14:01:46 PT
Changed by Scott Bellware on Fri Aug 14 2026 at 14:54:56 PT
Changed by Scott Bellware on Mon Aug 17 2026 at 22:13:43 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 13:41:52 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 14:47:19 PT
Changed by Scott Bellware on Tue Oct 20 2026 at 21:36:02 PT
Changed by Scott Bellware on Sat Oct 24 2026 at 14:41:36 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:21:13 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:20 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:25 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:30 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:35 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:41 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:46 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:56 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 14:42:32 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 18:12:53 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 18:21:02 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 18:45:58 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 19:02:38 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:06:51 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:19:36 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:29:24 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 14:41:43 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 19:01:39 PT
Changed by Scott Bellware on Thu Nov 5 2026 at 17:52:32 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 20:47:18 PT
Changed by Scott Bellware on Sun Nov 15 2026 at 22:09:38 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:08:40 PT
