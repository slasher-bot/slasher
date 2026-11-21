# Threaded replies

**State:** Progression

**Tags:** [work]

Its progression is the implementation `2026-11-21T03-46-06Z-threaded-replies`.

**As the engineer stated it:**

> In the imap package, make fetch.py save the headers that thread a reply: Message-ID, In-Reply-To, and References.
>
> 1. In imap/fetch.py, message_text() writes a fixed set of headers (Date, From, To, CC, Subject, Reply-To). Add Message-ID, In-Reply-To, and References to that set, in that order, after Reply-To.
> 2. Write each header value on one line. A long header such as References is often folded across several lines in the original message, and a value written with its line breaks would break the message file's layout: headers, a blank line, then the body. Replace each run of line breaks and whitespace in a value with a single space before writing it. Apply this to every header written, not only the new ones.
> 3. Leave the rest of the message file's format as it is: the UID line first, then the headers, a blank line, the line of dashes, and the body.
> 4. In imap/README.md, where it describes a message file, say that the file also carries Message-ID, In-Reply-To, and References where the message has them, so a reply written from a fetched message can carry In-Reply-To and References. Add a "Changed by" line to the README's provenance footer.
> 5. The smtp package needs no change. Its send.py already sends every header in a message file. Confirm that by reading it, and don't edit it.
> 6. A message whose UID is already in a file name is not fetched again. Don't change that. Messages fetched before this change keep the headers they were saved with.
> 7. Test it by fetching into a scratch directory from an account with a reply thread. Check that a reply's file shows all three headers, each on one line, and that a message without them shows none.

## Tasks

- [ ] A fetched message's file carries Message-ID, In-Reply-To, and References, in that order, after Reply-To, where the message has them.
- [ ] Every header value in a message file is written on one line, with each run of line breaks and whitespace made a single space.
- [ ] The rest of the message file's format is unchanged.
- [ ] The imap README says a message file carries the three threading headers, so a reply written from it can carry In-Reply-To and References.
- [ ] The smtp package's sending is confirmed to send every header in a message file, with no change to it.
- [ ] A message already fetched is not fetched again, and keeps the headers it was saved with.
- [ ] A fetch into a scratch directory shows the three headers, each on one line, on a reply, and none on a message without them.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 5:46:33 PM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 7:46:06 PM PT
