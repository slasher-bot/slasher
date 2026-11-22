# A printed list of records is formatted as a table or as a list of rows

**Trigger:** When the engineer asks for a list of records, as with `/item list`, `/list`, `/items`, `/current`, `/features`, `/experiments`, `/contents`, or `/notes`

**When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence.** A table presents the fields in headed columns. Rows present one record to a line, its fields in sequence, with no columns. **A list is called a table only where it is formatted as columns.** That reaches any record — items, progression records, log entries, loop records, work session records, migration records, journal entries, and commits.

**The first column is the record's handle and carries no heading.** That is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit. The columns after it are headed.

**A list of items opens with an ordinal**, a number from 1 in the order the rows are printed, ahead of the handle. The engineer refers to a row by that number.

**A list of progressions opens with a letter ordinal**, A, B, C, and so on, from A in the order the rows are printed, ahead of the handle. After Z come AA, AB, and so on. The engineer refers to a row by that letter, and the engineer can type it in either case. A letter never names an item's row, and a number never names a progression's, so `/current`, which prints both, gives each row an ordinal no other row has.

**As the engineer stated it:** Give progressions an ordinal like items in a list, but sequence them with letters, eg: A, B, C, etc

**Two SHA columns follow the handle: the commit that created the record, and the last to touch it.** They are standing columns rather than chosen ones, in every list but a list of items, a list of commits, and the lists `/features`, `/experiments`, and `/contents` print.

```
|                        | created   | changed   | progression                      | state     |
|------------------------|-----------|-----------|----------------------------------|-----------|
| `2026-08-25T00-36-18Z` | `159985b` | `ed7ec4a` | Feature — Self-Explanation       | Abandoned |
| `2026-10-21T05-44-56Z` | `d27a638` | `66d2ea2` | Feature — "Item" replaces "idea" | Completed |
```

A list of items takes the ordinal, a kind column, and no SHA columns:

```
| # |                        | item                        | kind   | state  |
|---|------------------------|-----------------------------|--------|--------|
| 1 | `2026-08-10T20-54-51Z` | A Generalized Description   | Design | Active |
| 2 | `2026-08-23T06-58-41Z` | Slasher for content and web | Idea   | Open   |
```

**A record never amended shows the same SHA twice, and that is the point.** The pair says whether a record has been touched since it was written. One that has not, and whose subject has moved since, is the stale case a reader is looking for.

**The last column is chosen for the question.** A list of items or progressions takes the state. A list of commits asked about for their subject widths takes the width. A column nobody asked for is padding.

**A list of commits takes no SHA columns**, because the handle is already the SHA and a commit has no creation distinct from itself. **A list of items takes none either**, at the engineer's direction. Its rows are referred to by their ordinal.

**Every list of items takes a kind column, between the title and the state.** It names the kind each of the item's tags gives, written as a word, not as a tag: *Idea* for `[idea]`, *Work* for `[work]`, and *Legal matter* for `[legal-matter]`. Where the item carries several tags, it names each, separated by commas. `/items`, `/items current`, `/item list`, and `/current` each print it. A list of notes takes none, since every row is a note.

**As the engineer stated it:** Include the item kind in item lists.

## Listing items by state

**A list of items may be asked for by state, and lists the items whose `**State:**` line reads that state.** `current` is not a state: it asks for the Open, Active, and Progression items together, the items whose work has not concluded and is not paused.

**As the engineer stated it:** remove suspended from current.

## The items command

**`/items` lists every item, whatever its state, oldest first.** Each row is an ordinal, the item's handle, its title, its kind, and its state. The list takes no SHA columns, as other lists of items do.

**A hidden record is counted rather than listed**, under the a-status-report-prints-a-fixed-whole-project-report rule. A Suspended item is left out of the rows, and a line below the table gives the count and the kind, as `1 suspended item`.

**`/items current` lists the current items**, the Open, Active, and Progression ones, as `/item list current` does.

**As the engineer stated it:** The "/items" command should print all items. The "/items current" command should do what "/items" does presently.

## The current command

**`/current` lists the current items, then the current progressions.** The items are the Open and Active ones. A Progression item is left out, since the progressions below show the work it is under. The progressions are the progressions of every kind whose `**State:**` line reads Open, Active, or Suspended: the ones that have not concluded, whether they are not yet started, under way, or paused.

