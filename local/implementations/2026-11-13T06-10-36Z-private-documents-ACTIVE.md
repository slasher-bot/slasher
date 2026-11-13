# Feature — Private documents

**Tags:** [feature]

## Intent

**As the engineer stated it:** "start a new feature for #4", with the item chosen as `2026-11-12T17-34-30Z-private-documents`, which reads "Private documents". The intent was selected by the engineer as *Outside the repository*.

**A project's private documents are kept outside its repository**, at `~/.local/share/slasher/documents/<project>/`, beside the private journal. They are not committed, and not read at session start. The agent reads or writes one only on the engineer's command.

**2026-11-12 — The intent is revised.** As the engineer stated it: "It shouldn't be a "/document" command. It should be a "/private" command, and anything given to it is recorded only in the private directory. A file path given to /private files that file in the private directory. An item can be written there, too, or a log, and a journal, as is already the case". **Anything given to `/private` is recorded only in the private directory**, under `~/.local/share/slasher/`, in one directory for each kind and project: a document, an item, a log entry, or a journal entry.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/private-documents`
- **Base:** `599bae8b`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-private-documents`.
- **Participation:** unattended.
- **Forecast:** none.
- **Item:** `2026-11-12T17-34-30Z-private-documents`

## Confirmations

- **2026-11-12** — Intent: Outside the repository, selected by the engineer.
- **2026-11-12** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-12** — Participation: Unattended, selected by the engineer. Agent's confidence 55%, risk of redo 45%, It'll work 85%, Your approval 60%, attended confidence 88%. The warning was shown, and Attended was recommended.
- **2026-11-12** — Forecast: No forecast, selected by the engineer.
- **2026-11-12** — Plan: the revised plan for `/private`, accepted by the engineer.

---

Authored by Scott Bellware on Thu Nov 12 2026 at 10:10:36 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:21:02 PM PT
