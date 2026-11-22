# `/prose` reviews content through its subcommands

**Trigger:** When the engineer types `/prose`, `/line-edit`, `/review`, `/accept`, or `/reject`

**As the engineer stated it:** A "/prose" command, with subcommands like "edit", "suggest", and "critique", which reviews content.

**As the engineer later stated it:** These will all be subcommands of `/prose`. `/accept` and `/reject` are aliases for `/prose accept` and `prose reject`. `print-and-review` should be removed, along with its `pr` alias.

**As the engineer later selected it:** `/edit` stays as a short form of `/prose edit`, and `/review` as a short form of `/prose suggest`.

**As the engineer later stated it:** Change "/prose edit" to "/prose line-edit". Asked what becomes of the short form `/edit`, the engineer selected *Rename to /line-edit*.

**`/prose` reviews content.** Content is prose written for people to read, such as a page, a README, an article, or a draft in the chat. Every subcommand judges it by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule.

**Its subcommands:**

- **`/prose line-edit`** walks the content paragraph by paragraph, then sentence by sentence, and each suggestion is accepted, rejected, or ignored. The line-edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence rule governs it.
- **`/prose suggest`** lists numbered suggested edits to the content. The prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them rule governs it.
- **`/prose accept`** and **`/prose reject`** settle pending suggestions by their numbers, as that rule says.
- **`/prose critique`** gives an overall critical review of the content. The prose-critique-gives-an-overall-critical-review-of-content rule governs it.

**A bare `/prose` asks which subcommand is meant**, through the selection interface, under the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule.

**Four short forms do exactly what their subcommands do,** and pass their words on unchanged:

- `/line-edit` is `/prose line-edit`.
- `/review` is `/prose suggest`. `/review accept` and `/review reject` are `/prose accept` and `/prose reject`.
- `/accept` is `/prose accept`.
- `/reject` is `/prose reject`.

**Suggestions share one numbering in a session.** A suggestion that `/prose line-edit` makes and one that `/prose suggest` makes are numbered in the same sequence, so `/accept 3` names one suggestion, whichever subcommand made it.

**`/prose` is the PROSE command domain.** `/prose help` prints its help. `/line-edit help`, `/review help`, `/accept help`, and `/reject help` say that the command takes no `help`, name `/prose help`, and do nothing more. Claude Code's built-in code-review command also takes `/review`. Where it does, the engineer types `/slasher:review`.

**Why:** the acts of working on content belong together, under one name the engineer can ask for help on. The short forms keep the commands the engineer already types.

**How to apply:** on `/prose`, read the first word as the subcommand, and follow the rule that governs it. With no subcommand, ask which is meant. On a short form, do what its subcommand does.

## History

Until Fri Nov 20 2026 the walk was the subcommand `/prose edit`, with the short form `/edit`. The engineer renamed them `/prose line-edit` and `/line-edit`.

Related:

- the line-edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence rule — `/prose line-edit`
- the prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them rule — `/prose suggest`, `/prose accept`, and `/prose reject`
- the prose-critique-gives-an-overall-critical-review-of-content rule — `/prose critique`
- the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule — the criteria every subcommand judges by

---

Authored by Scott Bellware on Thu Nov 19 2026 at 18:31:25 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 11:50:20 PT
