# Convert consuming projects to project entries that replace the lists

**State:** Realized

**Tags:** [idea]

Convert consuming projects to project entries that replace the lists.

## Settled

- **2026-11-16** — `list-projects.sh` refuses a registry that still has an `included` or `excluded` list, naming the line and saying that each project is now a `[[project]]` entry. Selected by the engineer.
- **2026-11-16** — Where a `[[project]]` entry's path is not a Slasher project, `list-projects.sh` prints the other projects and says on standard error which path it is. Selected by the engineer.

## What happened

- The work ran unattended, by a plan the engineer accepted. The engineer selected Unattended at the participation question: agent's confidence 75%, risk of redo 25%, It'll work 88%, Your approval 78%, attended confidence 92%.
- `list-projects.sh` lists the path of each `[[project]]` entry that is a Slasher project. It refuses an `included` or `excluded` list, naming the line, and reports and skips an entry whose path is not a Slasher project.
- The tests are `test/automated/list-projects/`: `entries.sh`, `old-list.sh`, and `not-a-project.sh`. The `resolve-project` tests build their registries from entries.
- The engineer's `~/.config/slasher/projects.toml` holds one entry for each project the lists found, and lists the same projects.
- The automated suite passed: 78 test files.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 11:20:02 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:07:29 AM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:08:49 AM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:15:09 AM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 12:20:55 PM PT
