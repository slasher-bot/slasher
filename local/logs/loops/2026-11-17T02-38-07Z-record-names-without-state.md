# Loop record — Record names without state

An item's or a progression record's file name carries no state, so its path stays the same for the record's whole life. A Slasher project's records are renamed by `install.sh` when its packages are updated.

**Mode:** unattended. The engineer selected it at the start, and accepted the plan.

## 1. The migration's actuation

- **Hinge:** how a Slasher project's records lose their suffix.
- **Decision:** a function in `install.sh`, `migrate_record_names`, run by `install.sh agents-md` after the older migrations. The test actuates `install.sh agents-md` in a project holding a suffixed item and a suffixed progression record. Every earlier record migration is a function there, actuated the same way, and `/package update` reaches it.

## 2. What counts as the state

- **Hinge:** which part of a name is the state.
- **Decision:** the last dash and an upper-case word before `.md`. A name is lower-case by the file-names rule, so an upper-case last segment can only be the state. Matching a list of state words would miss a state word added later, and older words such as `STATED` and `DONE`.

## 3. A clash

- **Hinge:** what happens where the name without the state is taken.
- **Decision:** neither file moves, and `install.sh` says so. Two names that differ only in their state, as `-STATED` beside `-RECORDED`, are left alone the same way. Every earlier migration reports a clash and leaves it, and an older test already required both observation files to stay as they were.

## 4. The older migration tests

- **Hinge:** what the older tests expect, now that every record loses its suffix.
- **Decision:** a test whose suffix only named its control record now names it without one. A test that checked a renamed file now expects the name without the state, and its name says so. Their State-line observations stay as they were, since those migrations still change the State line.

## 5. The status line

- **Hinge:** how `current-progression.sh` finds a current progression without the suffix.
- **Decision:** it reads each record's `**State:**` line for Open, Active, or Suspended, with or without the leading dash. The State line is the only statement of the state, so this works for either form of name.

## 6. The rule

- **Hinge:** whether the suffix rule is removed or rewritten.
- **Decision:** rewritten and renamed a-records-file-name-carries-no-state, with the old rule in its History. The rule still has work to do: it says the name carries no state, that a state change renames nothing, and what `install.sh` does for a Slasher project.

## Outcome

- 240 records renamed in this repository. Eight rules changed, with History lines, and six compressed texts checked. The automated suite passes: 82 tests.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 6:38:07 PM PT
