# Loop record — The bootstrap in slasher/SLASHER.md

The bootstrap moves out of a project's `AGENTS.md` into `slasher/SLASHER.md`, which only Slasher writes. The project's `AGENTS.md` keeps its own text and the line `@slasher/SLASHER.md`.

**Mode:** unattended. The engineer selected it at the start, and accepted the plan.

## 1. An old section that differs

- **Hinge:** what the installer does with a Slasher section that is not exactly the current bootstrap.
- **Decision:** it changes nothing and says how to replace the section by hand. The section runs to the end of the file with no end marker, so the project's own text below it cannot be told from Slasher's. That is the case the item reported. Removing it automatically would delete the engineer's text.

## 2. An old section that matches

- **Hinge:** whether the installer replaces a section that is exactly the current bootstrap.
- **Decision:** it does, keeping the text above it. The match proves the span is Slasher's alone, and `/package update` kept most projects' sections current, so this is the common case.

## 3. What the update says

- **Hinge:** what `refresh-packages.sh` reports, now that it compares nothing in `AGENTS.md`.
- **Decision:** whether it rewrote `slasher/SLASHER.md`, and, where `AGENTS.md` lacks the line, how to add it. The earlier note about `.claude/settings.json` went with the comparison it was attached to.

## 4. A rule's compressed text

- **Hinge:** how the update rule's changed compressed text is checked.
- **Decision:** by a fresh lister and a fresh checker, as the compression rule requires. The check found one gap that was there before this change, which was repaired, and the re-check kept every directive. Two rules changed only to name `slasher/SLASHER.md`, a name the engineer settled, and were not re-checked.

## Outcome

- `install.sh` writes `slasher/SLASHER.md` and places the line. `refresh-packages.sh` rewrites the file and checks for the line. Eleven tests are new or changed. The automated suite passes: 109 tests.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:25:22 PM PT