**As the engineer stated it:** When current items and implementations are printed together, as is the case with some commands, items in the Implementation state should not be printed. When current items are printed on their own, items in the Implementation state should be printed.

**The items table printed by `/current` takes the kind column every list of items takes.**

**As the engineer stated it:** Include the item kind in the table printed by "/current"

**`/current` takes an optional number, *n*, and then lists only the *n* most recent current items.** An item's recency is its handle, the time it was created. The items listed keep the order of the full list, oldest first, and their ordinals count from 1. The number does not reach the current progressions, which are listed in full. `/current 5` lists the five most recently created current items.

**As the engineer stated it:** The "/current" command should optionally take a number that is the **n-most** recent items

**As the engineer stated it:** Don't print the kind as its tag. eg: for "[idea]", print in the table, "Idea"

**`/current` prints no item totals.** It counts no state of the items it leaves out, and prints no *Other items* heading. A Suspended item is a hidden record, under the a-status-report-prints-a-fixed-whole-project-report rule, so below the items table `/current` prints one line giving the count and the kind of the Suspended items, as `1 suspended item`, as `/items` does. Where no item is Suspended, it prints no such line. A number given to `/current` does not change the count.

**As the engineer stated it:** Don't print item totals in current

**Each current progression is one row: its letter ordinal, its handle, its title, and its state.** Its title is the record's own, as in `Feature — The current command`. It takes no SHA columns, since the list is a summary below the items, not a list of its own. Its letters count from A, apart from the items' numbers.

**The progressions sit under the heading *Progressions (feature, experiment, content)*.** **Where no progression is current, the summary is one line: *No current progression.*** It is printed under that heading, in place of the rows.

**As the engineer stated it:** No current feature or experiment.

**As the engineer later stated it:** Change it to: No current progression (feature, experiment, article)

**As the engineer then stated it:** Put "(feature, experiment, article)" in the "Progressions" heading, remove it from the "No current progression" line

**As the engineer then stated it:** (feature, experiment, content)

**As the engineer stated it:** Change current-items to current, and include a summary of current implementations at the bottom.

## The features and experiments commands

**`/features` lists the current features, and `/experiments` lists the current experiments.** A current feature or experiment is one whose `**State:**` line reads Open, Active, or Suspended, as with the current progressions `/items` lists. A record's kind is the word its title opens with, as in `Feature — The current command` or `Experiment — Rules files flattening`.

**Each row is a letter ordinal, the record's handle, its title, and its state.** The list takes the letter ordinal and no SHA columns, as a list of items takes its number ordinal and no SHA columns, since each command does for its kind what `/current` does for items. The title is the record's own.

**Each command takes an optional number, *n*, and then lists only the *n* most recently created current records of its kind.** A record's recency is its handle. The records listed keep the order of the full list, oldest first, and their ordinals count from A. `/features 3` lists the three most recently created current features.

**Each command takes `current` too, as `/items` does, and it changes nothing.** `/features current` lists what `/features` lists, and `/features current 3` what `/features 3` lists.

**Where none of its kind is current, the list is one line:** *No current feature.* for `/features`, and *No current experiment.* for `/experiments`.

**`/progressions` lists the current progressions of every kind, and `/implementations` is its alias.** It is what `/features` is, for every kind at once: a letter ordinal, the handle, the title, and the state in each row, the number and `current` as `/features` takes them, the one line *No current progression.* where none is current, and the counts under the heading *Other progressions*.

**`/contents` lists the current content, and `/content list` does the same.** It is what `/features` is, for the content kind: a letter ordinal, the handle, the title, and the state in each row, the number and `current` as `/features` takes them, the one line *No current content.* where none is current, and the counts under the heading *Other content*. The content-is-a-progression-without-the-steps-that-serve-only-code rule governs the content kind.

**Below the list, each command counts the records of its kind it leaves out, by state.** The counts sit under the heading *Other features* or *Other experiments*, as one comma-separated sentence, as in `34 Completed, 1 Abandoned`. Each state other than Open, Active, and Suspended that some record of the kind holds is named once, with its count. The states run from the largest count to the smallest. A number given to the command does not change the counts.

**As the engineer stated it:** Create a "/features" command and an "/experiments" command that does for them what the "/items" command does

## The notes command

**`/notes` lists every item tagged `[note]`, oldest first.** A note is Recorded when it is written and never changes state, so every note is listed, and no state is current or left out.

