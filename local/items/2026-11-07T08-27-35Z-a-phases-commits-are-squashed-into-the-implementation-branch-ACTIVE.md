# A phase's commits are squashed into the implementation branch

- **State:** Active
- **Tags:** [idea]

**When a phase concludes, its commits would be squashed into one commit on the implementation branch, rather than merged with their history.** Today a phase merges back into the implementation's branch, as the an-implementation-runs-on-a-branch-to-a-declared-end rule says, and every commit of the phase arrives with it.

**Not yet settled:** what the squashed commit's message says, whether the phase's branch is kept after the squash, and whether a refuted or inconclusive phase, which does not merge, is affected at all.

## Settled

- **2026-11-08** — The squashed commit's subject summarizes what the phase built, under the commit-message rules, and its body lists the phase's own commit subjects.
- **2026-11-08** — The phase's branch is kept until the implementation concludes, and is deleted with the implementation's branch.
- **2026-11-08** — A refuted or inconclusive phase does not merge, so the squash does not affect it.
- **2026-11-08, later** — The squash happens when the implementation concludes, not when each phase does. While the work runs, a phase merges with its history. At the conclusion the implementation's branch is rebuilt with one squashed commit per phase, and force-pushed where it was pushed.
- **2026-11-08, later still** — A test run by a fresh agent found gaps, and the engineer closed them: a phase merges with `--no-ff`, the record names the commit each phase branched from, a squashed phase's branch is deleted with `-D` and the remote implementation branch with it, a commit outside a phase keeps its content and message but not its SHA, and the force-push uses `--force-with-lease`.
- **2026-11-08, latest** — A second test run found more gaps, and the engineer closed three: the rebuild drops each phase's `--no-ff` merge commit, the squashed commit's body lists the subjects one to a line after a dash, and the remote implementation branch is deleted only after the upstream branch holding the work has been pushed.

## History

As the engineer first stated it: "THe commits in phases are squash commited to the implementation branch"

---

Authored by Scott Bellware on Sat Nov 7 2026 at 12:27:35 AM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:41:28 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:42:55 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:50:01 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:59:52 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:04:01 PM PT
