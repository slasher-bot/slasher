# Feature — The /idk command

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/! #4", with the item chosen as `2026-11-13T07-35-48Z-idk-says-i-dont-know-to-the-agent`, which reads "`/idk` says \"I don't know\" to the agent". The engineer later said "resume #4" after an interruption.

**A `/idk` command answers the agent's last question with "I don't know".** The agent then explains the question and its options, gives its recommendation, and puts the question again.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/idk-command`
- **Base:** `63f71484`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-idk-command`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/idk` answers the last question with "I don't know". The agent explains the question and its options, answers any words typed after `/idk`, gives its recommendation, and puts the question again with the recommended option first.
- The foundation rule idk-answers-the-last-question-with-i-dont-know governs it, loaded on demand. It carries no compressed text.
- The PROCESS help lists `/idk` after `/ask-again`. It has no row in the command table, as `/brief` has none, so the startup sentence does not name it.
- The automated suite passed: 49 tests.

## Confirmations

- **2026-11-12** — Participation: Unattended, selected by the engineer with `/!`. The question was not put, since `/unattended` settles it. No figures were shown.
- **2026-11-12** — Plan: accepted by the engineer.
- **2026-11-12** — Working location: branch and worktree, selected by the agent. The main working tree held uncommitted work of the private-session feature, and a worktree keeps it apart.
- **2026-11-12** — Forecast: no forecast, selected by the agent.
- **2026-11-12** — Merge to master: selected by the engineer.
- **2026-11-12** — Branch deletion and worktree removal: selected by the engineer, in the same selection as the merge.

---

Authored by Scott Bellware on Thu Nov 12 2026 at 11:44:03 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:45:10 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:45:41 PM PT