**Each row is an ordinal, the note's handle, and its title.** The list takes no SHA columns, as a list of items does, and no state column, since every row would read Recorded.

**`/notes` takes an optional number, *n*, and then lists only the *n* most recently created notes.** A note's recency is its handle. The notes listed keep the order of the full list, oldest first, and their ordinals count from 1. `/notes 3` lists the three most recently created notes.

**Where no note exists, the list is one line:** *No note.*

**As the engineer stated it:** A "/notes" command that lists the items tagged [note]

## Keep every column short

**A field that is a sentence does not belong in a table.** Column widths are fixed against the widest cell, so one long field narrows every other column and wraps every row. What was a scannable grid becomes prose in boxes.

**Where the engineer asks for a table, render one, in rows and columns, whatever the length of its fields.** The request settles the form.

**Where a record's summary is wanted, the answer is rows rather than a table.** That is not a failure of this rule. Rows are the form where a field runs to a sentence, and the two forms answer to the length of what is in them.

## What this does not reach

**The status report's tables are already tables**, and the a-status-report-prints-a-fixed-whole-project-report rule says so. The two rules agree.

**An answer that is not a list of records.** The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs how a **set of records** is presented, and the two do not overlap: a table is a list, rendered for a reader who is looking for one row.

**Why:** a record list is scanned rather than read. The reader has a record in mind and is looking for its row, or is comparing one field across rows. A table puts the same field in the same place on every row, so the eye goes down a column instead of parsing each line to find where the field sits.

Rows are the better form where a field is long, and that is the whole of the exception. The two forms are not in competition — they answer to the length of what is in them.

**How to apply:** on a request for a list of records, render a table where every field is short, and rows where a field runs to a sentence. Do not call a list a table unless it is formatted as columns. Where the engineer asks for a table, render one in rows and columns. In a table, put the handle first with no heading, then the creating commit and the last commit to touch it, then the title, then one column for the fact that was asked about. Give a list of commits no SHA columns. Give a list of items an ordinal ahead of the handle, and no SHA columns. Give a list of progressions a letter ordinal ahead of the handle.

Keep every column short. Where a field runs to a sentence, use rows instead.

## Compressed

1. When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence. A table presents the fields in headed columns. Rows present one record to a line, with its fields in sequence and no columns. A list is called a table only where it is formatted as columns.
2. This applies to any record type. That includes items, progression records, log entries, loop records, work session records, migration records, journal entries, and commits.
3. The first column is the record's handle and has no heading.
4. The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit.
5. Every column after the handle has a heading.
6. Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it. A list of items takes no SHA columns, and opens with an ordinal ahead of the handle, which the engineer refers to a row by. The ordinal counts from 1, in the order the rows are printed. A list of progressions opens with a letter ordinal instead: A, B, C, from A in the order the rows are printed, then AA, AB, and so on after Z. The engineer may type a letter in either case. A letter never names an item's row, and a number never names a progression's, so each row `/current` prints has an ordinal no other row has.
7. These two SHA columns are always present, in every list but a list of items, a list of commits, or the lists `/features`, `/experiments`, and `/contents` print. They are not chosen per request.
8. After the SHA columns comes the title. Then comes one column for the fact asked about.

```
|                        | created   | changed   | progression                      | state     |
|------------------------|-----------|-----------|----------------------------------|-----------|
| `2026-08-25T00-36-18Z` | `159985b` | `ed7ec4a` | Feature — Self-Explanation       | Abandoned |
| `2026-10-21T05-44-56Z` | `d27a638` | `66d2ea2` | Feature — "Item" replaces "idea" | Completed |
```

A list of items takes the ordinal, a kind column, and no SHA columns:

```
| # |                        | item                        | kind   | state  |
|---|------------------------|-----------------------------|--------|--------|
| 1 | `2026-08-10T20-54-51Z` | A Generalized Description   | Design | Active |
| 2 | `2026-08-23T06-58-41Z` | Slasher for content and web | Idea   | Open   |
```

9. A record that was never amended shows the same SHA in both columns. This is intended, since it shows the record has not been touched since it was written.
10. Choose the last column to fit the question.
11. A list of items or progressions takes the state as its last column.
12. Every list of items takes a kind column between the title and the state: `/items`, `/items current`, `/item list`, and `/current`. Name the kind each tag gives as a word, not a tag: *Idea* for `[idea]`, *Legal matter* for `[legal-matter]`. Name several tags each, separated by commas. A list of notes takes none.
13. A list of commits asked about for their subject widths takes the width.
14. Do not add a column nobody asked for.
15. A list of commits takes no SHA columns.

