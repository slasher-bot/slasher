# Implementation — The package scripts fetch over HTTPS by default

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Start i1, with i1 the problem item `2026-11-22T06-31-22Z-package-refresh-fails-looking-for-an-ssh-key`

**The package scripts fetch over HTTPS by default, and `SLASHER_ORIGIN` stays the override.** The item's Settled resolution states the decision.

Realizes the problem item `2026-11-22T06-31-22Z-package-refresh-fails-looking-for-an-ssh-key`.

## State

- **State:** Active

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/package-fetch-https`
- **Base:** the commit on `master` that holds this record as first written
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

## Confirmations

- **2026-11-25** — Working location: a branch and a worktree, selected by the engineer.
- **2026-11-25** — Participation: Unattended, selected by the engineer. Agent's confidence 85%, risk of redo 15%, It'll work 90%, Your approval 85%, attended confidence 95%. The warning was not shown, and Attended was not recommended.
- **2026-11-25** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Wed Nov 25 2026 at 20:37:18 PT
