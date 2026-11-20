# Feature — /print prints the last record

**Tags:** [feature]

## Intent

**As the engineer stated it:** Do #2 with the same reasoning as the "/open" command. Do it unattended. #2 is the item `2026-11-19T17-17-58Z-print-prints-the-last-record`.

**A bare `/print` prints the more recent of the most recent principal record and the last text the agent generated that the engineer is working on.** `/print <record>` prints the record the words name, as `/open <record>` names one.

Realizes the item `2026-11-19T17-17-58Z-print-prints-the-last-record`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/print-the-last-record`
- **Base:** the commit on `master` holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-print-the-last-record`
- **Participation:** unattended.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-19T17-17-58Z-print-prints-the-last-record`

## Confirmations

- **2026-11-19** — Participation: Unattended, stated by the engineer: *Do it unattended*. The question was not put, so no figures were shown.
- **2026-11-19** — Working location: branch and worktree, selected by the agent, as the `/open` feature was worked.
- **2026-11-19** — Forecast: No forecast, selected by the agent. The work adds a command, and states no claim to test.
- **2026-11-19** — Plan: Accept, selected by the engineer. The plan selected the commit of this record on `master`, and put the merge to `master` to the engineer.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 5:14:23 PM PT