## Listing items by state

1. A list of items may be asked for by state, and lists the items whose `**State:**` line reads that state.
2. `current` asks for the Open, Active, and Progression items together. It is not a state, and it leaves out Suspended items.

## The items command

1. `/items` lists every item, whatever its state, oldest first.
2. Present each item as one row: an ordinal, its handle, its title, its kind, and its state. Give it no SHA columns.
3. A Suspended item is a hidden record, counted rather than listed, under the a-status-report-prints-a-fixed-whole-project-report rule. Leave it out of the rows. Below the table, print a line giving their count and kind, as `1 suspended item`.
4. `/items current` lists the Open, Active, and Progression items, as `/item list current` does.

## The current command

1. `/current` lists the Open and Active items, then, under the heading *Progressions (feature, experiment, content)*, the current progressions. It leaves out Progression items, whose work the progressions show. `/items current` still lists them.
2. The current progressions are the progressions of every kind whose `**State:**` line reads Open, Active, or Suspended.
3. Present each current progression as one row: its letter ordinal, its handle, its title, and its state. The title is the record's own, as in `Feature — The current command`. Give it no SHA columns. Its letters count from A, apart from the items' numbers.
4. Where no progression is current, print the one line *No current progression.* under that heading, in place of the rows.
5. The items table `/current` prints takes the kind column every list of items takes.
6. `/current` takes an optional number *n*, as in `/current 5`. It then lists only the *n* most recently created Open and Active items, by handle, oldest first, with ordinals from 1. It lists the current progressions in full.
7. Print no item totals and no *Other items* heading. Below the items table, print one line giving the count and kind of the Suspended items, as `1 suspended item`, and no line where none is Suspended.
8. A number given to `/current` does not change this count.

## The features and experiments commands

1. `/features` lists the current features, and `/experiments` lists the current experiments: those whose `**State:**` line reads Open, Active, or Suspended.
2. A record's kind is the word its title opens with, as in `Feature — The current command`.
3. Present each record as one row: a letter ordinal, its handle, its title, and its state. The title is the record's own. Give it no SHA columns.
4. Each command takes an optional number *n*, as in `/features 3`. It then lists only the *n* most recently created current records of its kind, by handle, oldest first, with ordinals from A.
5. Each command takes `current` too, as `/items` does. `/features current` does what `/features` does, and `/features current 3` what `/features 3` does.
6. Where none of its kind is current, print the one line *No current feature.* or *No current experiment.* in place of the rows.
7. Below the list, under the heading *Other features* or *Other experiments*, print the count of each state other than Open, Active, and Suspended that some record of the kind holds, as one comma-separated sentence: `34 Completed, 1 Abandoned`. Order the states from the largest count to the smallest.
8. A number given to the command does not change these counts.
9. `/progressions`, and its alias `/implementations`, lists the current progressions of every kind, as `/features` lists the features, and takes the number *n* and `current` as `/features` takes them. Where none is current, print *No current progression.* Its counts sit under the heading *Other progressions*.
10. `/contents`, and `/content list`, lists the current content, as `/features` lists the features, and takes the number *n* and `current` as `/features` takes them. Where none is current, print *No current content.* Its counts sit under the heading *Other content*.

## The notes command

1. `/notes` lists every item tagged `[note]`, oldest first.
2. Present each note as one row: an ordinal, its handle, and its title. Give it no SHA columns and no state column.
3. `/notes` takes an optional number *n*, as in `/notes 3`. It then lists only the *n* most recently created notes, by handle, oldest first, with ordinals from 1.
4. Where no note exists, print the one line *No note.* in place of the rows.

## Keep every column short

1. Keep every column short.
2. Do not put a field that runs to a sentence in a table. Present rows instead, unless the engineer asks for a table, which is then rendered in rows and columns.
3. Where a record's summary is wanted, present rows instead of a table. This is part of the rule, not a failure of it.

## What this does not reach

1. This rule does not reach the status report's tables. They stay tables, under the a-status-report-prints-a-fixed-whole-project-report rule.
2. This rule does not govern an answer that is not a list of records.
3. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs only how a set of records is presented.

## Compression

