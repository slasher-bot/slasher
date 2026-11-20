# A /prose command

**State:** Open

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

---

Authored by Scott Bellware on Wed Nov 18 2026 at 7:25:07 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 5:21:27 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 6:11:05 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 6:17:05 PM PT
