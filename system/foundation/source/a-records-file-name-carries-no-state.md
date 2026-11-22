# A record's file name carries no state

**Trigger:** When creating, renaming, changing the state of, or referencing an item or progression record

**An item's or a progression record's file name carries no state.** The name is the ISO-8601-UTC prefix, then a dash-separated, lower-case name, then `.md`, as the file-names rule gives it. The state is the `**State:**` line inside the file, and nothing else states it.

```
2026-07-27T07-09-02Z-the-cart-keeps-its-contents.md
2026-08-05T19-37-06Z-the-receipt-shows-the-tax.md
```

**As the engineer stated it:** Consider removing the state from records' file names so that referencing them via URL is stable. The change will also require a migration for downstream projects.

**A state change edits the `**State:**` line and renames nothing.** A record keeps one path for its whole life, from the reply that wrote it to its conclusion and after. So a link to it keeps working: a URL on a repository host, a path printed under *Record:*, and a path written in another record.

**A reference to a record may be its path, or its prefix and name.** Either stays true for the record's life. A reference leaves out nothing to survive a rename, since there is none.

**A record written while its name carried its state keeps its content as written.** A historical record that gives such a path, as `…-the-cart-keeps-its-contents-OPEN.md`, is not revised. Its path is unresolvable, and a reader finds the record by its prefix and name.

**A Slasher project's records are renamed when its packages are updated or Slasher is installed.** `install.sh` takes the state off the end of each item's and progression record's name, where the name without it is free. Where it is not free, or two names differ only in their state, it renames neither, and says so. The content of a renamed record does not change.

**Why:** a record's name carried its state until Mon Nov 16 2026, so each state change renamed the file, and every link to it broke. The project shares records by link, and a link cannot leave out a suffix the way a reference in a record can. The state is read where Slasher shows it: `/items`, `/current`, and `/status` read the `**State:**` line.

**How to apply:** name a new item or progression record by its prefix and name, with no state. At a state change, edit the `**State:**` line and leave the name as it is. Refer to a record by its path, or by its prefix and name. Leave historical records as written.

## Compressed

1. An item's or a progression record's file name carries no state.
2. The name is the ISO-8601-UTC prefix, a dash-separated, lower-case name, and `.md`.

```
2026-07-27T07-09-02Z-the-cart-keeps-its-contents.md
2026-08-05T19-37-06Z-the-receipt-shows-the-tax.md
```

3. The `**State:**` line inside the file is the only statement of the state.
4. A state change edits the `**State:**` line and renames nothing. A record keeps one path for its whole life.
5. Refer to a record by its path, or by its prefix and name.
6. Leave a historical record that gives a path with a state as written. A reader finds the record by its prefix and name.
7. `install.sh` takes the state off the end of a Slasher project's record names when its packages are updated or Slasher is installed. Where the name without it is taken, or two names differ only in their state, it renames neither, and says so. Content does not change.

## Compression

- 2026-11-16, revised: the rule is rewritten from the opposite convention, so the earlier figures describe a different rule; checked: 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-11-20, revised: progression replaces implementation in the record sense, a term swap the engineer settled; not re-checked

## History

Until Fri Nov 20 2026 this rule said implementation where it now says progression, in the sense of a feature or an experiment and its record. The progression-replaces-implementation work item settled the change.

Until Mon Nov 16 2026 this rule was named a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case, and required the opposite: a record's file name ended with its state word in upper case, after a dash, as `…-ooda-terminology-REFUTED.md`, and each state change renamed the file with `git mv`. A reference left out the suffix and the extension so a rename broke none. The suffix was the one exception to the file-names rule's lower-case name. The engineer settled that a file name carries no state, so a link to a record stays stable.


Until Wed Nov 11 2026 the earlier rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Mon Nov 9 2026 the reversible words were Realized, Deferred, Discontinued, Open, and a work item's Done.

Until Mon Nov 9 2026 an item had no Discontinued state, and the reversible words did not include it.

Until Sun Oct 25 2026 this rule was named a-record-ends-with-its-state-in-upper-case and titled "A record carrying a state line ends its filename with that state in upper case".

Until Sun Aug 16 2026 the suffix was also appended to the file's contents.

Until Tue Oct 27 2026 live artifacts that cited a record by its full filename were reconciled at each rename. The engineer settled that a reference omits the state suffix and keeps the rest of the filename, so a state change breaks no reference.

Until Mon Oct 26 2026 an implementation record took no suffix while its work was under way, since the absence of a state line was its in-progress state. Items had stopped taking an absent state on 2026-08-16, when **Active** was added. The engineer settled that implementations take the Active state too, so every item and every implementation record now carries a suffix.
- **Thu Oct 29 2026** — the tag for a piece of work to be done was `[work-item]`, and the record was called a work item. It is `[work]`, at the engineer's direction.

Related:

- the the-progressions-directory-holds-one-record-per-progression rule — the record whose state the `**State:**` line states
- the the-items-directory-holds-one-file-per-item rule — the other record that carries a state line
- the file-names rule — the ISO-8601-UTC prefix and the lower-case name
- the a-reply-that-writes-a-record-ends-with-the-records-path rule — the path printed under *Record:*, which stays true
- the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the log entry a state change takes

---

Authored by Scott Bellware on Sun Aug 16 2026 at 02:44:25 PT
Changed by Scott Bellware on Sun Aug 16 2026 at 02:54:58 PT
Changed by Scott Bellware on Sun Aug 16 2026 at 03:03:12 PT
Changed by Scott Bellware on Mon Aug 17 2026 at 22:31:36 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 09:02:44 PT
Changed by Scott Bellware on Wed Oct 14 2026 at 22:28:48 PT
Changed by Scott Bellware on Wed Oct 14 2026 at 22:29:41 PT
Changed by Scott Bellware on Wed Oct 21 2026 at 09:37:27 PT
Changed by Scott Bellware on Wed Oct 21 2026 at 16:15:31 PT
Changed by Scott Bellware on Sat Oct 24 2026 at 15:50:21 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:14:54 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:21:25 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:22:03 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:22:14 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:23:15 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 15:02:18 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 15:03:07 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 15:22:08 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 17:41:58 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 18:45:53 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 19:02:14 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:35:25 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:06:51 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:29:24 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 15:28:06 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 15:18:10 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 19:01:29 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:34:26 PT
Changed by Scott Bellware on Wed Oct 28 2026 at 17:26:52 PT
Changed by Scott Bellware on Thu Oct 29 2026 at 18:34:30 PT
Changed by Scott Bellware on Mon Nov 9 2026 at 15:13:33 PT
Changed by Scott Bellware on Mon Nov 9 2026 at 21:00:03 PT
Changed by Scott Bellware on Mon Nov 9 2026 at 21:33:14 PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 18:36:15 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 00:22:14 PT
