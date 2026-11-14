# The path of a written record is the last line printed

- **State:** Done
- **Tags:** [work]

**After the agent writes a record to disk, it prints the record's path and file name as the last line of its reply.** A record is an item, an implementation record, a rule, a log entry, a journal entry, or any other record. The last line is the path alone, so the engineer can copy it with `/copy` or open it in an editor.

**As the engineer stated it:** After any record is written to disk, eg: item, implementation, rule, log, journal, etc, print the written file path and name to the screen. It should be the last line printed so that the user can /copy it to their clipboard, or open it in their editor.

**Implementation:** `2026-11-14T02-50-55Z-written-record-path-last`, the feature that builds it.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 6:37:57 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:50:55 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:52:08 PM PT
