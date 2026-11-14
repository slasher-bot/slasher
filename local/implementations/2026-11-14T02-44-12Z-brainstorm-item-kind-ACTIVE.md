# Feature — The brainstorm item kind

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/! #4", with the item chosen as `2026-11-14T02-39-23Z-a-brainstorm-begun-with-no-kind-is-a-brainstorm-item`, which reads "A brainstorm that isn't initiated with an item kind is given the Brainstorm kind. A brainstorm record like this has an initial state of recorded and concludes recorded".

**A brainstorm begun with no kind ends as an item of the kind brainstorm, tagged `[brainstorm]`, which starts Recorded and stays Recorded.**

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/brainstorm-item-kind`
- **Base:** `09a6a5fa`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-brainstorm-item-kind`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `[brainstorm]` is an item kind that starts Recorded and stays Recorded.
- A brainstorm begun with no kind ends by writing its reframed points to a new `[brainstorm]` item, and asks nothing about where they go. A brainstorm begun with a kind still writes that kind.
- The brainstorm rule and the items rule say so, each with a History line. The BRAINSTORMING and ITEMS help match.
- One fresh agent listed the directives before reading the compressed text, then checked them: 17 directives, 13 kept, 3 less precise, 1 lost, then 3 repairs. The brainstorming rule's stale Related entry for the end's question is removed.
- The automated suite passed: 58 tests.

## Confirmations

- **2026-11-13** — Participation: Unattended, selected by the engineer with `/!`. The question was not put. No figures were shown.
- **2026-11-13** — Plan: accepted by the engineer, including this record's commit on `master`.
- **2026-11-13** — Working location: branch and worktree, selected by the agent.
- **2026-11-13** — Forecast: no forecast, selected by the agent.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 6:44:12 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:45:19 PM PT
