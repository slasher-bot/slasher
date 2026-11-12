# Experiment — Third-party marketplace

**Tags:** [experiment]

## Intent

**As the engineer stated it:** "/feature start for #2", with the item chosen as `2026-11-11T20-30-36Z-third-party-marketplace-for-slasher`, which reads "Third-party marketplace for Slasher".

**Slasher is distributed through a third-party marketplace of its own:** a git repository holding a `.claude-plugin/marketplace.json` that lists the Slasher plugin, which a user adds with `/plugin marketplace add`. The item holds what the Claude Code documentation says about marketplaces.

## State

- **State:** Active

## Setup

- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Implementation branch:** `experiment/worktree/third-party-marketplace`
- **Base:** `561bbb9a`, from `master`
- **Working location:** branch and worktree, at `../slasher-experiment-worktree-third-party-marketplace`, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Forecast:** stated, at the engineer's direction after the start. The verdict question is asked at the end.

## Forecast

**As the engineer stated it:** "The viability of publishing a plugin to Slasher's own marketplace will be exercized"

**Publishing a plugin to Slasher's own marketplace is exercised, and the exercise shows whether it is viable.**

## Design

Settled by the engineer on 2026-11-11, before the first hinge.

- **The plugin's role:** the entry point to install. The marketplace's plugin carries `/package install` and the hooks, and installing it is how a project gets Slasher, in place of the `curl` install. The packages still go into `slasher/system/`.
- **The marketplace's repository:** `slasher-bot/slasher`, with `.claude-plugin/marketplace.json` at its root. A user adds it with `/plugin marketplace add slasher-bot/slasher`.
- **The plugins:** one plugin to a package, each depending on `foundation`. A bundle plugin, `slasher`, depends on the default set, so one install brings them all.
- **The first step:** a marketplace listing the `foundation` plugin alone, added from the worktree's local path, to try the install end to end before anything is pushed.
- **The plugin's root:** a built directory. A script assembles `plugins/foundation/` from the package, as `assemble-plugin.sh` does today, the build is committed, and `marketplace.json` names `./plugins/foundation`.
- **2026-11-11 — The plugin installs Slasher, rather than carrying the rules.** Selected by the engineer on the agent's recommendation, after the trial showed `/foundation:log` stop without the rule loader. A plugin command runs Slasher's installer, which puts `slasher/system/` into the project. Where the project is not a git repository, the agent asks before running `git init`, since the installer refuses to prompt when it is not run in a terminal.
- **2026-11-11 — The installer is downloaded from GitHub, by a new `/install` command.** Selected by the engineer. `/install` loads no rule, since it runs where none is installed yet. It downloads `install` from `slasher-bot/slasher`'s `master` and runs it. `/package install` stays as it is, for a project that already has Slasher.
- **2026-11-12 — The marketplace plugin carries no hooks.** Selected by the engineer on the agent's recommendation, after the startup display printed twice. Before `/install` the hooks do nothing, and after it the installed project's own plugin runs them, so a copy in the marketplace plugin only runs each hook a second time.
- **2026-11-12 — The marketplace plugin carries only `/install`.** Selected by the engineer on the agent's recommendation, after the scratch project showed every command under both `slasher:` and `foundation:`. Before `/install` the other commands stop at their first step, and after it the installed project's own plugin carries them.

## What happened

- **2026-11-11** — `build-marketplace-plugin.sh <package>` builds a package's plugin in `plugins/<package>/`: the package's skills, its hooks, and a manifest the script writes. Its test has three checks: *Writes a manifest naming the package*, *Copies the package's skills*, and *Copies the package's hooks*. The skills and hooks checks are coverage, added at the engineer's selection, since the build already copied both.
- **2026-11-11** — The copied hooks run scripts from the project's own `slasher/system/` or `system/`. A project that installs the plugin from the marketplace without Slasher's installer has neither, so its hooks do nothing.
- **2026-11-11** — `claude plugin validate` passes on the worktree's built marketplace, with three warnings: no marketplace description, and no plugin version or author.
- **2026-11-11** — The engineer added the worktree as a marketplace in a project without Slasher, and installed `foundation@slasher` from it. The install worked. `/foundation:log` stopped at its first step: the skill runs `slasher/system/foundation/load-rules.sh`, and the project has neither the loader nor the rules. The plugin carries skills and hooks, and no rule loader or rule files.
- **2026-11-11** — In the scratch project, the engineer reinstalled `foundation@slasher` from the rebuilt marketplace and ran `/foundation:install`. Slasher installed, and a log entry was then written there.
- **2026-11-11** — After the restart, each command appeared once, though the project then held both the marketplace's `foundation` plugin and the installer's `slasher` plugin. The startup display printed twice, once for each plugin's `SessionStart` hook.
- **2026-11-12** — The engineer reinstalled the hookless `foundation@slasher` in the scratch project with `--scope project`, and restarted Claude Code. The startup display printed once, and the reinstall worked.
- **2026-11-12** — The engineer found every command listed under both `slasher:` and `foundation:` in the scratch project.
- **2026-11-12** — The engineer reinstalled the install-only `foundation@slasher` in the scratch project with `--scope project`, and restarted Claude Code. Each command appeared once, under `slasher:`, with only `/foundation:install` under `foundation:`.

## Confirmations

- **2026-11-11** — Working location: branch and worktree, selected by the engineer.
- **2026-11-11** — Participation: Attended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 80%, Your approval 60%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-11** — Forecast: no forecast, selected by the engineer.
- **2026-11-11** — Kind: changed from a feature to an experiment, at the engineer's direction. The branch `feature/worktree/third-party-marketplace` was renamed `experiment/worktree/third-party-marketplace`, and its worktree moved from `../slasher-feature-worktree-third-party-marketplace` to `../slasher-experiment-worktree-third-party-marketplace`.
- **2026-11-11** — Forecast: changed from no forecast to a stated forecast, at the engineer's direction.
- **2026-11-11** — Test names: *Writes a manifest naming the package*, *Copies the package's skills*, and *Copies the package's hooks*, selected by the agent under `/unattended`. Each names what its check establishes, as a behavior, in the verb-first form the other shell tests use, such as *Retags an observation as a note*. None starts with *Is*, since only the manifest check compares a value, and the three read as one set.

---

Authored by Scott Bellware on Wed Nov 11 2026 at 12:33:36 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:45:02 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:46:14 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:59:05 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:09:35 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 3:14:03 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 9:05:43 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 9:10:12 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 9:16:33 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 9:27:33 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 9:51:15 AM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 9:56:30 AM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:01:46 AM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:04:51 AM PT
