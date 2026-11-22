# Implementation — Lists show a short form of the date

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Do #2 unattended, with #2 the work item `2026-11-22T02-02-49Z-lists-show-a-short-form-of-the-date`

**A printed list of records shows each record's date as the short date, in local time, in place of its file name prefix.** The work item states the decisions and the tasks.

Realizes the work item `2026-11-22T02-02-49Z-lists-show-a-short-form-of-the-date`.

## State

- **State:** Completed

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/lists-show-short-date`
- **Base:** `130e228c`, from `master`, the commit holding this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-lists-show-short-date`. The main working tree stays on `master`.
- **Participation:** unattended, as the engineer asked.
- **Forecast:** none given.
- **Item:** `2026-11-22T02-02-49Z-lists-show-a-short-form-of-the-date`

## Plan, as accepted on 2026-11-22

1. Start an unattended implementation for #2 on a branch and a worktree. Write its record Active, make the item Progression, and log both, committed on `master` on the engineer's selection.
2. In the printed-list rule, make the first column of a list of records its short date, in local time. The list shows no file name prefix.
3. Keep the short SHA as the first column of a list of commits.
4. Show the short date in the rule's example tables.
5. Say that `format-datetime.sh` prints the short date, and that the agent never works it out.
6. Reconcile the rules that say a printed list gives a record's prefix: the `/open` rule's Related line.
7. Check the rule's compressed text with two fresh agents, and record the figures.
8. Write no test. No script changes.
9. Compile, run the automated suite, and commit on the branch.
10. The merge to `master` and the conclusion wait for the engineer.

## What happened

- The printed-list rule says the first column of a list of records is its short date in local time, as `Sat Nov 21`, printed by `format-datetime.sh`. A list shows no file name prefix. A list of commits keeps the short SHA. The example tables show the short date.
- The agent replaced the word *handle* throughout the rule with what the column now holds: the date, or, for a record's recency and order, its file name prefix.
- The `/open` and `/print` rules and the RECORD help name a record's file name prefix rather than its handle, since no list shows a handle now.
- The compressed text was checked against the body by two fresh agents: 86 directives, 84 kept, 1 less precise, 1 lost. One repair. The re-check: 86 directives, 86 kept.
- No test was written. No script changed.
- The automated suite passed: 152 test files.

## Confirmations

- **2026-11-22** — Creation: started unattended, as the engineer asked. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-22** — Participation: unattended, as the engineer asked.
- **2026-11-22** — Plan: Accept, selected by the engineer.
- **2026-11-22** — Conclusion: Completed, selected by the engineer. The work has no forecast, so no verdict question was asked.

---

Authored by Scott Bellware on Sun Nov 22 2026 at 14:06:11 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:10:36 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:13:57 PT
