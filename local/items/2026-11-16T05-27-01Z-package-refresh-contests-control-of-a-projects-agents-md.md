# Package refresh contests control of a project's AGENTS.md

**State:** Resolved

**Tags:** [problem]

Reported by James Hughes:

> Also, I ran /package refresh and now seem to be in a battle with slasher over control of AGENTS.md:
> AGENTS.md: the refresh script reports that the project's root AGENTS.md no longer matches the bootstrap that the refreshed foundation generates.
>
> The fix is to delete the Slasher section of AGENTS.md and run slasher/system/foundation/install.sh agents-md. I guess the remedy is to break up my AGENTS.md and distribute its contents into local/rules and give control of AGENTS.md to slasher?
>
> Ah, it looks like running slasher/system/foundation/install.sh agents-md appends the slasher bootstrap to the end now


## Cause

Added Mon Nov 16 2026. `/package update` compares the project's `AGENTS.md` from the `## Slasher` heading to the end of the file with the bootstrap the installed `foundation` writes. Text of the project's own below that heading is compared too, so the two never match. The bootstrap has one heading and no end marker, so the end of the Slasher section cannot be found once other text follows it.

## Proposed solution

Added Mon Nov 16 2026. Proposed by the agent, not settled.

1. **Markers around the section.** `install.sh` writes the bootstrap between two comment lines no reader sees, one before `## Slasher` and one after the bootstrap's last line.
2. **Only the fenced text is compared.** `/package update` compares the text between the markers with the bootstrap, and nothing outside them. Text above or below the section no longer makes it look out of date.
3. **The update rewrites the section itself.** Where the fenced text differs, `/package update` replaces it in place and reports that it did. Deleting the section by hand and running `install.sh agents-md` is no longer needed.
4. **Existing files get the markers once.** Where only the section follows `## Slasher`, `install.sh` fences it. Where more text follows, it fences only the lines that match the bootstrap, and says what it left outside. Where neither can be done, it changes nothing and says how to fix the file.
5. **Tests first**, one for each outcome: text above the section is ignored, text below it is ignored, an out-of-date section is replaced in place, an unfenced section is fenced, and a file that cannot be fenced is left unchanged.

## The other option weighed

Added Mon Nov 16 2026. Move the bootstrap into a file Slasher owns, with the project's `AGENTS.md` keeping one line that tells the agent to read it first. Nothing in the project's file would change after install. An agent other than Claude Code would read one line of instruction rather than the bootstrap itself, which is easier to skip.

Added Mon Nov 16 2026, on why that line is easier to skip:

- Claude Code is not affected. It expands an `@` import in `CLAUDE.md` and `AGENTS.md`, so it would read the moved bootstrap in full, and its session-start hook delivers the read instruction whatever `AGENTS.md` says.
- An agent that reads `AGENTS.md` as plain text sees one sentence pointing to the other file, not the bootstrap.
- Following that sentence is a step the agent can skip: it has to decide to open a second file before anything else. Skipping a read when the first request looks small is the failure the session-start instruction was written against.
- With the bootstrap in `AGENTS.md` itself, the full instruction is already in front of every agent, and nothing depends on the agent choosing to open another file.

Added Mon Nov 16 2026, on how the option works:

- Today the project's `AGENTS.md` holds the project's own text and the 36 lines of the bootstrap under `## Slasher`, which install writes and update compares.
- Under this option, the bootstrap goes into a file only Slasher writes, such as `slasher/AGENTS.md`, whose name is not settled. The project's `AGENTS.md` holds its own text and one line that points to that file, such as `@slasher/AGENTS.md`.
- Slasher writes its own file whole at install and at every update, and compares nothing. `install.sh` adds the one line to the project's `AGENTS.md` once and never touches it again. Everything else in it is the project's.
- The contest ends, since nothing of Slasher's is left in the project's file to drift, and no comparison reads it.
- Claude Code reads the bootstrap in full: `CLAUDE.md` imports `AGENTS.md`, which imports Slasher's file. That is two levels, within Claude Code's limit of four.
- Codex sees the line as plain text, not an import, and reads the bootstrap only if it decides to open the file. Gemini CLI may expand the line, where it is set up to read `AGENTS.md`. For Cursor it is unknown.
- The line could instead be a sentence that tells the agent to read Slasher's file first. A sentence reads clearly to an agent that does not expand imports, but Claude Code would not expand it either, and would follow it or skip it like any other agent.

## Settled

- **2026-11-16** — Where the bootstrap moves into a file Slasher owns, the file is `slasher/SLASHER.md`, and the line in the project's `AGENTS.md` reads `@slasher/SLASHER.md`. The `@` belongs to the line, not the file name. Codex and Cursor treat an `AGENTS.md` in a subdirectory as instructions for work inside that directory alone, which is wrong for instructions that cover the whole project. No agent picks up `SLASHER.md` on its own, so it is reached only through the line, and its name says it is Slasher's. The cost is that an engineer browsing `slasher/` does not recognize it as an agent instruction file by its name. Whether the bootstrap moves at all is not settled.
- **2026-11-16** — The bootstrap moves into `slasher/SLASHER.md`, and the project's `AGENTS.md` keeps the one line `@slasher/SLASHER.md`. Markers around the section are not built.

**Progression:** `2026-11-17T07-15-50Z-agents-md-bootstrap`, the feature that builds it.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 21:27:01 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 22:57:23 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 23:00:37 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 23:09:37 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 23:14:56 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 23:15:50 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 23:31:06 PT
