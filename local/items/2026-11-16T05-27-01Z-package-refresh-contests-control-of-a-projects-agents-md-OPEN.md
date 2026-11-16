# Package refresh contests control of a project's AGENTS.md

**State:** Open

**Tags:** [problem]

Reported by James Hughes:

> Also, I ran /package refresh and now seem to be in a battle with slasher over control of AGENTS.md:
> AGENTS.md: the refresh script reports that the project's root AGENTS.md no longer matches the bootstrap that the refreshed foundation generates.
>
> The fix is to delete the Slasher section of AGENTS.md and run slasher/system/foundation/install.sh agents-md. I guess the remedy is to break up my AGENTS.md and distribute its contents into local/rules and give control of AGENTS.md to slasher?
>
> Ah, it looks like running slasher/system/foundation/install.sh agents-md appends the slasher bootstrap to the end now

---

Authored by Scott Bellware on Sun Nov 15 2026 at 9:27:01 PM PT