- 2026-10-24, compressed: compression 0.26, change 0.56, solubility 37 → 69, clarity 0.33 → 0.75, 14 directives, 14 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, re-checked: 24 directives, 21 kept, 3 less precise, 0 lost, 3 repairs, re-checked kept
- 2026-10-27, revised: the example tables show the full prefix as the handle; checked: 24 directives, 24 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 69 → 56, clarity 0.75 → 0.75; checked: 23 directives, 23 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 25 directives, 25 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-02, revised: a list of items is asked for by state, and current is Open and Active; checked: 29 directives, 29 kept, 0 less precise, 0 lost
- 2026-11-06, revised: the current command lists the current items, then the current implementations; checked: 38 directives, 38 kept, 0 less precise, 0 lost
- 2026-11-06, revised: where no implementation is current, the summary says *No current feature or experiment.*, and the items table of `/current` takes a kind column, written as a word rather than a tag; checked: 41 directives, 38 kept, 3 less precise, 0 lost, 2 repairs; re-checked: 41 directives, 40 kept, 1 less precise, 0 lost, 1 repair; re-checked after the kind is written as a word: 43 directives, 43 kept, 0 less precise, 0 lost
- 2026-11-06, revised: `/current` takes an optional number of the most recent current items to list; checked: 41 directives, 35 kept, 6 less precise, 0 lost, 1 repair; re-checked: 41 directives, 39 kept, 2 less precise, 0 lost. Left less precise: the trigger's example commands `/item list` and `/list`, which the trigger line carries, and the example *Work* for `[work]`
- 2026-11-06, revised: the command is `/report`, in place of `/current`, a term swap the engineer settled; not re-checked
- 2026-11-07, revised: the command is `/items`, in place of `/report`, a term swap the engineer settled; not re-checked
- 2026-11-07, revised: `/items` counts the items it leaves out, by state, below the items table, as points 7 and 8 of the items command; checked: 41 directives, 39 kept, 2 less precise, 0 lost, 0 repairs. Left less precise: the example *Work* for `[work]`, as before, and the heading the no-implementation line sits under, which point 1 of the items command ties to the implementations
- 2026-11-07, revised: `/items` prints its state counts as one comma-separated sentence, in point 7 of the items command; checked: 31 directives, 30 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the example *Work* for `[work]`, as before
- 2026-11-07, revised: `/items` prints its state counts under the heading *Other items*, in point 7 of the items command; checked: 36 directives, 35 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the heading the no-implementation line sits under, as before
- 2026-11-09, revised: `/features` and `/experiments` list the current records of their kind, with an optional number and counts of the other states, as the features and experiments commands; checked: 48 directives, 47 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the example *Work* for `[work]`, as before
- 2026-11-09, revised: a current implementation is Open, Active, or Suspended; not re-checked
- 2026-11-09, checked: 61 directives, 60 kept, 1 less precise, 0 lost. Left less precise: the kind column's example for [work], which the general instruction produces
- 2026-11-10, revised: the command is `/current`, in place of `/items`, a term swap the engineer settled; not re-checked
- 2026-11-11, revised: `/features` and `/experiments` take `current`, at the engineer's direction; not re-checked
- 2026-11-13, revised: `/notes` lists every item tagged `[note]`, with an optional number, as the notes command; the notes command checked: 12 directives, 12 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-13, revised: `/items` lists every item, and `/items current` the current ones, as the items command; the items command checked: 12 directives, 10 kept, 2 less precise, 0 lost, 1 repair. Left less precise: that `/items current` does what a bare `/items` did before, which point 4 carries by naming `/item list current`, the same list
- 2026-11-13, revised: `/current` leaves out Implementation items and counts them under Other items, as the current command; the current command checked: 24 directives, 19 kept, 2 less precise, 3 lost, 1 repair, not re-checked. Left less precise: the example *Work* for `[work]`, and the summary's heading, as before. Left lost: that `/current` replaced `/current-items`, an engineer's statement of a rename, not a directive of the command now
- 2026-11-13, revised: current is Open, Active, and Implementation; not re-checked
- 2026-11-18, revised: every list of items takes a kind column, between the title and the state, and a list of notes takes none, which the engineer asked for; checked: 83 directives, 81 kept, 2 less precise, 0 lost. Left less precise: the features and experiments title being the record's own, and no note counting as current or left out, both in sections this revision did not change
- 2026-11-20, revised: progression replaces implementation in the record sense, a term swap the engineer settled; not re-checked
- 2026-11-20, revised: `/progressions`, and its alias `/implementations`, lists the current progressions of every kind; checked: 108 directives, 105 kept, 3 less precise, 0 lost, 2 repairs; the third, the reason an untouched record shows one SHA twice, is a reason and is left as it is; re-checked: 108 directives, 106 kept, 2 less precise, 0 lost, 1 repair, `/progressions` taking the number and `current`; the other is that reason; re-checked: 108 directives, 107 kept, 1 less precise, 0 lost, the one being that reason
- 2026-11-20, revised: where no progression is current, `/current` prints *No current progression (feature, experiment, article)*, in the engineer's words; checked: 108 directives, 107 kept, 1 less precise, 0 lost, the one being the reason left before
- 2026-11-20, revised: the heading *Progressions (feature, experiment, article)*, and the line *No current progression.*, in the engineer's words; checked: 109 directives, 108 kept, 1 less precise, 0 lost, the one being the reason left before
- 2026-11-20, revised: the heading names *content*, not *article*, in the engineer's words, a swap of one term for another the engineer settled; not re-checked
- 2026-11-20, revised: `/contents` and `/content list` list the current content, as the content kind settles; checked: 77 directives, 76 kept, 0 less precise, 1 lost, 1 repair: the content rule is named in Related; re-checked: 77 directives, 77 kept, 0 less precise, 0 lost
- 2026-11-21, revised: a list of progressions numbers its rows with letters, A, B, C, and the progressions `/current` lists take one; checked: 100 directives, 98 kept, 1 less precise, 1 lost, 1 repair: that each row `/current` prints has an ordinal no other row has; the lost one, Implementation items left out where progressions are listed beside them, is carried under the term Progression, so the source decides it kept; re-checked: 100 directives, 100 kept, 0 less precise, 0 lost
- 2026-11-21, revised: `/current` prints no item totals, and prints one line counting its Suspended items; checked: 91 directives, 91 kept, 0 less precise, 0 lost

