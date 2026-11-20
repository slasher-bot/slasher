# Implementation becomes progression

**Progression replaces implementation as the name of a bounded piece of work on its own branch, and a progression's file is a progression record.** The work item `2026-11-20T07-31-09Z-progression-replaces-implementation` settles the change, and the feature `2026-11-20T08-18-26Z-progression-replaces-implementation` makes it. This record plans it in this repository and in each Slasher project that installs `foundation`. Within this migration, the migration rule takes precedence over the disclosure rule, so historical records are conformed too.

## Source and destination

- **Source:** the record sense of *implementation*: the directory `implementations/`, the item state `Implementation`, the `Implementation branch:` line, an item's `Implementation:` line, *implementation record*, and the rule, script, and record names that carry the word in that sense.
- **Destination:** *progression*: the directory `progressions/`, the item state `Progression`, the `Progression branch:` line, an item's `Progression:` line, *progression record*, and the same names with *progression* in place of *implementation*.
- **Not moved:** *implementation* in its other sense, the code that satisfies a test, as in the implementation hinge. Journal entries keep the writer's words. Record titles such as `Feature — …` keep the kind.
- **Repositories:** this one, the component repositories it publishes to, and each Slasher project that installs `foundation`. No Slasher project is named here.

## Increments, in order

1. On `feature/worktree/progression-replaces-implementation`: `install.sh` gains the migration that conforms a project's local directory. The scripts read `progressions/` and the `Progression branch:` line. The rules, the vocabulary, the skills, their help, and the command table say progression where they meant the record. This repository's own local directory is conformed: its directory, its items, its progression records, its loop records, its work session records, its log, its migration records, and the file names that carry the word in the record sense.
2. The feature completes, and the branch merges to `master`.
3. The packages are compiled and published from `master`, following `CONTRIBUTING.md`.
4. Each Slasher project updates its packages. The update runs `install.sh migrate` with the installer it just pulled, and the migration conforms the project's local directory.

## What the migration changes in a Slasher project

The migration acts only on forms whose sense is the record, since a script cannot tell the two senses apart in a sentence:

- `implementations/` moves to `progressions/`, only where `progressions/` is absent. A clash is reported and left alone.
- An item's `**State:** Implementation` line becomes `**State:** Progression`.
- An item's `**Implementation:**` line becomes `**Progression:**`.
- In every record under the local directory except the journal, `implementations/` becomes `progressions/`, `Implementation branch:` becomes `Progression branch:`, and *implementation record* becomes *progression record*, in each case and number.
- A log entry's file name ending `-is-implementation.md`, `-reaches-implementation.md`, or `-takes-implementation.md` takes `progression` in place of `implementation`, only where the new name is absent.

Prose that says *implementation* in a sentence the script cannot read is left as written. In this repository it is judged and conformed by the agent, record by record.

## What is true in between

- **During increment 1, on the branch:** `master` still holds `local/implementations/` and the old rules. The feature record and this migration record sit there under the old names until the branch merges.
- **Between increments 3 and 4, in each Slasher project:** the installed scripts read `progressions/`, and the project's records are still in `implementations/`. The status line shows no progression under way, and `/current` lists none, until the migration runs. The update runs it at once, so the gap closes in the same command, unless the migration reports a clash.
- **After increment 4:** the project's records are in `progressions/`, and its items and records say progression in every form the migration reaches.

## What happened

- **2026-11-20** — The feature record and this migration record are written on `master`.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 12:18:26 AM PT
