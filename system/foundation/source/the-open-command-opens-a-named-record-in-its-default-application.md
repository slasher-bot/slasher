# The open command opens a named record in its default application

**Trigger:** When the engineer types `/open`, or asks for a record they name to be opened

**As the engineer stated it:** Create an "/open" command. It receives a record descriptor, and opens its file in the default application.

**`/open <record>` opens the record the words name, in the default application for its kind of file**, by its full, absolute path. Open it with `open` on macOS, and `xdg-open` on Linux. Where no such command is found, say so, and print the path so the engineer can open it by hand. A record is any record the agent writes under `slasher/local/`: an item, a progression record, a rule, a log entry, a journal entry, a work session record, a loop record, or a migration record.

**The words name a record in one of four ways.**

1. An ordinal from the list of records printed last in the session: a number for an item's row, as `#3` or `3`, as in `/open #3` after `/items current`, and a letter for a progression's, as `#B` or `B`, as in `/open B` after `/features`. A letter may be typed in either case.
2. A handle, the record's ISO-8601-UTC filename prefix, as `2026-03-02T10-15-00Z`, or enough of its start to match one record.
3. A path or a filename, as `slasher/local/items/2026-03-02T10-15-00Z-the-cart-keeps-its-contents.md`.
4. Words from the record's title or filename, as `/open cart contents`.

**Where the words match one record, open it.** Name it before opening it, so an ordinal is confirmed: after an open, say what was opened, in one line, with the record's title and its path from the project root, in backticks. Act on nothing else.

**Where the words match more than one record, ask which**, through the selection interface, each record an option, named by its title and its handle. Where more match than the selection holds, offer the most recently created, and say how many others matched.

**Where the words match no record, say so, and open nothing.** Where an ordinal is given and no list of records was printed in the session, say so, and open nothing.

**As the engineer later stated it:** For #2 and #3, they should act on either the last record or the last text that was generated and being worked on.

**Where no words were typed, open the last thing worked on: the more recent of the most recent principal record and the last text the agent generated that the engineer is working on.** The principal record is the one the a-reply-that-writes-a-record-ends-with-the-records-path rule names, and `/record open` opens the same one. The text is a piece the agent wrote in the chat and the engineer is working on, such as a draft under review. It is not every reply.

1. Where the more recent is the record, open it as `/record open` does.
2. Where the more recent is text already in a file, open that file.
3. Where the more recent is text in the chat only, write it, as it now stands, to a markdown file in the system's temporary directory, named for the text, as `$TMPDIR/cart-receipt-draft.md`. Then open that file.
4. Where there is neither, say so, and open nothing.

After the open, say what was opened, in one line, with its path: from the project root for a record, and in full for a file outside the project.

**`/open` is in the RECORD command domain.** `/record help` prints its help. `/open help` says that this command takes no `help`, names `/record help`, and does nothing more.

**Why:** the engineer often wants to read or edit a record that is not the one just written, such as one a list just showed. `/record open` opens only the most recent principal record, and finding any other record takes a search. A bare `/open` most often means the thing just worked on, which can be a draft that is not a record.

**How to apply:** on `/open`, find the record the words name, and open it with the platform's command. Where the words name none, or more than one, say so or ask, as above. With no words, open the more recent of the last principal record and the last text being worked on.

## History

Until Sat Nov 21 2026 an ordinal was a number for a progression's row too, since a list of progressions numbered its rows.

Until Fri Nov 20 2026 this rule said implementation where it now says progression, in the sense of a feature or an experiment and its record. The progression-replaces-implementation work item settled the change.

Until Thu Nov 19 2026 a bare `/open` asked which record, through the selection interface, and offered the current items and the current implementations, most recently created first.

Until Mon Nov 16 2026 the example path ended with the record's state, `-OPEN`.

Related:

- the the-print-command-prints-the-last-record-or-text-worked-on rule — `/print`, which chooses the same thing and prints it
- the a-reply-that-writes-a-record-ends-with-the-records-path rule — the principal record a bare `/open` opens
- the the-record-command-copies-prints-or-opens-the-most-recent-principal-record rule — `/record open`, which opens the most recent principal record
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — the ordinal and the handle a printed list gives a record

---

Authored by Scott Bellware on Sat Nov 14 2026 at 9:54:46 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 6:36:15 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 5:08:30 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 5:14:40 PM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:22:14 AM PT
Changed by Scott Bellware on Sat Nov 21 2026 at 2:26:02 PM PT
