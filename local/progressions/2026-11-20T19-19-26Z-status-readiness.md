# Feature — /status says whether the record is ready to conclude

**Tags:** [feature]

## Intent

**As the engineer stated it:** Do #2 unattended, with #2 the work item `2026-11-20T19-08-51Z-status-says-whether-the-record-is-ready-to-conclude`, which reads: *"/status" invoked on either an item or a progression includes in the output whether it's ready to be concluded*.

**The status report of an item or a progression ends with whether the record is ready to conclude**, and where it is not, what stands in the way.

Realizes the work item `2026-11-20T19-08-51Z-status-says-whether-the-record-is-ready-to-conclude`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Working location:** the current branch, `master`. No branch is created, and there is nothing to merge.
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T19-08-51Z-status-says-whether-the-record-is-ready-to-conclude`

## Plan, as accepted on 2026-11-20

1. Write the feature record and its log entry on master. Make the work item Progression, with its log entry. Commit them.
2. Create the branch at the selected location.
3. Add a last line to the item status report: Ready to conclude, yes or no. Where no, name what stands in the way.
4. An item is ready to conclude when everything it asks for exists and no decision it needs is open.
5. Add the same line to the progression status report. A progression is ready to conclude when its plan is done, its work is committed, the automated suite passes, and its branch merges without a conflict.
6. State in the /status rule that its report carries the line, for an item and for a progression.
7. The line reports and offers nothing. It does not conclude the record or ask whether to.
8. Check the compressed text of each changed rule, and repair it.
9. Compile the source, and run the suite.
10. Commit the change on the branch.

## What happened

- The item status report and the progression status report end with *Ready to conclude*, yes or no, and name what stands in the way where no.
- An item is ready when everything it asks for exists and no decision it needs is open. A progression is ready when its plan is done, its work is committed, the automated suite passes, and its branch merges without a conflict. A progression on the current branch has nothing to merge.
- For work with a forecast, the line reports these facts only, so it does not raise the end of that work, which the a-progression-runs-on-a-branch-to-a-declared-end rule reserves to the engineer.
- The `/status` rule says its report carries the line for both kinds. The line states a fact, and is not an offer to conclude.
- None of the three rules has a compressed text, so step 8 checked nothing. Step 2 created nothing, since the work is on the current branch.
- The automated suite passes: 137 tests.

## Confirmations

- **2026-11-20** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-20** — Working location: The current branch, selected by the engineer. Step 2 of the plan creates nothing.
- **2026-11-20** — Forecast: No forecast, selected by the engineer.
- **2026-11-20** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 11:19:26 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 11:20:42 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 11:43:56 PT
