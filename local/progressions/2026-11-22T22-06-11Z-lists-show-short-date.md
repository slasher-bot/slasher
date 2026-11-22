# Implementation — Lists show a short form of the date

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Do #2 unattended, with #2 the work item `2026-11-22T02-02-49Z-lists-show-a-short-form-of-the-date`

**A printed list of records shows each record's date as the short date, in local time, in place of its file name prefix.** The work item states the decisions and the tasks.

Realizes the work item `2026-11-22T02-02-49Z-lists-show-a-short-form-of-the-date`.

## State

- **State:** Active

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/lists-show-short-date`
- **Base:** the commit on `master` that holds this record as first written
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

## Confirmations

- **2026-11-22** — Creation: started unattended, as the engineer asked. The agent selected the working location, a branch and a worktree, so the work stays off `master` until the engineer selects the merge.
- **2026-11-22** — Participation: unattended, as the engineer asked.
- **2026-11-22** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Sun Nov 22 2026 at 14:06:11 PT
