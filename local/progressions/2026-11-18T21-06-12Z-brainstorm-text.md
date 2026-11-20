# Feature — A brainstorm line takes a single input and then ends

**Tags:** [feature]

## Intent

**As the engineer stated it:** A brainstorm line can take a single input and then end. "/brainstorm" should take a <text> input. When it does, the brainstorm starts and ends around whatever that textual input is.

**`/brainstorm <text>` starts a brainstorm, records the text, and ends it, in one reply,** as `/brainstorm end` ends one. `/brainstorm <kind> <text>` does the same into a new item of that kind.

Realizes the item `2026-11-18T20-51-08Z-a-brainstorm-line-takes-a-single-input-and-then-ends`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** none. The work is built on `master`.
- **Base:** `e62ff034`, from `master`
- **Working location:** the current branch, `master`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/brainstorm <text>` starts a brainstorm, records the text word for word as its one point, and ends it, in one reply. The end writes a `[brainstorm]` item, as `/brainstorm end` does.
- `/brainstorm <kind> <text>` does the same into a new item of that kind. A first word that is a kind or a subcommand keeps that meaning. `start`, `end`, `suspend`, `resume`, and `help` take no text.
- The brainstorming rule, its compressed text, the `/brainstorm` skill, and its help say so. A fresh lister and a fresh checker found 45 directives: 43 kept, 2 less precise, 0 lost. Both less precise directives are in a point this work did not change.
- The work item's open question is settled: a kind keeps its meaning, and the text is the words after it.
- The automated suite passes: 115 tests.

## Confirmations

- **2026-11-18** — Working location: the current branch, selected by the engineer.
- **2026-11-18** — Participation: Unattended, stated by the engineer in the request, "Do #3 unattended". The question was not put, so no figures were shown.
- **2026-11-18** — Forecast: no forecast, selected by the engineer.
- **2026-11-18** — Plan: accepted by the engineer.
- **2026-11-18** — Conclusion: Completed. The work has no forecast and is built on the current branch, so it concludes Completed when its plan is done.

---

Authored by Scott Bellware on Wed Nov 18 2026 at 1:06:12 PM PT
Changed by Scott Bellware on Wed Nov 18 2026 at 1:08:48 PM PT
