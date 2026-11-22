# The status line shows the current progression and its phase on a second line

- **State:** Realized
- **Tags:** [idea]

**The status line would carry a second line naming the current progression, the feature or experiment under way, and its current phase.** Today the status line is one line: the repository, the branch, and any uncommitted, untracked, or unpushed work. The engineer would see what work is under way, and which step of it, without asking.

**Not yet settled:** which progression is current where more than one is Active or Suspended, what the second line shows where none is current, and how the phase is shown where the progression has no phases.

## Settled

- **2026-11-06** — Where more than one progression is current, the second line shows the one most recently acted upon.
- **2026-11-06** — Where no progression is current, the status line has no second line.
- **2026-11-06** — Where the progression has no phases, the second line shows no phase.
- **2026-11-07** — The progression most recently acted upon is the one whose branch has the latest commit.
- **2026-11-07** — A phase is under way where its branch, the progression's branch, a dot, and the phase's name, exists. Where it is, the second line shows the phase's branch, as `feature/receipt.tax-line`.

## History

As the engineer first stated it: "Idea: The current implementation (and phase) should be displayed on the second line of the status line"

As the engineer stated it, on which progression is shown: "The one that is most recently acted upon"

As the engineer stated it, on what the second line shows when nothing is current: "The second line should not even display"

As the engineer stated it, on how the phase is shown where the progression has no phases: "It should not be displayed"

---

Authored by Scott Bellware on Fri Nov 6 2026 at 13:35:35 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 13:36:51 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 13:37:24 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 13:37:39 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:07:46 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:26:32 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:29:30 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:39:02 PT
