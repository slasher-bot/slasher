# Work Session — Private documents (2026-11-12)

This work session began with the idea "Private documents", which held only its title. It became a `/document` command for documents kept outside the repository, then, at the engineer's direction, a `/private` command that records anything given to it only in the private directory. It ended with the feature Completed and merged into `master`.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the feature record `2026-11-13T06-10-36Z-private-documents`, its idea `2026-11-12T17-34-30Z-private-documents`, the foundation rule anything-given-to-private-is-recorded-only-in-the-private-directory, and the log.

## 1. Idle compaction

Before the feature, the engineer asked for idle compaction to be turned off. `idleCompaction` is a Claude Code setting distinct from `autoCompactEnabled`. It is set to `false` in the user's `~/.claude/settings.json`, so a long idle session is no longer compacted, and compaction when the context fills still runs.

## 2. The intent

The engineer started a feature for the idea "Private documents". The idea held no more than its title, so the agent asked what it meant. The engineer selected **outside the repository**: documents kept beside the private journal, under `~/.local/share/slasher/`, not committed, and not read at session start.

The feature was started in a worktree, unattended, with no forecast. The agent's confidence was below the 70% line, and Attended was recommended. The engineer chose unattended anyway.

## 3. `/document`

The agent's first plan was a foundation rule for private documents and a `/document` command with `new`, `read`, `list`, `move`, and `help`. The private journal is built from a rule and a command, with no script, and this followed it. The engineer accepted the plan, and it was built and committed.

## 4. `/private`

The engineer redirected the design: not `/document`, but `/private`, where **anything given to it is recorded only in the private directory**. A file path given to it puts that file there. An item, a log entry, and a journal entry can be written there too, as the journal already could.

The agent revised the plan. Each kind has its own directory under `~/.local/share/slasher/`, one for each project: `documents/`, `items/`, `log/`, and `journal/`, where the private journal already was. A private item and a private log entry take the shapes of their project counterparts, with no log entry in the project and no commit. The vocabulary term became **private record**.

Three corrections followed, each from the engineer:

- **`/private <words>` was removed.** A private document comes only from a file.
- **"Files it in the private store" was offered for "moves that file into the private directory".** Asked how far it reached, the engineer answered: directory, not store.
- **The file is copied, not moved.** The original stays where it is, so nothing is deleted from the repository and no confirmation is asked for a tracked file.

## 5. A worktree's private directory

The engineer tried `/private` from a session in the worktree. A record written there went to a directory named for the worktree, not the project. That session added a clause to the rule: in a git worktree, the project's directory is named for the main repository's directory, read from git's common directory, so every worktree and the main checkout share one.

## 6. The conclusion

The engineer said the feature works and selected *Commit and complete*. The feature is Completed, merged into `master` with the suite passing, and the idea is Realized. The worktree is removed and the branch deleted.

## Takeaways

- Anything given to `/private` is recorded only in the private directory, under `~/.local/share/slasher/`.
- A file path given to `/private` is copied there. The original stays.
- `/private item`, `/private log`, and `/private journal` write private records with the shapes of their project counterparts.
- A private record is not committed, not read at session start, and not logged in the project.
- In a git worktree, the private directory is named for the main repository.

## Glossary

- **private record** — a record the engineer keeps for a project outside its repository: a document, an item, a log entry, or a journal entry.
- **private directory** — `~/.local/share/slasher/`, with one directory for each kind and, in each, one for each project.

## Where the durable records live

- The rule: anything-given-to-private-is-recorded-only-in-the-private-directory, in the foundation package.
- The command: `/private`, in foundation's skills, with its help and its command-table row.
- The vocabulary: **private record**, in the foundation vocabulary.
- The feature record: `local/implementations/2026-11-13T06-10-36Z-private-documents`.
- The idea: `local/items/2026-11-12T17-34-30Z-private-documents`.
- The log entries of 2026-11-13, from the intent selection to the feature's completion.

---

Authored by Scott Bellware on Thu Nov 12 2026 at 10:33:49 PM PT
