# Loop record — Threaded replies

A fetched message's file carries Message-ID, In-Reply-To, and References after Reply-To, each on one line, and every header value the fetch writes is one line. The implementation is `2026-11-21T03-46-06Z-threaded-replies`.

**Mode:** unattended.

## Cycle 1 — Actuation

**Hinge:** how the test invokes the unit.

**Decision:** the fetch script, run from a project root against the test's local mail server, as `slasher/system/imap/fetch.py work-mail`. The behavior is the message file a fetch writes, so the test actuates it the way the engineer does, as `fetch.sh` does. `message_text` is not actuated directly, since no test reaches into the script's functions.

## Cycle 2 — Observation

**Hinge:** what the test reads.

**Decision:** the whole message file, compared with its exact expected text. The order of the headers, the one-line References, and the unchanged layout are all part of the outcome, and one exact comparison reads them together, as `fetch.sh` does.

## Cycle 3 — Controls

**Hinge:** the message the server holds.

**Decision:** a new control, `reply.eml`, a reply with Reply-To, Message-ID, In-Reply-To, and a References header folded onto a second line. The fold is what discriminates: without the change to one line, the References value would carry a line break. The existing `message.eml` stays the control for a message without the three headers.

## Cycle 4 — Implementation

**Hinge:** direct implementation, or red/green/refactor.

**Decision:** direct. The test was run first and failed, as the behavior did not exist. The change is two lines in `message_text` and a small function, `one_line`, which makes each run of whitespace one space. Nothing in the design needed working out under a red.

## Cycle 5 — Naming

**Hinge:** the test's name.

**Decision:** `fetch-threaded-reply.sh`, with the context *Imap, Fetch, Threaded reply*, beside `fetch-sent.sh` and `fetch-again.sh`, which name a variation of the fetch the same way.

**Outcome:** `fetch.py` writes the three headers, each on one line. Both fetch tests pass, and the automated suite passes. The commit is on `implementation/worktree/threaded-replies`.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 7:58:14 PM PT
