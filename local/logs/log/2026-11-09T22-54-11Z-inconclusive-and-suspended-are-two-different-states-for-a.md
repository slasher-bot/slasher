# "Inconclusive" and "Suspended" are two different states for a feature. Inconclusive ends the feature for good and does not merge. Suspended pauses it so it can resume. The feature's branch so far holds only the six research log entries. How should "Publish to marketplace" be set aside? — Suspended, research merged (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> "Inconclusive" and "Suspended" are two different states for a feature. Inconclusive ends the feature for good and does not merge. Suspended pauses it so it can resume. The feature's branch so far holds only the six research log entries. How should "Publish to marketplace" be set aside?

The options:

- **Suspended, research merged (Recommended)** — State Suspended, so it can resume. Merge the branch's six log entries into master. The record notes the research reached no conclusion yet. The branch and worktree are kept, and the item becomes Suspended.
- **Inconclusive, research merged** — State Inconclusive, which ends the feature and cannot be taken back. The log entries are merged to master anyway, against the rule that inconclusive work does not merge. Returning later means starting a new feature.

The engineer's answer: **Suspended, research merged (Recommended)**
