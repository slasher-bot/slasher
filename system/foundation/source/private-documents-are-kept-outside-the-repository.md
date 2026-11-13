# Private documents are kept outside the repository

**Trigger:** When the engineer asks to write, read, list, or move a private document, as with `/document`

1. A private document is a document the engineer keeps for a project outside the project's repository. It is not committed with the project.
2. It can be any document: a draft, notes, a reference, a letter, or a file the engineer gives.
3. Its contents are what the engineer directs. Write the engineer's words, or what the engineer asks the agent to write. Add nothing on your own initiative.

## The directory

1. Every private document is under one root, `~/.local/share/slasher/documents/`. Per-machine settings stay under `~/.config/slasher/`, which this root does not share.
2. Each project with private documents has one directory under the root, named for the project's repository directory, for example `~/.local/share/slasher/documents/some-project/`.
3. One file in that directory is one document.
4. The directory has no `<username>` directory. It belongs to one user.
5. The directory may not exist, and its absence is ordinary. Make it when the first private document for that project is written.

## A private document's name

1. Use the name the engineer gives.
2. Where the engineer gives none, name the document for what it is, dash-separated and lower-case, as in `cart-pricing-draft.md`.
3. A private document takes no datetime prefix, no state suffix, and no provenance footer. It is not a working-state artifact.
4. Where a file of that name is already there, ask, through the selection interface, whether to replace it or to use another name.

## Only on the engineer's command

1. Write, read, or list a private document only when the engineer asks for it.
2. Do not read a private document at session start.
3. Do not read one to answer a question, unless the engineer names it.
4. Do not offer to write a private document, or name the directory as a place to put something.
5. Log nothing about a private document: not its creation, a change to it, its being read, or its move into the project. This holds where another rule asks for a log entry.
6. A private document takes no commit.
7. Whether the directory is under version control is the engineer's decision. Neither ask for it nor forbid it.

## Moving a private document into the project

1. A private document moves into the project only on the engineer's command.
2. The engineer names where it goes. Where the engineer names no place, ask, through the selection interface.
3. Before the move, name the document and its destination, and ask, through the selection interface, whether to move it. The move publishes it to every reader of the repository.
4. Move the file with its content unchanged, and remove it from the private directory.
5. It is then a file of the project. Where it goes under `slasher/local/`, it takes that directory's conventions from then on.
6. Nothing else moves a private document. Do not offer to move one.

## What private does not promise

1. Private means kept out of the project's repository and out of the session-start read, and nothing more.
2. It does not keep a document on the machine. A document the agent writes or reads is plain text in the session. It reaches the model provider, the local transcript, and any hook that is installed.

**Why:** an engineer has material about a project that is not for the project's repository: a draft not ready to share, a note about a person, or a document from someone else. Kept in the repository, it is committed and read by every reader. Kept anywhere else, the agent cannot find it. A fixed directory per project, read only on command, keeps it at hand without publishing it.

**How to apply:** when the engineer asks to write, read, list, or move a private document, use the project's directory under `~/.local/share/slasher/documents/`. Do only the act asked for, log nothing, and commit nothing.

Related:

- the journal package's private-journal-convention — the private journal, kept beside these under the same root
- the brainstorming-records-points-as-they-are-said-and-organizes-them-at-the-end rule — another record kept outside the repository
- the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule — per-machine configuration under `~/.config/`, beside which this keeps data

---

Authored by Scott Bellware on Thu Nov 12 2026 at 10:13:55 PM PT
