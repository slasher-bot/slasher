# Progression replaces implementation

**State:** Open

**Tags:** [work]

**As the engineer stated it:** I choose "progression"

**Progression** replaces **implementation** as the name of a bounded piece of work on its own branch, carried to a declared end: a feature, an experiment, or a piece of content. The record that tracks one is a progression record.

## Why the name changes

- An implementation puts a design or a plan into effect. That fits a feature. It fits an experiment, which tests a question, less well, and a piece of content, such as an article or a graphic, poorly.
- The three kinds share a branch, a record that tracks the work to a declared end, and a merge or none. None of that is the implementing of anything.
- A progression is one unit of forward work, and is countable: a progression, progressions. It is not a figure.

## Names that were weighed and not chosen

- **development** — strongly associated with software. *A development* reads as an event, and it brings back the root of *developer*, which the `language` vocabulary replaces with *engineer*.
- **product** — names the output, not the work. A feature is part of a product, and `product generation` in the `versioning` vocabulary means a product line.
- **increment** — already the `language` vocabulary's word for a bounded slice of scope delivered as a step, and already used for the steps inside a migration plan. An abandoned or refuted record delivers no increment.
- **advance**, **increase**, **improvement** — each names a result. `[improvement]` is already an item kind.
- **evolution** — a figure, and *an evolution* reads as a drill movement.
- **undertaking** and **branch work** — fit, and were not chosen.

## What the rename reaches

- The `local/implementations/` directory and its 94 records.
- The foundation rules whose names and text say implementation, among them the-implementations-directory-holds-one-record-per-implementation, an-implementation-runs-on-a-branch-to-a-declared-end, implementation-status-reports-its-phases-its-state-what-exists-and-what-is-left, and a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged.
- The vocabularies, the skills and their help, the command table, and `install.sh`, which names `implementations/`.
- The item state **Implementation**, which an item takes when a feature or an experiment is created for it.
- The idea `2026-11-20T04-43-41Z-implementations-can-be-created-and-started-directly`, and the work item `2026-11-20T06-40-24Z-content-items`, which speak of implementations.
- Slasher projects, which hold an `implementations/` directory of their own.

The rename is a structural change and a change to a term that existing records carry, so it is a migration. Its migration record is written in `local/migration/` before anything is renamed. Historical records keep the word they were written with.

## Settled

**As the engineer stated it:** Yes, answering *whether the directory becomes `local/progressions/`*.

- **2026-11-19** — **The directory `local/implementations/` becomes `local/progressions/`.**

**As the engineer stated it:** I'm not sure. It's either "progression" or "doing". Asked which, the engineer selected *Progression*.

- **2026-11-19** — **The item state Implementation becomes Progression.** An item takes it when a progression is created for it.

**As the engineer stated it:** Yes, answering *whether existing records and Slasher projects change over by being renamed by `install.sh` when a project's packages are refreshed*.

- **2026-11-19** — **`install.sh` makes the change in a Slasher project when its packages are refreshed or Slasher is installed.** What it renames, beyond the directory, is not settled.

**As the engineer stated it:** Yes, answering *whether `install.sh` changes the `Implementation` state line in existing items to `Progression`*.

- **2026-11-19** — **`install.sh` changes the `**State:** Implementation` line in existing items to `**State:** Progression`.**

**As the engineer stated it:** Do the rename first, answering the order of this item and the work item `2026-11-20T06-40-24Z-content-items`.

- **2026-11-19** — **The rename is done before content is built.** The work item `2026-11-20T06-40-24Z-content-items` waits for this item to conclude.

**As the engineer stated it**, answering what else `install.sh` renames besides the directory and the state line:

> install.sh renames this line in records that haven't concluded — Yes
>
> Renaming it to Progression: would make those items match the new state word — Yes
>
> Paths written as implementations/… inside items — Correct it to "progressions"
>
> Loop records, log entries, and the records' own text. These are historical, and they keep the word they were written with — Correct the records to "progressions"

- **2026-11-19** — **`install.sh` renames the `- **Implementation branch:**` line to `- **Progression branch:**` in every record that has not concluded.** The status line script reads that line to find the branch of the work under way.
- **2026-11-19** — **`install.sh` renames the `**Implementation:**` line in items to `**Progression:**`.**
- **2026-11-19** — **`install.sh` corrects each path written as `implementations/…` inside an item to `progressions/…`.**
- **2026-11-19** — **The loop records, the log entries, and the implementation records' own text are corrected to say progression.** This replaces the statement above that historical records keep the word they were written with, which stays as written. It departs from the disclosure-is-the-one-reason-to-edit-a-historical-record rule, which permits an edit to a historical record only for disclosure. Whether `install.sh` makes this correction in a Slasher project, whether the record file names that say implementation are renamed, and whether that rule is amended, are not settled.

**As the engineer stated it**, answering the three questions that resolution left open:

> Does install.sh also make that correction in projects that use Slasher? — Yes
>
> Are file names that contain "implementation" renamed? — Yes
>
> Is the rule amended? — Yes

- **2026-11-19** — **`install.sh` makes the correction to progression in the historical records of every Slasher project.**
- **2026-11-19** — **Record file names that contain implementation are renamed to say progression.**
- **2026-11-19** — **The disclosure-is-the-one-reason-to-edit-a-historical-record rule is amended** to permit this correction. Its wording is not settled.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 11:31:09 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 11:35:25 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 11:38:14 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 11:39:30 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 11:40:18 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 11:42:00 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 11:50:39 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 11:52:42 PM PT
