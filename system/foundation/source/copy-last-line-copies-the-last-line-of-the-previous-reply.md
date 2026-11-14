# Copy-last-line copies the last line of the previous reply

**Trigger:** When the engineer types `/copy-last-line`, or asks for the last line of the output to be copied

**`/copy-last-line` copies the last line of the agent's previous reply to the clipboard.** The last line is the last line that is not blank, as it was written, with its markdown left as it is. Where that reply ended with a record's path, as the a-reply-that-writes-a-record-ends-with-the-records-path rule has it, the path is what is copied.

**As the engineer stated it:** Add a "/copy-last-line" command that copies the last line of output to the clipboard

**Copy it with the platform's clipboard command:** `pbcopy` on macOS, and `wl-copy` or `xclip -selection clipboard` on Linux. Copy the line without a trailing newline. Where no clipboard command is found, say so, and print the line so the engineer can copy it by hand.

**Then say what was copied, in one line, with the line itself.** Do not copy anything else, and do not copy the reply that reports the copy.

**Where there is no previous reply, say so, and copy nothing.**

**Why:** Claude Code's `/copy` copies the whole of the last reply. A record's path, or one command, is usually the line the engineer wants, and it sits on the last line by design.

**How to apply:** on `/copy-last-line`, take the last line that is not blank from the previous reply, copy it with the clipboard command without a trailing newline, and report it in one line.

Related:

- the a-reply-that-writes-a-record-ends-with-the-records-path rule — why a record's path is the last line

---

Authored by Scott Bellware on Fri Nov 13 2026 at 6:56:40 PM PT
