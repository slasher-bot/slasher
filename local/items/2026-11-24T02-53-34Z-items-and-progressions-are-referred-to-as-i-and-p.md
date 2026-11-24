# Items are referred to as i<number> and progressions as p<letter>

**State:** Open

**Tags:** [work]

**As the engineer stated it:** Refer to items as i<ordinal number> and refer to progressions as p<ordinal letter>

A row of a printed list is referred to by its ordinal with a prefix that names its kind: an item as `i1`, `i2`, and a progression as `pA`, `pB`. Today an item's row is referred to as `#1` or `1`, and a progression's as `A`.

## The prefix p is also a paragraph

The `prose` package's line-edit rule numbers a piece of content's paragraphs `p1`, `p2`, and their sentences `s1`, `s2`, as in `/prose line-edit p4 s2`.

- **A command can tell the two apart.** A paragraph's reference ends in a number, and a progression's in a letter, as `pA`, then `pAA` after Z. No value is both. Paragraph references go to `/prose line-edit` only. Row references go to `/open`, `/print`, `/work-status`, and the status commands.
- **A reader may not.** The prefix `p` would name a paragraph in prose work and a progression everywhere else, and the language rules hold a term to one meaning. Both can arise in one session: in a line edit of a progression's content, `pB` is the progression and `p4` a paragraph in it. In free text, as "fix p2" or "look at pB", only the character after the `p` says which is meant, and `pa` and `p4` are one keystroke apart.
- **Two ways out, neither settled.** Progressions take a prefix nothing else uses, as `gA` or `rA`. Or line-edit's paragraphs take another prefix.

## Settled

- **2026-11-23** — A progression's row takes the prefix `p`, as `pA`, and line edit's paragraphs keep `p`, as `p4`. A letter or a digit after the `p` says which is meant. Selected by the engineer.
- **2026-11-23** — The prefix appears in commands only. A printed list keeps its ordinals as `1` and `A`, and a command accepts `i1` and `pA` as well. Selected by the engineer.
- **2026-11-23** — The forms in use today still work: `#1`, `1`, and `i1` each name an item's row, and `A` and `pA` each name a progression's row. Selected by the engineer.
- **2026-11-23** — **As the engineer stated it:** Actually, print them in the table. A printed list's first column carries the prefixed ordinal, as `i1` for an item and `pA` for a progression. This replaces the earlier resolution that the prefix appears in commands only.
- **2026-11-23** — A reference may be typed in either case, prefix and letter alike: `I1` names the same row as `i1`, and `Pa`, `pa`, and `PA` the same row as `pA`. A list prints `i1` and `pA`. Selected by the engineer.

---

Authored by Scott Bellware on Mon Nov 23 2026 at 18:53:34 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:32:54 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:39:06 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:39:55 PT
Changed by Scott Bellware on Mon Nov 23 2026 at 22:43:53 PT
