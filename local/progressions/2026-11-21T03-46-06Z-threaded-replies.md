# Implementation — Threaded replies

**Tags:** [implementation]

## Intent

**As the engineer stated it:** `/! #1`, with #1 the work item `2026-11-21T01-46-33Z-threaded-replies`.

**A fetched message's file carries Message-ID, In-Reply-To, and References, each on one line, so a reply written from it can thread.** The work item states the steps.

Realizes the work item `2026-11-21T01-46-33Z-threaded-replies`.

## State

- **State:** Active

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/threaded-replies`
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-threaded-replies`. The main working tree stays on `master`.
- **Participation:** unattended, by `/unattended`.
- **Forecast:** none given.
- **Item:** `2026-11-21T01-46-33Z-threaded-replies`

## Plan, as accepted on 2026-11-21

1. Start an unattended implementation for Threaded replies. Choose its working location as the agent. Write its record Active, make the work item Progression, and log both. Commit them on master, on the engineer's selection.
2. Write the test first: a fetched reply whose References header is folded across lines. Its file carries Message-ID, In-Reply-To, and References after Reply-To, each on one line.
3. Add the reply as a new control message for the test's mail server.
4. Keep the existing fetch test as the control for a message without the three headers.
5. In fetch.py, add the three headers to message_text, in that order, after Reply-To.
6. Write every header value on one line, with each run of line breaks and whitespace made one space.
7. Leave the rest of the message file's format, and the skip of a UID already fetched, unchanged.
8. Change the imap README's account of a message file, and add a Changed by line to its footer.
9. Read the smtp package's send.py, and confirm that it sends every header in a message file. Do not edit it.
10. Write the loop record, with each hinge and the decision made.
11. Run the suite, and commit the change on the branch.
12. Leave the fetch from a real account to the engineer. This project has no email configured, and the test asked for reaches the network.

## Confirmations

- **2026-11-21** — Participation: Unattended, by the engineer's `/unattended`.
- **2026-11-21** — Plan: Accept, selected by the engineer.
- **2026-11-21** — Working location: Branch and worktree, selected by the agent. The work changes code, so it is kept off `master` until it is concluded, and the main working tree stays free for other work.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 7:46:06 PM PT
