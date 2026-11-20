# Loop record — Progression replaces implementation

`install.sh` gains `migrate_progressions`, which moves a Slasher project's `implementations/` to `progressions/` and conforms the forms of *implementation* whose sense is the record. The status line script becomes `current-progression.sh` and reads `progressions/` and the `Progression branch:` line. It is the code half of the feature `2026-11-20T08-18-26Z-progression-replaces-implementation`.

**Mode:** unattended.

## Cycle 1 — the directory moves

- **Hinge, actuation:** `install.sh agents-md`, run from a project's root, as the other record migrations' tests run it. The migration runs in every mode, so no new argument is needed.
- **Hinge, observation:** the record found under `progressions/`, and `implementations/` gone.
- **Hinge, controls:** a temporary project holding one record in `slasher/local/implementations/`.
- **Hinge, implementation:** written directly, in the form of `migrate_items`: a plain `mv`, only where `progressions/` is absent.
- **Hinge, naming:** *Moves implementations/ to progressions/*.
- **Outcome:** `test/automated/install-progressions/directory.sh` failed before the migration existed, and passes with it.

## Cycle 2 — both directories present

- **Hinge, actuation:** the same.
- **Hinge, observation:** each directory's contents, unchanged.
- **Hinge, controls:** one record in each directory.
- **Hinge, implementation:** the clash is reported, and the migration returns before it conforms anything.
- **Hinge, naming:** *When both implementations/ and progressions/ are present: Touches neither*.
- **Outcome:** `test/automated/install-progressions/directory-clash.sh` was uncontested before the migration existed, since nothing moved anything. With the migration, it holds for its own reason.

## Cycle 3 — the item lines

- **Hinge, actuation:** the same.
- **Hinge, observation:** the item's `**State:**` line, and its `**Implementation:**` line, read back.
- **Hinge, controls:** an item whose state is Implementation, and an item that names its feature on an `**Implementation:**` line.
- **Hinge, implementation:** one `sed` pass over every record except the journal's, with an expression for each form whose sense is the record.
- **Hinge, naming:** *Changes an item's Implementation state line to Progression* and *Changes an item's Implementation line to Progression*.
- **Outcome:** `item-state.sh` and `item-line.sh` failed before the pass, and pass with it.

## Cycle 4 — the record text

- **Hinge, actuation:** the same.
- **Hinge, observation:** the record's branch line, its path, *implementation record* with its article, and *the implementation hinge* left as written.
- **Hinge, controls:** a record in `implementations/` and a loop record, each carrying both senses. The control for the code sense is what makes the test discriminate, since a pass that changed every *implementation* would otherwise pass.
- **Hinge, implementation:** the same pass. *an implementation record* takes *a*, so the article is changed first. A script cannot tell the two senses apart in ordinary prose, so the pass changes only the forms whose sense is the record.
- **Hinge, naming:** *Changes the Implementation branch line to Progression branch*, *Changes implementation record, and its paths, to progression record*, and *Leaves implementation in its other sense*.
- **Outcome:** `record-text.sh` failed before the pass, and passes with it. The article case was added after this repository's own records showed *an progression record*.

## Cycle 5 — the file names and the journal

- **Hinge, actuation:** the same.
- **Hinge, observation:** the log directory's names, and a journal entry's text.
- **Hinge, controls:** log entries named for the Implementation state, one named for the implementation hinge, and a journal entry that says `implementations/`.
- **Hinge, implementation:** a log entry ending `-is-implementation.md`, `-reaches-implementation.md`, or `-takes-implementation.md` is renamed, only where the new name is absent. The journal is left out of the pass, since it holds the writer's words.
- **Hinge, naming:** *Renames a log entry that records the Implementation state, and no other* and *Leaves a journal entry as written*.
- **Outcome:** `file-names.sh` failed before, and passes. `journal.sh` was uncontested, and holds for its own reason with the pass in place.

## Cycle 6 — the status line script

- **Hinge, actuation:** `current-progression.sh`, run from a project's root, the existing actuation under its new name.
- **Hinge, observation and controls:** the existing tests, with their records in `progressions/` and their branch lines as `Progression branch:`.
- **Hinge, implementation:** the script, its two tests, the status line, and the interactive status line test are renamed and conformed.
- **Outcome:** the tests pass.

## Outcome

- The automated suite passes: 137 tests.
- `install-record-names-without-state.sh` reads the record from `progressions/`, since the installer now moves the directory after it removes the state.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 12:32:16 AM PT
