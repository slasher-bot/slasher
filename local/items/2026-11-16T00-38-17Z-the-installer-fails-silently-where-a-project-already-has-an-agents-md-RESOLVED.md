# The installer fails silently where a project already has an AGENTS.md

- **State:** Resolved
- **Tags:** [problem]

**Installing Slasher into a project that already has an `AGENTS.md` leaves the `AGENTS.md` unchanged, and says nothing.** The Slasher bootstrap is not added, so the rules do not load, and nothing tells the engineer why.

**Reported by James Hughes**, who installed Slasher into a repository he had worked in for a few months. He worked around it by copying a Slasher `AGENTS.md` into the project as `SLASHER.md`, and appending `@SLASHER.md` to the end of his own `AGENTS.md`. With that, Slasher behaves as expected.

**As James Hughes stated it:** "I ran it on a repository where I've been doing work for a few months and it looks like it bailed out on modifying the exisitng AGENTS.md. I copied a slasher AGENTS.md to the project, and renamed it SLASHER.md and appended an @SLASHER.md to the bottom of my AGENTS.md and it seems to all be behaving as expected. But maybe there ought to be a warning there's an existing AGENTS.md? or prompt to append to the bottom of AGENTS.md? It was just a silent failure."

## Test results, 2026-11-15

The failure was reproduced in a test project holding its own `AGENTS.md`, by running `slasher/system/foundation/install.sh agents-md` with no terminal on standard input, as it runs when the agent runs it.

1. The installer printed the bootstrap section, then *Not running interactively, so AGENTS.md was NOT modified.*
2. It then created `CLAUDE.md` with `@AGENTS.md`, and `.claude/settings.json` with the status line, and exited with status 0.
3. `AGENTS.md` was unchanged. `CLAUDE.md` imports it, but it carries no Slasher bootstrap, so the rules never load.
4. The one warning line stands after about forty lines of bootstrap text, and success lines follow it.
5. `/install` runs `slasher-install` through the agent, so standard input is never a terminal there. Every `/install` into a project with an `AGENTS.md` leaves it unchanged. The `install` skill says nothing of the warning.
6. Run in a terminal, as `sh slasher-install`, the installer asks whether to append the bootstrap.

**A note, 2026-11-15:** an existing `CLAUDE.md` that does not import `AGENTS.md` is skipped the same way. With no terminal, the installer prints that it was not modified, and goes on. The feature for this item does not change that.

**Implementation:** `2026-11-16T00-59-24Z-existing-agents-md-install`

---

Authored by Scott Bellware on Sun Nov 15 2026 at 4:38:17 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 4:47:41 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 4:59:24 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 5:21:45 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 5:28:08 PM PT
