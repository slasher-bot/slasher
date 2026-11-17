# An unrecorded session writes no record

**Trigger:** When the engineer types `/unrecorded`, or starts or ends an unrecorded session

1. A bare `/unrecorded`, or `/unrecorded <instruction>`, starts an unrecorded session. It lasts until the session ends, or until `/unrecorded end`.
2. In an unrecorded session, the agent writes no record anywhere: not in the project, and not in the private directory.
3. That holds for a record the engineer asks for, and for a record a rule asks for.
4. Carry out the instruction after `/unrecorded` in the session. Where there is none, start the session and wait for the engineer's request.
5. `/unrecorded help` says that the command takes no `help`, and names `/private help`.

**As the engineer stated it:** An "/unrecorded" command that mirrors "/private", but instead of routing records to the private directory, the records are not written at all.

## What is not written

1. An item, of any kind
2. A log entry, including the one the hook writes for a process question. The hook writes none while the session lasts.
3. A journal entry, in the project journal or the private journal
4. A work session record
5. An implementation record
6. A loop record
7. A migration record
8. A brainstorm collection file

## What still changes

1. A file that is not a record changes as the work asks: code, a test, a rule, a local rule, a vocabulary, a README, and a skill.
2. A package set declaration is written, since it decides which rules load.
3. Fetched email is written, since it is data the project receives.
4. A file that is not a record may be committed, on the engineer's selection, as usual.

## The session

1. When the session starts, say once that nothing in it will be recorded. Say it again when it ends.
2. A reply in the session prints no *Record:* line, since it wrote no record.
3. Where the work would change an existing record's content or state, say so, and ask, through the selection interface, whether to end the session first. Do not change the record in the session.
4. Before starting a feature or an experiment, ask, through the selection interface, whether to end the session first. An implementation without its record would be left silently open.
5. Starting a private session ends an unrecorded one, and starting an unrecorded session ends a private one. Records only go one way at a time.

## An unrecorded session times out

1. An unrecorded session times out when 4 minutes pass with no prompt from the engineer.
2. The plugin's hook on each prompt keeps the time, in a state file named for the session in `~/.local/state/slasher/unrecorded-sessions/`. `/unrecorded` writes it, each prompt in the session writes its time there, and `/unrecorded end` removes it.
3. Where a prompt comes more than 4 minutes after the last one, the hook tells the agent so. Before anything else, ask the engineer, through the selection interface, whether to continue the unrecorded session or end it.
4. The options are **Continue** and **End**. Continue keeps the session, and its 4 minutes count from the prompt that brought the question.
5. End ends the session: delete the state file the hook names, and say that records are written again.
6. The question carries no decision marker.

**Why:** some work is not worth a record, and some should leave none: an exploration the engineer will discard, or a question asked only to think aloud. A private session keeps records out of the repository but still writes them. An unrecorded session writes none, so there is nothing to find, move, or delete afterwards.

**How to apply:** on `/unrecorded`, say that nothing will be recorded, and then write no record until the session ends. Change files that are not records as the work asks. Ask before a change to an existing record, and before starting a feature or an experiment.

Related:

- the anything-given-to-private-is-recorded-only-in-the-private-directory rule — the private session this command mirrors
- the a-reply-that-writes-a-record-ends-with-the-records-path rule — the *Record:* line a reply in the session does not print
- the a-process-question-and-its-answer-are-logged rule — the hook that writes no entry in the session
- the an-implementation-runs-on-a-branch-to-a-declared-end rule — why a feature or an experiment is not started in the session

---

Authored by Scott Bellware on Mon Nov 16 2026 at 10:42:15 PM PT
