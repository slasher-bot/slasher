# An unrecorded session writes no record

**Trigger:** When the engineer types `/unrecorded`, or starts or ends an unrecorded session

1. A bare `/unrecorded` starts an unrecorded session. It lasts until the session ends, or until `/unrecorded end`.
2. `/unrecorded <instruction>` starts an unrecorded session, carries out the instruction in it, and then ends it. The session ends when the reply that carries out the instruction is done, as `/unrecorded end` ends it.
3. In an unrecorded session, the agent writes no record anywhere: not in the project, and not in the private directory. It still answers and prints every reply.
4. That holds for a record the engineer asks for, and for a record a rule asks for.
5. Carry out the instruction after `/unrecorded` in the session, then end it. Where there is none, start the session and wait for the engineer's request.
6. `/unrecorded help` prints the help of the UNRECORDED command domain, whose help command `/unrecorded` is.

**As the engineer stated it:** An "/unrecorded" command that mirrors "/private", but instead of routing records to the private directory, the records are not written at all.

**As the engineer later stated it:** When the "/unrecorded <instruction>" form is used, then unrecorded session ends upon comletion of the instruction

## The agent still answers

1. In an unrecorded session, answer every question and carry out every command, as in any other session.
2. Print every answer, report, list, and result in the reply, as in any other session.
3. A record is a file the agent writes to disk. A reply is not a record, so the session does not withhold it.
4. Only the records named below are not written.

## What is not written

1. An item, of any kind
2. A log entry, including the one the hook writes for a process question. The hook writes none while the session lasts.
3. A journal entry, in the project journal or the private journal
4. A work session record
5. A progression record
6. A loop record
7. A migration record
8. A brainstorm collection file

## What still changes

1. A file that is not a record changes as the work asks: code, a test, a rule, a local rule, a vocabulary, a README, and a skill.
2. A package set declaration is written, since it decides which rules load.
3. Fetched email is written, since it is data the project receives.
4. A file that is not a record may be committed, on the engineer's selection, as usual.

## The session

1. When the session starts, say once that nothing in it will be recorded. Say it again when it ends. A session started with an instruction says both in the one reply.
2. A reply in the session prints no *Record:* line, since it wrote no record.
3. Where the work would change an existing record's content or state, say so, and ask, through the selection interface, whether to end the session first. Do not change the record in the session.
4. Before starting a feature or an experiment, ask, through the selection interface, whether to end the session first. A progression without its record would be left silently open.
5. Starting a private session ends an unrecorded one, and starting an unrecorded session ends a private one. Records only go one way at a time.

## An unrecorded session times out

1. An unrecorded session times out when 4 minutes pass with no prompt from the engineer.
2. The plugin's hook on each prompt keeps the time, in a state file named for the session in `~/.local/state/slasher/unrecorded-sessions/`. `/unrecorded` writes it, each prompt in the session writes its time there, and `/unrecorded end` removes it.
3. Where a prompt comes more than 4 minutes after the last one, the hook tells the agent so. Before anything else, ask the engineer, through the selection interface, whether to continue the unrecorded session or end it.
4. The options are **Continue** and **End**. Continue keeps the session, and its 4 minutes count from the prompt that brought the question.
5. End ends the session: delete the state file the hook names, and say that records are written again.
6. The question carries no decision marker.

**Why:** an unrecorded session is for leaving no log entries, work session records, or other records behind. It is not for withholding the agent's answers. Some work is not worth a record, and some should leave none: an exploration the engineer will discard, or a question asked only to think aloud. A private session keeps records out of the repository but still writes them. An unrecorded session writes none, so there is nothing to find, move, or delete afterwards.

**How to apply:** on `/unrecorded`, say that nothing will be recorded, and then write no record until the session ends. Answer and print every reply as usual. On `/unrecorded <instruction>`, carry out the instruction, then end the session in the same reply: delete its state file, and say that records are written again. Change files that are not records as the work asks. Ask before a change to an existing record, and before starting a feature or an experiment.

## History

Until Fri Nov 20 2026 this rule said implementation where it now says progression, in the sense of a feature or an experiment and its record. The progression-replaces-implementation work item settled the change.

1. Until Tue Nov 17 2026, `/unrecorded <instruction>` started a session that lasted, like a bare `/unrecorded`, until `/unrecorded end` or the end of the session.
2. Until Mon Nov 16 2026, `/unrecorded` was part of the PRIVATE command domain. `/unrecorded help` said that the command takes no `help`, and named `/private help`.

Related:

- the anything-given-to-private-is-recorded-only-in-the-private-directory rule — the private session this command mirrors
- the a-reply-that-writes-a-record-ends-with-the-records-path rule — the *Record:* line a reply in the session does not print
- the a-process-question-and-its-answer-are-logged rule — the hook that writes no entry in the session
- the a-progression-runs-on-a-branch-to-a-declared-end rule — why a feature or an experiment is not started in the session

---

Authored by Scott Bellware on Mon Nov 16 2026 at 10:42:15 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 10:55:07 PM PT
Changed by Scott Bellware on Tue Nov 17 2026 at 12:34:26 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 8:27:01 PM PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:22:43 AM PT
