# Feature — Ask the verdict question after an implementation completes

**Tags:** [feature]

## Intent

**As the engineer stated it:** "Start #2", where #2 is the item `2026-11-09T04-44-20Z-ask-the-verdict-question-after-an-implementation-completes`.

**The verdict question is asked when an implementation's work is complete, not at its start.** The engineer settled before the work began:

- A forecast is stated at the start only where the engineer gives one. Without one, the end offers no verdict.
- Building on the current branch is still offered. Work built there concludes Completed, and the end does not ask the verdict question.

The work changes rules and skills and no script, so it is content work, and runs through no hinges, per the local design-by-efferent-does-not-govern-content-work rule.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/verdict-question-at-the-end`
- **Base:** `1a106d77`, from `master`
- **Working location:** branch only, chosen at the start.
- **Participation:** none asked. The work is content work.
- **Verdict:** it concludes without an engineer's verdict, selected at the start, as the rules still asked it there.

## Confirmations

- **2026-11-08** — The working location is branch only, selected by the engineer at the start.
- **2026-11-08** — The feature concludes without an engineer's verdict, selected by the engineer at the start.
- **2026-11-08** — No participation was asked. The work is content work, which the local rule keeps out of the hinges.

- **2026-11-08** — The feature is Completed and merges into `master`, selected by the engineer. The item is Realized, selected by the engineer.

## Outcome

The start asks whether the work states a forecast, *No forecast* first, and the end asks the verdict question of work with a forecast only. The current branch rules out both. Phases follow the same rules, asked when added and when complete. A simulated feature in a scratch repository exercised the path with a forecast and no verdict. Along the way the Attended option came to label its figure *Confidence:*. The automated suite is verified: 25 tests.

---

Authored by Scott Bellware on Sun Nov 8 2026 at 9:33:37 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:52:21 PM PT