## History

Until Sat Nov 21 2026 `/current` printed, below its items table under the heading *Other items*, the count of each item state other than Open and Active, as one comma-separated sentence such as `47 Realized, 18 Recorded, 12 Abandoned`, largest first, with Progression and Suspended items counted. The engineer had asked for it in these words: *At the bottom of the table that prints by "/items", print a summary of how many other of the other iten types there are*, *Print these in a comma-separated sentence*, and *Above this line, put the heading: Other items*.

Until Sat Nov 21 2026 a list of progressions numbered its rows 1, 2, 3, as a list of items does, and the progressions `/current` lists took no ordinal.

Until Fri Nov 20 2026 there was no `/contents` command, and no list of content.

Until Fri Nov 20 2026 the heading read *Progressions (feature, experiment, article)*.

Until Fri Nov 20 2026 the progressions `/current` lists sat under a heading the rule did not name, and where none was current the line read *No current progression (feature, experiment, article)*.

Until Fri Nov 20 2026, where no progression was current, `/current` printed *No current feature or experiment.*

Until Fri Nov 20 2026 no command listed the current progressions of every kind but `/current`, and `/progressions` and `/implementations` did not exist.

Until Fri Nov 20 2026 this rule said implementation where it now says progression, in the sense of a feature or an experiment and its record. The progression-replaces-implementation work item settled the change.

Until Wed Nov 18 2026 only the items table `/current` printed took a kind column, and other lists of items took none unless it was asked for.

Until Fri Nov 13 2026 `/current` listed Implementation items beside the implementations that work them.

Until Fri Nov 13 2026 `current` asked for the Open and Active items, and left out an item in Implementation, whose implementation was listed in its place.

Until Fri Nov 13 2026 a bare `/items` listed the current items, which `/items current` now lists, and no command listed every item.

Until Fri Nov 13 2026 there was no `/notes` command, and this rule named no list of notes.

Until Wed Nov 11 2026 `/features` and `/experiments` took no `current`, which `/items` took.

Until Tue Nov 10 2026 the command that lists the current items and implementations was `/items`. The engineer gave that list to `/current`, and made a bare `/items` list the current items alone.

Until Mon Nov 9 2026 a current implementation was Active or Suspended, since an implementation took no Open state.

Until Sat Nov 7 2026 `/items` printed its state counts with no heading. The engineer settled that they sit under the heading *Other items*.

