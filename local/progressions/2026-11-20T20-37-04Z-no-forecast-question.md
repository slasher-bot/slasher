# Feature — No forecast question at the start of a progression

**Tags:** [feature]

## Intent

**As the engineer stated it:** Start #1 as an unattended feature, with #1 the idea `2026-11-20T19-31-16Z-remove-the-forecast-question-from-progression-start`, which reads: *Remove the forecast question from progression start*. And, revising the plan: *Remove the forecast question from the phase as well*.

**A progression and a phase are not asked whether they state a forecast.** A forecast is stated only where the engineer gives one without being asked.

Realizes the idea `2026-11-20T19-31-16Z-remove-the-forecast-question-from-progression-start`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/no-forecast-question`
- **Base:** `d0451873`, from `master`
- **Working location:** branch only. This working tree switches to the branch, and back at the conclusion.
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T19-31-16Z-remove-the-forecast-question-from-progression-start`

## Plan, as accepted on 2026-11-20

1. Write the feature record Active and its log entry. Make the idea Progression, with its log entry. Commit them on master, on the engineer's selection.
2. Create the branch feature/no-forecast-question, and switch this working tree to it.
3. Remove the forecast question from the start of every progression. It is not asked, and it is not recorded as a confirmation.
4. Remove the forecast question from /phase new too. A phase is not asked whether it states a forecast.
5. A progression or a phase states a forecast only where the engineer gives one without being asked. The record carries it where one is given.
6. Keep the verdict question at the end, for work or a phase with a forecast.
7. Change the unattended rule. An unattended feature chooses only its working location.
8. Conform the progression rules, the phase rule, the skills, and their help to the change.
9. Check the compressed text of each changed rule, and repair it.
10. Compile the source, and run the suite.
11. Commit the change on the branch.

## What happened

- A progression is not asked whether it states a forecast when it is created, and the forecast selection is no longer one of its confirmations.
- `/phase new` asks no forecast question either.
- A progression or a phase states a forecast only where the engineer gives one without being asked, and the record carries it. The verdict question at the end stays, for work with a forecast.
- An unattended feature chooses only its working location, and states no forecast unless the engineer gave one in the request.
- The two progression rules, the unattended rule, the phase skill, and the feature and phase help are conformed.
- The compressed texts of the three changed rules are checked. One repair was made: the unattended rule's compressed text says a revised plan follows the engineer's direction.
- The automated suite passes: 137 tests.

## Confirmations

- **2026-11-20** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-20** — Working location: Branch only, selected by the engineer.
- **2026-11-20** — Forecast: No forecast, selected by the engineer.
- **2026-11-20** — Plan: Revise, selected by the engineer, who asked that the phase's forecast question be removed as well.
- **2026-11-20** — Plan: Accept, selected by the engineer.
- **2026-11-20** — Merge into master: Merge, selected by the engineer.
- **2026-11-20** — Branch deletion: Delete, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 12:37:04 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:40:47 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:44:25 PT
