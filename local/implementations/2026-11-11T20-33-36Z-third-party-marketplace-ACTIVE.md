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

## What happened

## Confirmations

- **2026-11-11** — Working location: branch and worktree, selected by the engineer.
- **2026-11-11** — Participation: Attended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 80%, Your approval 60%, attended confidence 85%. The warning was shown, and Attended was recommended.
- **2026-11-11** — Forecast: no forecast, selected by the engineer.
- **2026-11-11** — Kind: changed from a feature to an experiment, at the engineer's direction. The branch `feature/worktree/third-party-marketplace` was renamed `experiment/worktree/third-party-marketplace`, and its worktree moved from `../slasher-feature-worktree-third-party-marketplace` to `../slasher-experiment-worktree-third-party-marketplace`.
- **2026-11-11** — Forecast: changed from no forecast to a stated forecast, at the engineer's direction.

---

Authored by Scott Bellware on Wed Nov 11 2026 at 12:33:36 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:45:02 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:46:14 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:59:05 PM PT
