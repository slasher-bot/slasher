# Implementation — The package scripts fetch over HTTPS by default

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Start i1, with i1 the problem item `2026-11-22T06-31-22Z-package-refresh-fails-looking-for-an-ssh-key`

**The package scripts fetch over HTTPS by default, and `SLASHER_ORIGIN` stays the override.** The item's Settled resolution states the decision.

Realizes the problem item `2026-11-22T06-31-22Z-package-refresh-fails-looking-for-an-ssh-key`.

## State

- **State:** Completed

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/package-fetch-https`
- **Base:** `3115b00f`, from `master`, the commit holding this record as first written
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-package-fetch-https`. The main working tree stays on `master`.
- **Participation:** unattended
- **Forecast:** none given.
- **Item:** `2026-11-22T06-31-22Z-package-refresh-fails-looking-for-an-ssh-key`

## Plan, as accepted on 2026-11-25

1. Record the implementation on `master`, then create the branch and worktree.
2. Write the tests first: with `SLASHER_ORIGIN` unset, `update-packages.sh`, `install.sh`, and `slasher-install` fetch from `https://github.com/slasher-bot`. A stand-in `git` records the address, so no network is needed.
3. Change the default in the three scripts. `SLASHER_ORIGIN` stays the override.
4. Update the root README: HTTPS, SSH by `SLASHER_ORIGIN`, and where the variable must be set.
5. Update the ten package READMEs, so their `git subtree` commands use the HTTPS address, with SSH as the alternative.
6. Keep a loop record.
7. Compile, run the automated suite, and commit on the branch.
8. The merge to `master` and the conclusion wait for the engineer.

## What happened

- `update-packages.sh`, `install.sh`, and `slasher-install` fetch from `https://github.com/slasher-bot` where `SLASHER_ORIGIN` is not set. Their comments name `SLASHER_ORIGIN=git@github.com:slasher-bot` as the way to SSH.
- Three tests under `test/automated/default-origin/` were written first. Each failed on the SSH address, and passes now. A stand-in `git` keeps them off the network.
- The root README says the packages are fetched over HTTPS, how to choose SSH, and that a variable set in the Claude desktop app's Environment setting does not reach the commands Claude Code runs, while one set in a shell profile does.
- The ten package READMEs give their `git subtree` commands with the HTTPS address, and name SSH as the alternative.
- The `/slasher-install:install` skill says the installer fetches over HTTPS, and names the SSH override.
- The loop record `local/logs/loops/` holds the hinges of the tests and the change.
- No rule changed, so no compressed text was checked.
- The automated suite passed: 155 test files.

## Confirmations

- **2026-11-25** — Working location: a branch and a worktree, selected by the engineer.
- **2026-11-25** — Participation: Unattended, selected by the engineer. Agent's confidence 85%, risk of redo 15%, It'll work 90%, Your approval 85%, attended confidence 95%. The warning was not shown, and Attended was not recommended.
- **2026-11-25** — Plan: Accept, selected by the engineer.
- **2026-11-25** — Conclusion: Completed, selected by the engineer. The work has no forecast, so no verdict question was asked.
- **2026-11-25** — Branch deletion and worktree removal: Remove and delete, selected by the engineer.

---

Authored by Scott Bellware on Wed Nov 25 2026 at 20:37:18 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:42:14 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:43:38 PT
Changed by Scott Bellware on Wed Nov 25 2026 at 20:43:57 PT
