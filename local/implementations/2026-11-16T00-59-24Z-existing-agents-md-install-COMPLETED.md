# Feature — The installer fails silently where a project already has an AGENTS.md

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature start for #1", with the item chosen as `2026-11-16T00-38-17Z-the-installer-fails-silently-where-a-project-already-has-an-agents-md`.

**Installing Slasher into a project that already has an `AGENTS.md` no longer fails silently.** The problem item names no fix, so this feature settles one.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/existing-agents-md-install`
- **Base:** `e52d2155`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-existing-agents-md-install`, chosen when the feature was created.
- **Participation:** attended, chosen when the feature was created, then unattended from the `/install` skill on, at the engineer's direction.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-16T00-38-17Z-the-installer-fails-silently-where-a-project-already-has-an-agents-md`

## Decisions

- **2026-11-15** — The fix, selected by the engineer after `/idk`: the installer takes an explicit answer for an existing `AGENTS.md`. Without one, and with no terminal, it stops and exits non-zero, naming the choice. `/install` puts the choice to the engineer through the selection interface, then runs the installer again with the answer.

## What happened

- `install.sh` takes `--append-agents-md`, and appends the bootstrap to an existing `AGENTS.md` without asking.
- With no answer and no terminal, `install.sh` places everything else, ends with lines saying `AGENTS.md` was not modified and naming `--append-agents-md`, and exits with status 1.
- `slasher-install` passes `--append-agents-md` on to `install.sh`.
- `/install` asks the engineer whether to append when the installer fails that way, and runs it again with the answer.
- The foundation README and the root README say how an existing `AGENTS.md` is handled.
- An existing `CLAUDE.md` without `@AGENTS.md` is skipped the same way, and is noted in the item, not fixed.
- The automated suite passed: 76 test files.
- Loop record: `2026-11-16T01-03-54Z-existing-agents-md-install`

## Confirmations

- **2026-11-15** — Creation: `/feature start`, with no feature Open, so the feature was created Active.
- **2026-11-15** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-15** — Participation: Attended, selected by the engineer. Agent's confidence 55%, risk of redo 45%, It'll work 80%, Your approval 55%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-15** — Forecast: No forecast, selected by the engineer.
- **2026-11-15** — Participation: changed to Unattended for the rest of the implementation, at the engineer's direction: *Proceed unanttended through the rest of the implementation*. Plan: Accept, selected by the engineer.
- **2026-11-15** — Conclusion: Completed, with the merge to master, by the engineer's `/feature complete`. The work states no forecast.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 4:59:24 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 4:59:24 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 5:02:54 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 5:21:27 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 5:28:08 PM PT
