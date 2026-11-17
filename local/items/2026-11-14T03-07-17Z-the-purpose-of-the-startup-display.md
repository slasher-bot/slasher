# The purpose of the startup display

- **State:** Recorded
- **Tags:** [brainstorm]

## Reframed

1. **The startup display has no stated purpose.** Lines were added one at a time, each for a reason, and nobody decided what the display is for. The display is now cluttered. Removing the open-implementations line is one instance of that larger question.
2. **A candidate purpose: tell the engineer where they are and what is going on.** The display is not a report of everything that is open.
3. **A candidate principle: the display shows only actionable information.** What counts as actionable is not settled:
   - Unpushed commits may be actionable.
   - The current branch is context, not an action, but it is useful.
   - Open implementations are useful sometimes, and not at every session start.
4. **A distinction to examine: what needs the engineer's attention, against what only exists.** An open implementation can exist without needing attention at each session start.
5. **Before a line is removed, find whether what it computes is used elsewhere.** The open-implementations count may be computed for the display only, or something else may read it.
6. **Configuration of the display is not wanted.** A sensible default is preferred over a setting for each line.
7. **A question about the process: tiny changes become work items, and the work items then need managing.** It is not settled whether that is a defect or the expected cost of a structured workflow.

## As the engineer said it

Maybe there’s a distinction between things that need my attention and things that just happen to exist. An open implementation isn’t necessarily something I need to know about every time I start a session

I’m thinking about how the startup display is getting too cluttered and whether it should really be showing implementation status at all. It seems like the initialization should just tell me enough to know where I am and what’s going on, not necessarily give me a report of everything that’s open.

wonder whether there should be a principle that startup only shows actionable information. But then what counts as actionable? Unpushed commits might be actionable. The current branch is useful context. Open implementations might be useful sometimes but not always.

Actually maybe the larger issue is that the startup display has gradually accumulated information without anyone deciding what its purpose is. Each addition probably made sense individually but now it’s becoming noisy.

Also need to think about whether removing this line affects anything else. Is the information being calculated just for display or is it used elsewhere? Would be good to avoid accidentally removing something that’s needed.

There’s also this recurring pattern where we record work items for tiny changes and then have to manage the work items themselves. Not sure whether that’s a problem or just the natural cost of having a structured workflow.

Another thought is whether the display should be configurable, although that sounds like overengineering. I’d rather have a sensible default than introduce settings for every little thing.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 7:07:17 PM PT
