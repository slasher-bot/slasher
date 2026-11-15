# Feature — A suggest command suggests edits to content, and accept or reject settles them

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature start #2", with the item chosen as `2026-11-14T14-42-30Z-edit-command-suggests-edits-to-content`.

**`/edit` tells the agent to suggest edits to content.** `/edit accept` tells the agent to incorporate the suggested edits. `/edit reject` tells the agent not to incorporate them.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/suggest-command`
- **Base:** `99ada0e4`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-suggest-command`, chosen when the feature was created.
- **Participation:** attended, chosen when the feature was created.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-14T14-42-30Z-edit-command-suggests-edits-to-content`

## Decisions

- **2026-11-15** — The command is `/suggest`, not `/edit`: `/suggest`, `/suggest accept`, and `/suggest reject`. **As the engineer stated it:** It should be "/suggest" rather than "/edit"

- **2026-11-15** — The use site, selected by the engineer: `/suggest <words naming the content>` names the content, and a bare `/suggest` acts on the content the conversation is on. Suggestions are numbered. `/suggest accept 1 3` and `/suggest reject 2` settle some of them. A bare `/suggest accept` or `/suggest reject` settles all of them.

- **2026-11-15** — The display, selected by the engineer: each numbered suggestion has a short heading, then the original text, the suggested text, and a one-line reason, each on its own line.

- **2026-11-15** — Pending suggestions, selected by the engineer: when `/suggest` runs again, the new suggestions are added after the ones still pending, and the numbering continues. No pending suggestion is lost.

- **2026-11-15** — Accepting, selected by the engineer: `/suggest accept` shows the changed passages as they would read, then asks through the selection interface whether to write them to the file.

## Confirmations

- **2026-11-15** — Rename: the branch, the worktree, and this record are renamed from edit-command to suggest-command, selected by the engineer. The branch was `feature/worktree/edit-command`.

- **2026-11-15** — Creation: `/feature start`, with no feature Open, so the feature was created Active.
- **2026-11-15** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-15** — Participation: Attended, selected by the engineer. Agent's confidence 55%, risk of redo 45%, It'll work 85%, Your approval 55%, attended confidence 90%. The warning was shown, and Attended was recommended.
- **2026-11-15** — Forecast: No forecast, selected by the engineer.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 11:38:31 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:38:47 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:40:02 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:42:08 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:45:39 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:48:02 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:53:29 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:55:05 AM PT
