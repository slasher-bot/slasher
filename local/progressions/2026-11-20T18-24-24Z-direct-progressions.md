# Feature — Progressions are created and started directly

**Tags:** [feature]

## Intent

**As the engineer stated it:** Start an unattended feature for #1, with #1 the idea `2026-11-20T04-43-41Z-progressions-are-created-and-started-directly`. The idea reads: *Implementations can be created and started directly, not just features and experiments.*

**A progression can be created and started directly, with no kind.** `/progression` creates one titled `Progression — <name>`, and `/implementation` creates one titled `Implementation — <name>`. `/progressions`, and its alias `/implementations`, list the current progressions of every kind.

Realizes the idea `2026-11-20T04-43-41Z-progressions-are-created-and-started-directly`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/direct-progressions`
- **Base:** `c0cf73a6`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-direct-progressions`
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T04-43-41Z-progressions-are-created-and-started-directly`

## Plan, as accepted on 2026-11-20

1. Write the feature record and its log entry on master. Make the idea Progression, with its log entry. Commit them.
2. Create the branch feature/worktree/direct-progressions in a worktree at ../slasher-feature-worktree-direct-progressions.
3. Add the /progression command. It takes the subcommands /feature takes, and creates or changes a progression with no kind.
4. A progression that /progression creates is titled "Progression — <name>", tagged [progression], on a branch named progression/<subject>. Its lifecycle is a feature's.
5. Add /implementation, which does what /progression does. A progression it creates is titled "Implementation — <name>", tagged [implementation], on a branch named implementation/<subject>.
6. Add the /progressions command. It lists the current progressions of every kind, as /features lists the features. /implementations is its alias.
7. Write the commands' help and their rows of the command table.
8. Change the progression rules to name these two records beside a feature and an experiment.
9. Check the compressed text of each rule whose meaning changed, and repair it.
10. Write the loop record where code changes. Compile the source, and run the suite.
11. Commit the change on the branch.

## What happened

- `/progression` creates or changes a progression with no kind, titled `Progression — <name>`, tagged `[progression]`, on a `progression/<subject>` branch. It takes the subcommands `/feature` takes.
- `/implementation` does what `/progression` does, and titles the progression it creates `Implementation — <name>`, tagged `[implementation]`, on an `implementation/<subject>` branch.
- `/progressions`, and its alias `/implementations`, lists the current progressions of every kind, with the number and `current` that `/features` takes, and the counts under *Other progressions*.
- The PROGRESSIONS help and its two rows of the command table, after `/experiment` in the help order.
- Four rules name the new records: the progressions-directory rule, the branch rule, the printed-list rule, and the command-row rule. The compressed texts of the first three were checked: the directory rule kept all 126 directives at once, the branch rule kept all 163 after one repair, and the printed-list rule keeps 107 of 108 after three repairs, the one left being a reason.
- No code changed, so there is no loop record.
- The automated suite passes: 137 tests.

## Confirmations

- **2026-11-20** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-20** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-20** — Forecast: No forecast, selected by the engineer.
- **2026-11-20** — Commands: /progression and /progressions, with /implementation and /implementations as aliases, selected by the engineer. /implementation titles its record `Implementation — <name>`, as the engineer directed.
- **2026-11-20** — Plan: Accept, selected by the engineer, after two revisions.
- **2026-11-20** — Conclusion: Completed, requested by the engineer with `/feature complete`. `master` was fast-forwarded to the branch, which held every commit on `master`.
- **2026-11-20** — Branch deletion and worktree removal: Delete the branch and worktree, selected by the engineer. The branch was never pushed.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 10:24:24 AM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 10:30:32 AM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 10:43:37 AM PT
