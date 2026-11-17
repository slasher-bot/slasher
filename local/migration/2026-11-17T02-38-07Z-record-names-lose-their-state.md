# Record names lose their state

**An item's or an implementation record's file name carries no state.** It ended with its state in upper case, as `-OPEN` or `-COMPLETED`, until the feature `2026-11-17T02-31-38Z-record-names-without-state`. This record plans the change in this repository and in every Slasher project that installs `foundation`.

## Source and destination

- **Source:** names such as `2026-01-01T00-00-00Z-the-cart-keeps-its-contents-OPEN.md`, in `local/items/` and `local/implementations/`, and the `foundation` rules that require the suffix.
- **Destination:** names such as `2026-01-01T00-00-00Z-the-cart-keeps-its-contents.md`, in the same directories, and rules that say a name carries no state.
- **Repositories:** this one, the `foundation` component repository it publishes to, and each Slasher project that installs `foundation`. No Slasher project is named here.

## Increments, in order

1. On `feature/worktree/record-names-without-state`: the a-records-file-name-carries-no-state rule replaces the rule that required the suffix, and the rules that cite it change to match. `install.sh` gains a migration that takes the state off a record's name. `current-implementation.sh` reads the `**State:**` line in place of the name. This repository's items and implementation records are renamed with `git mv`.
2. The feature completes, and the branch merges to `master`. Any record written on `master` with a suffix after the branch was created is renamed there, at the merge.
3. `foundation` is compiled and published from `master`, following `CONTRIBUTING.md`.
4. Each Slasher project updates its packages with `/package update`, or installs Slasher. `install.sh` renames its items and implementation records.

**How a Slasher project's records are renamed:** `install.sh` takes the last dash and the upper-case word before `.md` off each name in `slasher/local/items/` and `slasher/local/implementations/`. A record moves only where the name without the state is free. Where it is taken, or two names differ only in their state, it renames neither and says so. The content of a record does not change. The migration runs after the older ones, which find a record by its suffix.

## What is true in between

- **Between increments 1 and 2:** `master` writes names with a suffix, and the feature branch writes names without one. `master` is authoritative.
- **Between increments 3 and 4, in each Slasher project:** its installed rules require a suffix until it updates. After it updates, `install.sh` has already renamed its records, so its names and its rules agree.
- **The status line in a Slasher project** reads the `**State:**` line after it updates, so it finds the current implementation under either form of name.
- **Text that records history keeps the old names.** A log entry, a work session record, a rule's History section, and a path in an earlier record are not revised. Such a path is unresolvable, and a reader finds the record by its prefix and name.

## What happened

- **2026-11-16** — Increment 1 is made on `feature/worktree/record-names-without-state`. 240 records are renamed in this repository.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 6:38:07 PM PT
