# Feature — A review command suggests edits to content, and accept or reject settles them

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature start #2", with the item chosen as `2026-11-14T14-42-30Z-edit-command-suggests-edits-to-content`.

**`/edit` tells the agent to suggest edits to content.** `/edit accept` tells the agent to incorporate the suggested edits. `/edit reject` tells the agent not to incorporate them.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/review-command`
- **Base:** `99ada0e4`, from `master`, the commit holding this record as first written
- **Working location:** branch and worktree, at `../slasher-feature-worktree-review-command`, chosen when the feature was created.
- **Participation:** attended, chosen when the feature was created.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-14T14-42-30Z-edit-command-suggests-edits-to-content`
- **Item:** `2026-11-14T14-43-02Z-a-content-package-for-content-editing-rules-and-commands`, joined on 2026-11-15, selected by the engineer

## Decisions

- **2026-11-15** — The command is `/suggest`, not `/edit`: `/suggest`, `/suggest accept`, and `/suggest reject`. **As the engineer stated it:** It should be "/suggest" rather than "/edit"

- **2026-11-15** — The use site, selected by the engineer: `/suggest <words naming the content>` names the content, and a bare `/suggest` acts on the content the conversation is on. Suggestions are numbered. `/suggest accept 1 3` and `/suggest reject 2` settle some of them. A bare `/suggest accept` or `/suggest reject` settles all of them.

- **2026-11-15** — The display, selected by the engineer: each numbered suggestion has a short heading, then the original text, the suggested text, and a one-line reason, each on its own line.

- **2026-11-15** — Pending suggestions, selected by the engineer: when `/suggest` runs again, the new suggestions are added after the ones still pending, and the numbering continues. No pending suggestion is lost.

- **2026-11-15** — Accepting, selected by the engineer: `/suggest accept` shows the changed passages as they would read, then asks through the selection interface whether to write them to the file.

- **2026-11-15** — The command is `/review`, not `/suggest`: `/review`, `/review accept`, and `/review reject`. Every earlier decision holds under the new name. Claude Code's built-in `/review` may shadow it, which is checked when the skill is written. **As the engineer stated it:** Change "/suggest" to "/review"

- **2026-11-15** — The package, selected by the engineer: a new `content` package, at `system/content/`, carries the `/review` command's rule and skill.

- **2026-11-15** — The package name, selected by the engineer: the package is named `prose`, at `system/prose/`, not `content`. The installer already has a package set named `content`, and `slasher-install content` resolves to the set, so a package of that name could not be installed by name. The engineer selected renaming the package, then the name `prose`.

- **2026-11-15** — Installation, selected by the engineer: the installer's `content` set includes `prose`, and the `default` set does not. This repository takes `prose` up, by a new package-set declaration, `default, +prose`.

- **2026-11-15** — The command name, selected by the engineer: the command is `/suggest` again, not `/review`, since Claude Code's built-in code-review command takes `/review`. The engineer selected `/suggest` over keeping `/review`, `/revise`, and `/proofread`.

- **2026-11-15** — The package set, selected by the engineer: `imap` and `smtp` are active here too, by a new declaration, `default, +prose, +imap, +smtp`. The declaration before it left them inactive, and the plugin build then left `/email` and `/smtp` out.

- **2026-11-15** — The command name: the command is `/review` again, not `/suggest`, although Claude Code's built-in code-review command takes `/review`. Where it does, the command is typed `/slasher:review`. **As the engineer stated it:** Change "/suggest" to "/review"

## What happened

- Claude Code 2.1.325 has a built-in code-review skill whose alias is `review`, described as *Review the current diff or a PR for bugs and cleanups*. Typing `/review` reaches that skill, not this one. The plugin's command is reached as `/slasher:review`.

## Confirmations

- **2026-11-15** — Creation: `/feature start`, with no feature Open, so the feature was created Active.
- **2026-11-15** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-15** — Participation: Attended, selected by the engineer. Agent's confidence 55%, risk of redo 45%, It'll work 85%, Your approval 55%, attended confidence 90%. The warning was shown, and Attended was recommended.
- **2026-11-15** — Forecast: No forecast, selected by the engineer.
- **2026-11-15** — Rename: the branch, the worktree, and this record are renamed from edit-command to suggest-command, selected by the engineer. The branch was `feature/worktree/edit-command`.
- **2026-11-15** — Rename: the branch, the worktree, and this record are renamed from suggest-command to review-command, selected by the engineer. The branch was `feature/worktree/suggest-command`.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 11:38:31 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:38:47 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:40:02 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:42:08 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:45:39 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:48:02 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:53:29 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:55:05 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:56:21 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:57:48 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:58:18 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:01:06 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:23:57 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:25:38 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:31:11 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:32:30 PM PT
