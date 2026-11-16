# The installer fails silently where a project already has an AGENTS.md

- **State:** Open
- **Tags:** [problem]

**Installing Slasher into a project that already has an `AGENTS.md` leaves the `AGENTS.md` unchanged, and says nothing.** The Slasher bootstrap is not added, so the rules do not load, and nothing tells the engineer why.

**Reported by James Hughes**, who installed Slasher into a repository he had worked in for a few months. He worked around it by copying a Slasher `AGENTS.md` into the project as `SLASHER.md`, and appending `@SLASHER.md` to the end of his own `AGENTS.md`. With that, Slasher behaves as expected.

**As James Hughes stated it:** "I ran it on a repository where I've been doing work for a few months and it looks like it bailed out on modifying the exisitng AGENTS.md. I copied a slasher AGENTS.md to the project, and renamed it SLASHER.md and appended an @SLASHER.md to the bottom of my AGENTS.md and it seems to all be behaving as expected. But maybe there ought to be a warning there's an existing AGENTS.md? or prompt to append to the bottom of AGENTS.md? It was just a silent failure."

---

Authored by Scott Bellware on Sun Nov 15 2026 at 4:38:17 PM PT