Until Sat Nov 7 2026 `/items` printed its state counts one to a line, as in `45 Realized`. The engineer settled that they print as one comma-separated sentence.

Until Sat Nov 7 2026 `/items` printed nothing about the items whose state is not current.

Until Sat Nov 7 2026 the command that lists the current items and implementations was `/report`. The engineer renamed it `/items`, and dropped the old name.

Until Fri Nov 6 2026 the command that lists the current items and implementations was `/current`. The engineer renamed it `/report`, and dropped the old name.

Until Fri Nov 6 2026 the current items were listed by `/current-items`, and no command listed the current implementations.

Until Fri Nov 6 2026 `/current` took no number, and always listed every current item.

Until Thu Nov 5 2026 its trigger read *When the engineer asks for a list of records*, which was not a safe one.

Until Mon Nov 2 2026 this rule did not say how a list of items is asked for by state, or what `current` asks for.

Until Sun Oct 25 2026 this rule was named a-record-list-is-a-table and titled "A list of records presented on request is a table".

Until Sun Oct 25 2026 the rule opened by saying to render a list of records as a table, and gave rows, the form for a field that runs to a sentence, only in a later section. The engineer settled that the opening and How to apply say which form a printed list takes, and when.

The engineer also settled the same day that a list is not called a table unless it is formatted as columns.

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Tue Oct 27 2026 a list of items took the two SHA columns and no ordinal, and a field that runs to a sentence sent a list to rows even where the engineer asked for a table. The engineer settled that a list of items takes an ordinal and no SHA columns, and that a table asked for is rendered in rows and columns.

Until Tue Oct 27 2026 the example tables showed the handle as the date alone, such as `2026-08-25`, while the text named the full ISO-8601-UTC prefix. An agent copied the example. The engineer settled that the handle is the full prefix, such as `2026-08-25T00-36-18Z`.

Related:

- the a-status-report-prints-a-fixed-whole-project-report rule — whose tables this agrees with
- the file-names rule — the prefix the handle column carries
- the `git` package's a-commits-sha-refers-to-the-work-the-commit-carries rule — what a SHA in those columns refers to when the engineer names one back
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's form, which this does not displace
- the content-is-a-progression-without-the-steps-that-serve-only-code rule — the content kind, which `/contents` and `/content list` list

---

Authored by Scott Bellware on Sun Aug 23 2026 at 00:22:25 PT
Changed by Scott Bellware on Sun Aug 23 2026 at 01:07:00 PT
Changed by Scott Bellware on Mon Aug 24 2026 at 23:04:26 PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 PT
Changed by Scott Bellware on Wed Oct 21 2026 at 09:37:27 PT
Changed by Scott Bellware on Sat Oct 24 2026 at 15:50:21 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:16:48 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:23:26 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:23:46 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 20:12:20 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 20:12:44 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 20:14:47 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 14:42:32 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 13:47:00 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:06:51 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:29:24 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 20:54:53 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 14:41:43 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 13:46:43 PT
Changed by Scott Bellware on Mon Nov 2 2026 at 18:58:44 PT
Changed by Scott Bellware on Thu Nov 5 2026 at 20:41:02 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:17:13 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:33:13 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:31:45 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 20:47:18 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 23:08:55 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 01:04:28 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 01:30:58 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 11:19:47 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 11:55:17 PT
Changed by Scott Bellware on Sun Nov 8 2026 at 22:53:56 PT
Changed by Scott Bellware on Mon Nov 9 2026 at 21:04:16 PT
Changed by Scott Bellware on Mon Nov 9 2026 at 21:33:14 PT
Changed by Scott Bellware on Tue Nov 10 2026 at 22:13:39 PT
Changed by Scott Bellware on Wed Nov 11 2026 at 00:50:34 PT
Changed by Scott Bellware on Fri Nov 13 2026 at 14:56:24 PT
Changed by Scott Bellware on Fri Nov 13 2026 at 15:39:16 PT
Changed by Scott Bellware on Fri Nov 13 2026 at 16:23:43 PT
Changed by Scott Bellware on Fri Nov 13 2026 at 16:59:30 PT
Changed by Scott Bellware on Wed Nov 18 2026 at 22:33:31 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 00:22:43 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 10:25:21 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 10:37:55 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 10:51:26 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 10:55:05 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:20:19 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 14:24:10 PT
Changed by Scott Bellware on Sat Nov 21 2026 at 18:09:30 PT
