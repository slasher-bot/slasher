# Loop record — /package update runs the installer's migrations

`/package update` runs the migrations of the installer it just pulled, after the pull, through a new installer mode, `install.sh migrate`. One update brings a Slasher project both its new packages and their migrations.

**Mode:** unattended. The engineer selected it at the start, and accepted the plan.

## 1. A mode of the installer

- **Hinge:** whether the update runs `install.sh agents-md`, or a mode made for it.
- **Decision:** a mode made for it, `install.sh migrate`. `agents-md` places files and asks before changing an `AGENTS.md` the project maintains, and fails where no one answers. An update runs with no one to answer, and must not fail for that, or create files a project chose not to have.

## 2. What the mode runs

- **Hinge:** which of the installer's steps count as migrations.
- **Decision:** the layout and machine moves, the record migrations, and the `AGENTS.md` replacement where the section is Slasher's alone. It does not write `slasher/SLASHER.md`, since the update does that just before. It places no `CLAUDE.md`, settings file, or plugin.

## 3. An AGENTS.md with no Slasher section

- **Hinge:** what the mode does where `AGENTS.md` lacks the line and holds no Slasher section.
- **Decision:** nothing. Adding the line needs the engineer's consent, and the update already says the line is missing.

## 4. Which installer runs

- **Hinge:** how the update avoids an installer that has no migrate mode.
- **Decision:** it runs the mode only where the pulled installer holds it, as it already does for the bootstrap. An older installer would take the word as an ordinary run and start installing.

## Outcome

- The installer's `migrate` mode, and the update running it after the pull. Five tests are new. The automated suite passes: 114 tests.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 23:55:01 PT
