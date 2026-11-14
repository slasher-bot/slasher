# Feature — The load line is left out when Claude Code is started with /load

**Tags:** [feature]

## Intent

**As the engineer stated it:** "Is it possible to omit the line \"Slasher's rules will load on the first prompt, or enter: /load\" if Claude Code is started from the command line with \"/load\"", then "Start a feature and do this work".

**The session-start message leaves out the load line where Claude Code was started from the command line with `/load` as its prompt. The session-start script finds this by reading the command line of the `claude` process it runs under. Where it cannot find that process, or the prompt is not `/load`, the load line prints as before.**

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/load-line-omitted-when-started-with-load`
- **Base:** `8f140228`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-load-line-omitted-when-started-with-load`, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.

## What happened

- `started-with-load.sh` is new in `foundation`. It reads the command lines of the processes above it, nearest first, and stops at the first that is Claude Code: a word whose last path part is `claude`, or `claude-code/cli.js`. It succeeds where the prompt is `/load` or `/slasher:load` with no `help` after it, or `load rules`.
- `session-start.sh` leaves out the load line where the script succeeds. Where it fails or is missing, the line prints.
- In this session, started as `claude --chrome /load`, the script succeeds, and the session-start message ends with the install line.
- The command line joins the arguments with spaces. A prompt that only mentions `/load` also leaves out the line.
- The startup-display rule and the harness-announces rule say the load line is left out in this case. Their compressed texts are revised and not re-checked.
- The test `test/automated/session-start-started-with-load.sh` runs the session-start script under a stand-in `claude` program, with seven outcomes. It failed before the change and passes after it.
- The automated suite passed: 71 test files.

## Confirmations

- **2026-11-14** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-14** — Participation: Unattended, selected by the engineer. Agent's confidence 72%, risk of redo 28%, It'll work 85%, Your approval 75%, attended confidence 88%. The warning was not shown, and Attended was not recommended.
- **2026-11-14** — Forecast: No forecast, selected by the engineer.
- **2026-11-14** — Plan: accepted by the engineer.
- **2026-11-14** — Merge to master: with no gate, since the work states no forecast.
- **2026-11-14** — Branch deletion and worktree removal: selected by the engineer.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 3:16:58 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 3:17:32 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 3:19:58 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 3:20:55 PM PT
