# Loop record — The installer fails silently where a project already has an AGENTS.md

The installer takes an explicit answer for a project's existing `AGENTS.md`. Without one, and with no terminal, it stops and exits non-zero, naming the choice. `/install` puts the choice to the engineer, then runs the installer with the answer.

**Mode:** attended.

## 1. Actuation of the append

- **Hinge:** how the installer is given the answer to append the bootstrap to an existing `AGENTS.md`.
- **Options:** `install.sh agents-md --append-agents-md`; `install.sh agents-md --agents-md append`, an option that takes the answer as its value; `SLASHER_AGENTS_MD=append install.sh agents-md`, an environment variable that reaches `install.sh` through `slasher-install` unchanged.
- **Decision / chat:** `--append-agents-md`, selected by the engineer.

## 2. Observation of the append

- **Hinge:** what the test reads about the effect of the append on an existing `AGENTS.md`.
- **Options:** the whole file, against the original content, a blank line, and the bootstrap; the original kept at the start and the bootstrap at the end, as two reads; the `## Slasher` heading alone.
- **Decision / chat:** the whole file, selected by the engineer.

## 3. Controls of the append

- **Hinge:** how the expected text, `control_agents_md_text`, is built.
- **Options:** the original content, a blank line, and what `install.sh bootstrap` prints; the expected text written out in full in the test, the bootstrap included.
- **Decision / chat:** the engineer answered `/idk`, then `/clarify`. The question was explained as where the test gets the bootstrap's forty lines, and the bootstrap from the installer was recommended, since the installer is the one place its text lives. The engineer selected the bootstrap from the installer.

## 4. Implementation of the append

- **Hinge:** how the implementation comes about.
- **Options:** a complete implementation, written directly; red, green, refactor, run first against the installer as it is.
- **Decision / chat:** a complete implementation, selected by the engineer. `install.sh` reads `--append-agents-md`, and where an `AGENTS.md` exists without the bootstrap, appends the bootstrap after a blank line without asking. The test passed, and the automated suite passed: 74 test files.

## 5. Actuation without an answer

- **Hinge:** how the test runs the installer for an existing `AGENTS.md` with no answer and no terminal.
- **Options:** the first outcome's command without `--append-agents-md`, standard input from `/dev/null`, its exit status kept beside its output; something else.
- **Decision / chat:** the command without an answer, selected by the engineer.

## 6. Observation without an answer

- **Hinge:** what the test reads about the run with no answer and no terminal.
- **Options:** the exit status and `AGENTS.md`; the exit status and the output's last line, naming `--append-agents-md`; all three.
- **Decision / chat:** the exit status and `AGENTS.md`, selected by the engineer.

## 7. Controls without an answer

- **Hinge:** the controls for the run with no answer.
- **Options:** the first outcome's project and existing `AGENTS.md`, in this test's own file; something else.
- **Decision / chat:** the same controls, in its own file, selected by the engineer.

## 8. Implementation without an answer

- **Hinge:** how the implementation comes about.
- **Options:** a complete implementation, written directly; red, green, refactor, the test already failing against the installer as it was.
- **Decision / chat:** a complete implementation, selected by the engineer. The installer notes the unanswered question, places everything else, then ends with lines naming `--append-agents-md` and exits with status 1. Both tests passed, and the automated suite passed: 75 test files.

## 9. Actuation of the pass-through

- **Hinge:** how the test runs `slasher-install` with the answer.
- **Options:** `sh slasher-install foundation --append-agents-md`, from a local origin, with no terminal; something else.
- **Decision / chat:** `foundation --append-agents-md`, selected by the engineer.

## 10. Observation of the pass-through

- **Hinge:** what the test reads about the run.
- **Options:** the whole `AGENTS.md`, as in the first outcome; the whole `AGENTS.md` and an exit status of 0.
- **Decision / chat:** the whole `AGENTS.md`, selected by the engineer.

## 11. Controls of the pass-through

- **Hinge:** the local origin `slasher-install` fetches from, and the project it installs into.
- **Options:** an origin made by copying `system/foundation` into a repository and committing it, so it carries the installer as it now stands, with a project whose first commit holds the existing `AGENTS.md`; something else.
- **Decision / chat:** the origin from the working tree, selected by the engineer.

## 12. Implementation of the pass-through

- **Hinge:** how the implementation comes about.
- **Options:** a complete implementation, written directly; red, green, refactor, the test already failing against `slasher-install` as it was.
- **Decision / chat:** a complete implementation, selected by the engineer. `slasher-install` takes `--append-agents-md` out of the names it installs, and passes it on to `install.sh agents-md`. Its usage notes name the option. The test passed, and the automated suite passed: 76 test files.

**Mode, from here:** unattended, at the engineer's direction, after a plan the engineer accepted.

## 13. The /install skill

- **Hinge:** what `/install` does when the installer fails because the `AGENTS.md` question went unanswered.
- **Decision:** it asks through the selection interface whether to append the bootstrap or leave `AGENTS.md` unchanged, and on append runs the installer again with the same words and `--append-agents-md`. The installer's last line is what it recognizes, since that line is the one the installer prints only for this case. On leave, it says the rules will not load, so the engineer is not left with a silent install.

## 14. Naming

- **Hinge:** the names of the four outcomes, and where the two `install.sh` tests sit.
- **Decision:** the two `install.sh` tests are two cases of one feature, an existing `AGENTS.md`, so they take the folder form, `install-agents-md/existing/appended.sh` and `install-agents-md/existing/unanswered.sh`. The appended outcome is *Appends the bootstrap after the existing text*, which says what the whole-file comparison establishes. The unanswered run's exit is an error, so its outcome is *Fails*, with *Unanswered* as its context, and its second outcome is *Leaves AGENTS.md unchanged*. The `slasher-install` outcome is *Passes the answer on to the installer*, since the append itself is the `install.sh` test's.

## 15. What is left out

- **Hinge:** whether the same silent skip of an existing `CLAUDE.md` is fixed here.
- **Decision:** it is noted in the problem item and left. The item reports `AGENTS.md`, and a second answer for `CLAUDE.md` would widen the installer's options beyond what the engineer settled.
