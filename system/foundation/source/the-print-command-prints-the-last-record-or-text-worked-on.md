# The print command prints the last record or text worked on

**Trigger:** When the engineer types `/print`, or asks for the last record or text worked on to be printed

**As the engineer stated it:** "/print" should print the last record.

**As the engineer later stated it:** For #2 and #3, they should act on either the last record or the last text that was generated and being worked on.

**As the engineer later stated it:** Do #2 with the same reasoning as the "/open" command.

**A bare `/print` prints the last thing worked on: the more recent of the most recent principal record and the last text the agent generated that the engineer is working on.** The principal record is the one the a-reply-that-writes-a-record-ends-with-the-records-path rule names, and `/record print` prints the same one. The text is a piece the agent wrote in the chat and the engineer is working on, such as a draft under review. It is not every reply.

1. Where the more recent is the record, print it as `/record print` does: its contents as the file now stands, under a line naming its path from the project root.
2. Where the more recent is text already in a file, print that file's contents as the file now stands, under a line naming its path.
3. Where the more recent is text in the chat only, print it as it now stands.
4. Where there is neither, say so, and print nothing.

**Print the contents as they are, with nothing added and nothing left out.** Act on nothing else.

**`/print <record>` prints the record the words name**, in the same form, under a line naming its path from the project root. The words name a record as they do for `/open`, under the the-open-command-opens-a-named-record-in-its-default-application rule: an ordinal from the list of records printed last, a handle, a path or a filename, or words from the record's title or filename. Where the words match more than one record, ask which, through the selection interface. Where they match none, say so, and print nothing.

**`/print` is in the RECORD command domain.** `/record help` prints its help. `/print help` says that this command takes no `help`, names `/record help`, and does nothing more.

**Why:** the engineer often wants to read again the thing just worked on, in full, in the chat. That thing can be a record or a draft that is not a record. A bare `/print` most often means the thing just worked on, as a bare `/open` does, so the two commands choose it the same way.

**How to apply:** on a bare `/print`, take the more recent of the last principal record and the last text being worked on, and print it as it now stands. With words, print the record they name.

Related:

- the the-open-command-opens-a-named-record-in-its-default-application rule — `/open`, which chooses the same thing and opens it
- the the-record-command-copies-prints-or-opens-the-most-recent-principal-record rule — `/record print`, which prints the most recent principal record
- the a-reply-that-writes-a-record-ends-with-the-records-path rule — the principal record a bare `/print` prints

---

Authored by Scott Bellware on Thu Nov 19 2026 at 17:14:40 PT
