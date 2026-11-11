# Feature — The /brief command

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature start #2", with the item chosen as `2026-11-11T20-40-32Z-a-brief-command-asks-for-the-output-in-brief`, which reads "A /brief command asks for the output in brief".

**A `/brief` command asks for the agent's output in brief.** It does what opening a request with *Brief:* does now.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/brief-command`
- **Base:** `1081fcff`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-brief-command`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `/brief <request>` answers the request in brief, and a bare `/brief` gives the previous answer again in brief. The skill sits in the `language` package and loads the answer-is-a-list rule, as `/expand` does.
- The answer-is-a-list rule has an *Answering in brief* section, and its brief explanation names `/brief`. Its compressed text was checked: 29 directives, 28 kept, 1 less precise, 0 lost.
- The LANGUAGE help lists `/brief`. The startup sentence does not, since it names only commands with rows in the command table, and `/expand` is not named there either. The plan said the build would add it, and the work did not.
- The automated suite passed: 46 tests.

## Confirmations

- **2026-11-11** — Working location: branch and worktree, selected by the engineer.
- **2026-11-11** — Participation: Unattended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 90%, Your approval 65%, attended confidence 92%. The warning was shown, and Attended was recommended.
- **2026-11-11** — Forecast: no forecast, selected by the engineer.
- **2026-11-11** — Plan: accepted by the engineer. `/brief` sits in the `language` package beside `/expand`, and a bare `/brief` gives the previous answer again in brief.
- **2026-11-11** — Merge to master: selected by the engineer.

---

Authored by Scott Bellware on Wed Nov 11 2026 at 3:07:58 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 3:09:27 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 3:13:48 PM PT
