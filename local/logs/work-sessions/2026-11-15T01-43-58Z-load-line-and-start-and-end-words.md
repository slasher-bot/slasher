# Work Session — The load line, and the words for starting and ending work

This work session started with a question about whether the agent can tell how Claude Code was started. It became a small feature that leaves the load line out of the startup display when Claude Code is started with `/load`. It then became a larger feature that harmonized the words Slasher uses for starting and ending work, settled one decision at a time against an analysis. It ended with both features Completed and merged to `master`.

This is the communicable record of the work session, a guided tour. The rules, items, progression records, migration record, and log entries it points to are the source of truth.

## 1. Can the agent tell how Claude Code was started?

The engineer asked whether the agent can know that Claude Code was started from the command line with a command to execute. The conversation gives no sign of it. The agent's shell is a child of the `claude` process, so the process's command line shows it: this session showed `claude --chrome /load`.

## 2. The load line is left out when Claude Code is started with `/load`

The engineer asked whether the load line, *Slasher's rules will load on the first prompt, or enter: /load*, could be left out in that case, and then asked for a feature. It ran unattended in a worktree, with no forecast. `started-with-load.sh` reads the command lines of the processes above the session-start hook and finds the Claude Code process. Where its prompt is `/load`, `/slasher:load`, or `load rules`, `session-start.sh` leaves the load line out. A test runs the script under a stand-in `claude` program.

- Progression record: `2026-11-14T23-16-58Z-load-line-omitted-when-started-with-load`
- Rules changed: the-startup-display-prints-as-the-session-starts, the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice

## 3. The analysis of starting and ending words

The engineer started a feature for the work item on harmonizing *begin*, *start*, *end*, *conclude*, and asked for an analysis. It found ten inconsistencies, such as *start* naming both creating a progression and starting its work, three names for finished work (Done, Completed, Realized), and *finish* and *close* beside *conclude* and *end*. The engineer asked for it as a table by kind of record.

## 4. The decisions, one at a time

Each decision is a dated Settled resolution in the work item, with a log entry:

- *Start* and *end* are the standard words. *Begin* is dropped, so `/brainstorm begin` became `/brainstorm start`.
- *Conclude* stays the word for reaching a final state. *End* is the plain verb.
- A work item and a rework item conclude Completed, not Done. `/done` is removed.
- Existing Done items are conformed, in this project and by the installer in installed projects.
- `new` creates a feature or an experiment Open. Where none is Open, `start` creates one Active. The engineer first settled `start` with no `new` and no Open state, then reversed it.
- The opening questions of a progression are asked when it is created, not *at the start*. The attended rule was renamed to say so.
- `/phase new` replaces `/phase add`, and `/phase status` prints what `/feature status` prints.
- `/brainstorm` keeps `start`, which creates and starts a brainstorm.
- A work session *ends*, where the rule said it closes.
- *Conclude* replaces *finish*.
- The kinds that start Recorded stay as they are.

- Work item: `2026-11-14T20-44-27Z-begin-start-end-and-conclude-are-harmonized`
- Progression record: `2026-11-14T23-32-59Z-begin-start-end-conclude-harmonized`
- Migration record: `2026-11-15T00-02-23Z-done-items-become-completed`

## Takeaways

- The agent can read how Claude Code was started from its process's command line, and nowhere else.
- Slasher's words for starting and ending work are *start*, *end*, and *conclude*. *Begin*, *finish*, and *close* are not used for them.
- `new` creates a record and `start` starts its work. `start` creates and starts where nothing is in place.
- Work items, rework items, features, and experiments without a verdict all conclude Completed.

## Glossary

- **load line** — the last line of the session-start message, which says the rules load on the first prompt or with `/load`.
- **conclude** — reach a final state, such as Completed or Realized.
- **end** — the plain verb for stopping, as in `/brainstorm end`, and what a work session does.

## Where the durable records live

- `local/progressions/`: the two progression records named above.
- `local/items/`: the begin, start, end, conclude work item.
- `local/migration/`: the Done-to-Completed migration record.
- `local/logs/log/`: an entry for each settled resolution and each change of state.
- `system/foundation/started-with-load.sh`, `system/foundation/install.sh`, and the rules each record names.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 17:43:58 PT
