# A /prose command

**State:** Realized

**Tags:** [idea]

A "/prose" command, with subcommands like "edit", "suggest", and "critique", which reviews content.

## Explanation (2026-11-19)

These will all be subcommands of `/prose`
- `edit` goes paragraph by paragraph, sentence by sentence, allowing the user to `accept`, `reject`, or `ignore`. This reflects the prior implementation of the `doc-edit` rules
- `suggest` lists suggested changes in a numbered list. A change can be rejected or rejected using `/accept <number>` and `/reject <number>`, eg: `/accept #3` or `/reject #3`. `/accept` and `/reject` are aliases for `/prose accept` and `prose reject`.
- `critique` provides an overall critical review
- `print-and-review` should be removed, along with its `pr` alias


**Settled:**

- **2026-11-19** — `edit` numbers the sentences in a paragraph s1, s2, and so on. **As the engineer stated it:** The sentences in a paragraph should be numbered as "s1", "s2", etc

**Progression:** `2026-11-20T02-27-27Z-prose-command`

---

Authored by Scott Bellware on Wed Nov 18 2026 at 19:25:07 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 17:21:27 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 18:11:05 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 18:17:05 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 18:27:27 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 18:34:53 PT
