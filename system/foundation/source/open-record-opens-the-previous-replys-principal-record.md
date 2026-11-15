# Open-record opens the previous reply's principal record

**Trigger:** When the engineer types `/open-record`, or asks for the record just written to be opened

**`/open-record` opens the previous reply's principal record in the application the system has registered for its kind of file.** The principal record is the record that reply's operation was about, the one its records line gives, as the a-reply-that-writes-a-record-ends-with-the-records-path rule has it. The record is opened by its full, absolute path, as the file now stands.

**As the engineer stated it:** Create a "/open-record" command that opens the last record with the registered application

**Open it with the platform's command:** `open` on macOS, and `xdg-open` on Linux. Where no such command is found, say so, and print the path so the engineer can open it by hand.

**Where the previous reply had more than one principal record, ask which to open**, through the selection interface, each path an option.

**Then say what was opened, in one line, with the record's path from the project root.** Open nothing else.

**Where the previous reply wrote no record, or had no principal record, say so, and open nothing.** Where there is no previous reply, say so too.

**Why:** the engineer often wants to read or edit the record just written. Opening it in the application the system has registered, such as an editor for markdown, saves finding the file and opening it by hand.

**How to apply:** on `/open-record`, take the previous reply's principal record, open its absolute path with the platform's open command, and report it in one line.

Related:

- the a-reply-that-writes-a-record-ends-with-the-records-path rule — which record is the principal record
- the copy-record-copies-the-previous-replys-principal-record-path rule — copies the same record's path

---

Authored by Scott Bellware on Sat Nov 14 2026 at 8:44:50 PM PT
