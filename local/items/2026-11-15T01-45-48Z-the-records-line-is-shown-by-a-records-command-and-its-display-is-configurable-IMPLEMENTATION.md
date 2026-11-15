# The records line is shown by a /records command, and its display is configurable

- **State:** Implementation
- **Tags:** [idea]

**The records line, the *Recorded in:* list of the records a reply has written, is shown by a `/records` command, whose base command is `/records show`. How the records line is displayed is configurable, and can vary.**

**As the engineer stated it:**

- Configurable, variable display of records recorded
- "/records" command. It shows the records line. The base command is "/records show"
- Merge #6 and #7

It supersedes `2026-11-15T00-45-53Z-configurable-variable-display-of-records-recorded` and `2026-11-15T01-38-34Z-a-records-command-shows-the-records-line`.

## Settled

- **2026-11-15** — `/records show` prints the records line of the previous reply: the full path of each record it wrote, as its *Recorded in:* list gives them. Selected by the engineer.
- **2026-11-15** — The records line's display is not configurable. The configuring part of the idea is dropped. **As the engineer stated it:** "Discontinue the configure subcommand"

**Implementation:** `2026-11-15T03-38-40Z-records-command`

---

Authored by Scott Bellware on Sat Nov 14 2026 at 5:45:48 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 7:38:40 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 7:45:04 PM PT
