# Feature — doc-edit is incorporated into the prose package

**Tags:** [feature]

## Intent

**As the engineer stated it:** *Do the Both, option, but use the commend "edit" rather than "walkthrough"*, for the item `2026-11-17T02-07-24Z-doc-edit-is-incorporated-into-the-prose-package`.

**doc-edit's criteria go in one rule that `/review` and `/print-and-review` use, and `/edit` walks a text paragraph by paragraph, then sentence by sentence, by the same rule.**

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/prose-edit`
- **Base:** `f469d59b`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-prose-edit`, chosen when the feature was created.
- **Participation:** unattended, chosen when the feature was created.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-17T02-07-24Z-doc-edit-is-incorporated-into-the-prose-package`

## What happened

- The content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule, in `prose`, names doc-edit's four paragraph criteria and three sentence criteria, and its check on writing that draws the reader's conclusion. Each finding names its criterion, and a clean passage is said to be clean.
- `/review` and `/print-and-review` judge by that rule. A suggestion's reason opens with its criterion, and their skills load the rule.
- The edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence rule and the `/edit` skill walk content by numbered paragraph, with `next`, `previous`, `p<n>`, `sentences`, and `print` as subcommands. Findings give no rewrite. A rewrite asked for becomes a `/review` suggestion, and `/edit` writes nothing itself. doc-edit's `commit` is not carried over.
- `/edit` is in the REVIEW domain, in `/review help` and the `prose` README. It has no row of its own in the command table, since it has no shortcut alias.
- The prose rules have no compressed text, so no check of one was due.
- The automated suite passed: 80 test files.
- The doc-edit skill itself is synced from the engineer's claude.ai account, outside this repository, and is unchanged.

## Confirmations

- **2026-11-16** — Creation: the engineer directed the work, with no feature Open, so the feature was created Active.
- **2026-11-16** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-16** — Participation: Unattended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 85%, Your approval 62%, attended confidence 88%. The warning was shown, and Attended was recommended.
- **2026-11-16** — Forecast: No forecast, selected by the engineer.
- **2026-11-16** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 6:07:24 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 6:10:15 PM PT
