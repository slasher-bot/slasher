# Feature — The /content command

**Tags:** [feature]

## Intent

**As the engineer stated it:** Start an unattended feature for #1, with #1 the work item `2026-11-20T06-40-24Z-content-items`.

**A `/content` command runs a piece of writing on its own branch to a declared end**, as `/feature` runs code, without the steps that serve only code. The work item settles its design.

Realizes the work item `2026-11-20T06-40-24Z-content-items`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Progression branch:** `feature/worktree/content-command`
- **Working location:** a branch and a worktree, at `../slasher-feature-worktree-content-command`. The main working tree stays on `master`.
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-20T06-40-24Z-content-items`

## Plan, as accepted on 2026-11-20

1. Write the feature record Active and its log entry. Make the work item Progression, with its log entry. Commit them on master, on the engineer's selection.
2. Create the branch feature/worktree/content-command in a new worktree at ../slasher-feature-worktree-content-command.
3. Add the content kind to the progressions rule. Its record is titled "Content — <name>" and tagged [content]. Its branch is content/<subject>.
4. State in the progression rules that content has no five hinges, no loop record, no participation question, no forecast, and no verdict.
5. State that /content complete offers a review. Where the writer takes it, ask which kind: critique, suggest, or line edit. The merge waits until each suggestion is settled, unless the writer leaves the review.
6. Write the /content skill. Copy the /feature skill. Its subcommands are new, start, complete, defer, suspend, discontinue, obsolete, supersede, abandon, resume, status, list, and help.
7. Write the /content help and its command table row. Put CONTENT after EXPERIMENTS in the help order.
8. Write the /contents skill. State /contents and /content list in the rule for printed lists.
9. Make the root state commands, such as /start, /complete, and /defer, act on content too.
10. Make /status report on content as it reports on a feature.
11. Widen the commit-message rule. Its subject is the thing that changed, not only the software.
12. Check the compressed text of each changed rule, and repair it.
13. Compile the source, and run the suite.
14. Commit the change on the branch.

## Confirmations

- **2026-11-20** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-20** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-20** — Forecast: No forecast, selected by the engineer.
- **2026-11-20** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 12:17:39 PM PT
