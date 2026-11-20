# Work Session — An existing AGENTS.md at install (2026-11-15)

This work session tested James Hughes's report that the installer fails silently where a project already has an `AGENTS.md`, and fixed it. The test showed the failure is not silent at the installer, but is lost under `/install`. The fix gives the installer an explicit answer, fails loudly without one, and has `/install` ask. It ran attended through three outcomes, then unattended to the end, at the engineer's direction.

This is the communicable record of the work session, a guided tour. The item, progression record, loop record, and log entries it points to are the source of truth.

## 1. The test

The installer was run into a test project with its own `AGENTS.md`, with no terminal attached, as the agent runs it. It printed the bootstrap and one line saying `AGENTS.md` was not modified, then went on and exited as a success. `/install` always runs it that way. The results are in the item.

- Item: `2026-11-16T00-38-17Z-the-installer-fails-silently-where-a-project-already-has-an-agents-md`, Resolved

## 2. The fix

The engineer answered the question of the fix with `/idk`, and the agent explained four options and recommended one. The engineer selected it: the installer takes an explicit answer, `--append-agents-md`. Without one, and with no terminal, it fails and names the answer, and `/install` asks the engineer.

## 3. The hinges, attended

Each outcome went through actuation, observation, controls, and implementation. The engineer answered the controls hinge of the first outcome with `/idk`, then `/clarify`. The question was explained again as where the test gets the bootstrap's forty lines.

- **Appended**: `install.sh agents-md --append-agents-md` appends the bootstrap after the existing text. The test compares the whole file, with the bootstrap taken from `install.sh bootstrap`.
- **Unanswered**: with no answer, the run fails and leaves `AGENTS.md` unchanged. The installer places everything else first, then ends with the lines that say so.
- **Passed on**: `slasher-install` takes `--append-agents-md` out of the names it installs, and passes it to `install.sh`.

## 4. Unattended, to the end

The engineer directed the rest unattended, and accepted the plan. `/install` asks whether to append when the installer fails that way. The tests were named, and the two `install.sh` tests took the folder form. The READMEs say how an existing `AGENTS.md` is handled. An existing `CLAUDE.md` without `@AGENTS.md` is skipped the same way, which is noted in the item and not fixed. The engineer asked for the selection to be simulated, and the agent drew it.

- Progression record: `2026-11-16T00-59-24Z-existing-agents-md-install`
- Loop record: `2026-11-16T01-03-54Z-existing-agents-md-install`

## 5. The conclusion

The engineer concluded the feature Completed. It merged to `master`, and the automated suite passed: 76 test files. The problem item is Resolved. The worktree and the branch were removed on the engineer's selection.

## Takeaways

- A prompt in a script fails silently when an agent runs the script, because no terminal is attached. An explicit answer, and a failing exit without one, let the agent ask instead.
- `--append-agents-md` answers the installer's question in advance, and `/install` asks for it.
- The same gap remains for an existing `CLAUDE.md`.

## Glossary

- **bootstrap** — the section the installer writes into a project's `AGENTS.md`, headed `## Slasher`, that tells the agent to read the rules at session start.

## Where the durable records live

- `local/items/`: the AGENTS.md problem item, Resolved, with the test results.
- `local/progressions/`: the existing AGENTS.md install progression record.
- `local/logs/loops/`: the loop record, attended and then unattended.
- `local/logs/log/`: an entry for each decision and each change of state.
- `system/foundation/install.sh`, `slasher-install`, the `install` skill, and the tests under `test/automated/install-agents-md/` and `test/automated/slasher-install/agents-md/`.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 5:29:32 PM PT
