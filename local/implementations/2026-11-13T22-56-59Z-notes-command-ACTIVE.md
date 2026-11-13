# Feature — The /notes command

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/# #3", with the item chosen as `2026-11-13T19-02-46Z-notes-lists-the-items-tagged-note`, which reads "`/notes` lists the items tagged `[note]`".

**A `/notes` command lists the items tagged `[note]`.**

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/notes-command`
- **Base:** `9c258b90`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-notes-command`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/notes` lists every note, oldest first, as an ordinal, the handle, and the title, with no state column. `/notes <n>` lists the n most recent. Where no note exists, it prints *No note.*
- The printed-list rule has a section for `/notes`, with its compressed text, and names `/notes` in its trigger.
- The ITEMS help lists `/notes` below `/note`. The command table has a `/notes` row below `/note`, and the command-table rule names that row.
- The new compressed text was checked by a fresh lister and checker: 12 directives, 12 kept.
- The automated suite passed: 58 tests.

## Confirmations

- **2026-11-13** — Participation: Unattended, selected by the engineer with `/#`. The question was not put. No figures were shown.
- **2026-11-13** — Plan: accepted by the engineer.
- **2026-11-13** — Working location: branch and worktree, selected by the agent.
- **2026-11-13** — Forecast: no forecast, selected by the agent.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 2:56:59 PM PT
