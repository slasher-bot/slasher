# Copy-record copies the previous reply's principal record path

**Trigger:** When the engineer types `/copy-record`, or asks for the path of the record just written to be copied

**`/copy-record` copies the path of the previous reply's principal record to the clipboard.** The principal record is the record that reply's operation was about, the one its records line gives, as the a-reply-that-writes-a-record-ends-with-the-records-path rule has it. The path copied is the full, absolute path of the file as it now stands, though the records line prints it from the project root. It is copied with no dash and no backticks.

**As the engineer stated it:** Add a "/copy-last-line" command that copies the last line of output to the clipboard

**As the engineer later stated it:** Give the "/copy-last-line" command the alias "/cll"

**As the engineer later stated it:** Proceed with both of those changes, of a record's path written in backticks, and copied without them

**As the engineer later stated it:** Change "/copy-last-line" to "/copy-record". Remove the "/cll" command.

**Copy it with the platform's clipboard command:** `pbcopy` on macOS, and `wl-copy` or `xclip -selection clipboard` on Linux. Copy the path without a trailing newline. Where no clipboard command is found, say so, and print the path so the engineer can copy it by hand.

**Where the previous reply had more than one principal record, ask which to copy**, through the selection interface, each path an option.

**Then say what was copied, in one line, with the path itself.** Copy nothing else.

**Where the previous reply wrote no record, or had no principal record, say so, and copy nothing.** Where there is no previous reply, say so too.

**Why:** the engineer often wants to open the record just written, or to pass its path on. Claude Code's `/copy` copies the whole of the last reply, and the record's path is the one line wanted.

**How to apply:** on `/copy-record`, take the previous reply's principal record, copy its bare path with the clipboard command without a trailing newline, and report it in one line.

## History

Until Sun Nov 15 2026 the path was copied with `~/` in place of the home folder.

Until Sun Nov 15 2026 this rule was named copy-last-line-copies-the-last-line-of-the-previous-reply. Its command was `/copy-last-line`, with the shortcut alias `/cll`, and it copied the last line of the previous reply that was not blank.

Until Fri Nov 13 2026 only a line wholly in backticks was copied without them, and a list item was copied with its dash.

Until Fri Nov 13 2026 a line wholly in backticks was copied with its backticks.

Until Fri Nov 13 2026 `/copy-last-line` had no shortcut alias.

Related:

- the a-reply-that-writes-a-record-ends-with-the-records-path rule — which record is the principal record

---

Authored by Scott Bellware on Fri Nov 13 2026 at 6:56:40 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:57:57 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:00:12 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 7:01:18 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:12:49 PM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 8:26:05 PM PT
