# Feature — The /reprint-and-review command

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/! #2", with the item chosen as `2026-11-13T19-44-17Z-a-reprint-and-review-command-with-the-shortcut-rr`.

**`/reprint-and-review`, with the shortcut `/rr`, prints the draft as it now stands, then a review of it.**

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/reprint-and-review`
- **Base:** `1ec4304e`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-reprint-and-review`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/reprint-and-review` and `/rr` print the draft whole and unchanged, then a numbered review: each finding quotes its passage, says what is wrong, and suggests a change. `/rr <file>` reviews a file. The command changes nothing.
- The `language` rule reprint-and-review-prints-the-draft-and-a-review-of-it governs it, loaded on demand.
- The LANGUAGE help lists both. The command table has a `/reprint-and-review, /rr` row after `/language`, the shortcuts table a `/rr` row, and the command-table rule names the row.
- The automated suite passed: 58 tests.

## Confirmations

- **2026-11-13** — Participation: Unattended, selected by the engineer with `/!`. The question was not put. No figures were shown.
- **2026-11-13** — Plan: accepted by the engineer.
- **2026-11-13** — Working location: branch and worktree, selected by the agent.
- **2026-11-13** — Forecast: no forecast, selected by the agent.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 4:16:56 PM PT
