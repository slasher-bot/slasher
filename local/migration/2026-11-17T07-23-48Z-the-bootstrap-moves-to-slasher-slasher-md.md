# The bootstrap moves to slasher/SLASHER.md

**A Slasher project's bootstrap leaves its `AGENTS.md` for `slasher/SLASHER.md`, a file only Slasher writes.** The project's `AGENTS.md` keeps its own text and the line `@slasher/SLASHER.md`. The feature `2026-11-17T07-15-50Z-agents-md-bootstrap` makes the change. This record plans it in each Slasher project that installs `foundation`.

## Source and destination

- **Source:** the section of a project's `AGENTS.md` from `## Slasher` to the end of the file.
- **Destination:** `slasher/SLASHER.md`, with the line `@slasher/SLASHER.md` in the project's `AGENTS.md`.
- **Repositories:** this one, the `foundation` component repository it publishes to, and each Slasher project that installs `foundation`. No Slasher project is named here.

## Increments, in order

1. On `feature/worktree/agents-md-bootstrap`: `install.sh` writes `slasher/SLASHER.md` and puts the line in `AGENTS.md`. `refresh-packages.sh` rewrites `slasher/SLASHER.md` and says where `AGENTS.md` lacks the line.
2. The feature completes, and the branch merges to `master`.
3. `foundation` is compiled and published from `master`, following `CONTRIBUTING.md`.
4. Each Slasher project updates its packages. The update writes `slasher/SLASHER.md`, and says that `AGENTS.md` lacks the line.
5. In each Slasher project, `install.sh agents-md` is run. Where the section from `## Slasher` to the end of `AGENTS.md` is exactly the current bootstrap, it becomes the line. Where it differs, the installer changes nothing and says how to replace it by hand.

## What is true in between

- **Between increments 4 and 5, in each Slasher project:** `AGENTS.md` still holds its old section, and `slasher/SLASHER.md` holds the new bootstrap, which nothing imports yet. The old section still activates the system.
- **After increment 5:** `AGENTS.md` holds the project's own text and the line. Nothing of it is compared or rewritten again.
- **A project whose section differs** keeps it until the engineer replaces it with the line. A project's own text below the section is what makes it differ, and only the engineer can tell the two apart.

## What happened

- **2026-11-16** — Increment 1 is made on `feature/worktree/agents-md-bootstrap`.
- **2026-11-16** — Increment 2: the feature is Completed and merges to `master`.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:23:48 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 11:31:06 PM PT
