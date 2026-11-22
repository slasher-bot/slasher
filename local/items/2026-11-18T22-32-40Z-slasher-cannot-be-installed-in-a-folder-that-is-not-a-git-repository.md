# Slasher cannot be installed in a folder that is not a git repository

**State:** Resolved

**Tags:** [problem]

Reported by pvcarrera:

> It’s not possible to install slasher in a folder that is not git initiated, right? My use case: I have a folder eventide-project with all eventide projects on it, all of them are version controlled but the parent folder which is kind of a workspace for me. I would like to install slasher at root level but I don’t want/need to version control the parent folder

## Cause

Added Wed Nov 18 2026. `slasher-install` delivers each package with `git subtree add`, which works only in a git repository. In a folder that is not one, it offers to run `git init` and goes on only where the engineer accepts. `update-packages.sh` refreshes each package with `git subtree pull`, which needs a repository and a clean working tree.

Most of the rest does not need git. The rules load and the session-start hook runs. The status line shows no branch. The a-projects-local-directory-may-be-relocated-by-its-registry-entry rule already allows a record that no git repository holds: it is not committed, and the reply that wrote it says so.

## Workaround

Added Wed Nov 18 2026. Run `git init` in the workspace folder, and add each project folder to its `.gitignore`. The repository stays local and is never pushed, and the projects' own repositories are unaffected. It costs what the reporter wants to avoid: a repository nobody asked for.

## Proposed solutions

Added Wed Nov 18 2026. Proposed by the agent, not settled.

1. **An install that does not use git.** Where the folder is not a repository, the installer copies each package into `slasher/system/` from a clone or an archive, and `update-packages.sh` replaces each package whole. The installer and the update script each need a second path. The agent prefers this one: a workspace folder that holds nothing to commit has no use for git.
2. **A repository that holds only Slasher's files, with its `.git` directory kept somewhere other than the folder.** The workspace does not look like a repository. It is more complex and less soluble.
3. **Slasher installed in each project instead.** It does not meet the request, which is one Slasher for the whole workspace.

## Settled

- **2026-11-18** — The resolution is Slasher's workspace project and the `/workspace` command. The workspace folder itself needs no repository: the workspace project is a repository of its own beside the other projects, named by `slasher.toml` in the workspace folder.

---

Authored by Scott Bellware on Wed Nov 18 2026 at 14:32:40 PT
Changed by Scott Bellware on Wed Nov 18 2026 at 14:39:09 PT
Changed by Scott Bellware on Wed Nov 18 2026 at 15:22:30 PT
Changed by Scott Bellware on Wed Nov 18 2026 at 15:22:48 PT
