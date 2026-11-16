# Feature — A pros and cons command for the last question

**Tags:** [feature]

## Intent

**As the engineer stated it:** "Start #4", with the item chosen as `2026-11-16T06-03-02Z-a-pros-and-cons-command-for-the-last-question`.

**A command gives the pros and cons of each option of the last question, and pairs with `/ask-again`.** `/idk` and `/clarify` are removed, and `/??` becomes the new command's alias, as the item says.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/pros-and-cons-command`
- **Base:** `f76e42ea`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-pros-and-cons-command`, chosen when the feature was created.
- **Participation:** unattended, chosen when the feature was created.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-16T06-03-02Z-a-pros-and-cons-command-for-the-last-question`

## What happened

- The pros-and-cons-gives-each-option-of-the-last-question-with-its-pros-and-cons rule, in `foundation`, is on demand. It leads with the trade between the options, then gives each option's pros and cons as lists of facts, and puts nothing again.
- `/pros-and-cons` and its alias `/??` are in the PROCESS domain, with a help entry, a row of the command table placed where `/clarify` and `/idk` were, and a row of the shortcuts table beside `/aa`.
- `/idk` and `/clarify` are removed, with their skills, rows, and rules. The process and language helps, the help order, and the command-domain rule are reconciled. Rule History sections that name them stay as written.
- The automated suite passed: 80 test files.

## Confirmations

- **2026-11-16** — Creation: the engineer selected a feature for the item, with no feature Open, so the feature was created Active.
- **2026-11-16** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 63%, risk of redo 37%, It'll work 85%, Your approval 65%, attended confidence 88%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: No forecast, selected by the engineer.
- **2026-11-16** — Plan: Accept, selected by the engineer.
- **2026-11-16** — Conclusion: Completed, with the merge to master, selected by the engineer. The work states no forecast.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 3:09:55 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 3:12:30 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 3:13:15 PM PT
