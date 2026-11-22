# Location and participation are asked when a progression is started

**State:** Progression

**Tags:** [correction] [work] [rework]

**As the engineer stated it:** Questions about progression location and attendence should only be asked when the progression is started

The working-location question and the attended-or-unattended question are asked when a progression is started, not when it is created Open. Today the rules ask both at creation, as they did for `Progression — Test`, created Open and not started.

## Progression

The implementation `2026-11-22T22-26-16Z-questions-asked-at-start` carries this item's work.

## What the change reaches

1. **The branch.** Creating a progression Open, with `new`, creates its branch today, and where the branch goes depends on the working location. With the question asked at the start, `new` writes the record only, and `start` creates the branch.
2. **The record.** The first record is committed on `master`, and the branch is created from that commit. With no branch until the start, an Open record sits on `master` until the progression starts.
3. **Starting directly.** `start` where no progression is in place creates it and starts it in one step. Both questions are asked there, as today.
4. **Unattended work.** Work started unattended has the agent select the working location, and asks neither question. That does not change.

## Rules it touches

- the a-progression-runs-on-a-branch-to-a-declared-end rule: what `new` creates, the working-location question, and when the branch is created
- the `design-by-efferent` package's attended-or-unattended-is-chosen-when-the-work-is-created rule, which places the question at creation
- the the-progressions-directory-holds-one-record-per-progression rule: what `new` writes

---

Authored by Scott Bellware on Sat Nov 21 2026 at 18:01:04 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:24:34 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 14:26:16 PT
