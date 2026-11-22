# Work Session — The /unrecorded command

This work session started as an idea for a command that mirrors `/private`, but writes no records at all. It became a plan, a list of the records a session would leave unwritten, and a feature that built the command unattended and was merged to `master`.

This is the communicable record of the work session, a guided tour. The item, the feature record, the loop record, the rule, and the log entries it points to are the source of truth.

## 1. The idea and its plan

The engineer recorded the idea, then asked for a plan. The agent proposed mirroring the session half of `/private`: a session that starts, ends, and times out the same way, a log hook that writes nothing during it, and a rule that says what an **unrecorded session** is. Five decisions were left to the engineer, each with a recommendation.

## 2. Which records go unrecorded

The engineer asked which kinds of records go unrecorded. The plan used the private rule's definition of a record, a file under `slasher/local/` that a rule tells the agent to write. That covers six kinds. Five more were left unsettled: migration records, package set declarations, brainstorm collections, private records, and fetched email. At the engineer's direction, the plan, the record kinds, and the open decisions were written into the item.

- Item: `2026-11-17T06-20-07Z-an-unrecorded-command`, Realized

## 3. The feature, unattended

The engineer chose a branch and worktree, unattended work, and no forecast, and accepted a ten-step plan. That plan settled each open decision as the item recommended. The session script learned the unrecorded session beside the private one, so starting either ends the other. The log script writes nothing for an unrecorded session, rather than leaving an entry to remove. Migration records and brainstorm collections are not written. Package set declarations and fetched email still are.

- Feature record: `2026-11-17T06-37-31Z-unrecorded-command`, Completed
- Loop record: `2026-11-17T06-43-48Z-unrecorded-command`
- Rule: the an-unrecorded-session-writes-no-record rule

## 4. The conclusion

The engineer concluded the feature Completed. It merged to `master` cleanly, the automated suite passed there with 102 tests, and the branch and worktree were deleted.

## Takeaways

- An unrecorded session writes no record anywhere, and files that are not records still change.
- A record is a file a rule tells the agent to write. A package set declaration and fetched email are not records.
- Only one of a private session and an unrecorded session holds at a time.
- The log hook writes nothing in an unrecorded session, so nothing is left to remove.

## Glossary

- **unrecorded session**: the part of a session from `/unrecorded` until `/unrecorded end`, a timeout, or the session's end, in which no record is written.
- **record**: a file a rule tells the agent to write, such as an item, a log entry, or a progression record.

## Where the durable records live

- Rule: `system/foundation/source/an-unrecorded-session-writes-no-record.md`
- Scripts: `system/foundation/private-session.sh` and `system/foundation/process-question-log.sh`, with their tests in `test/automated/private-session/` and `test/automated/process-question-log-unrecorded.sh`
- The item, feature record, and loop record named above
- Commits: `d9664dca` through `6777a871` on `master`

---

Authored by Scott Bellware on Mon Nov 16 2026 at 22:50:38 PT
