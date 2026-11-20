# A /prose command, with critique and review subcommands

**State:** Open

**Tags:** [idea]

A "/prose" command, with subcommands like "critique" and "review", which does the paragraph-by-paragraph and sentence-by-sentence review.

## Explanation (2026-11-19)

- What it proposes: one `/prose` command, with subcommands such as `critique` and `review`, that reviews content paragraph by paragraph, then sentence by sentence.
- What the `prose` package already has:
  - `/edit` walks content paragraph by paragraph, then sentence by sentence.
  - `/review` suggests numbered edits, and accept or reject settles each.
  - `/print-and-review`, or `/pr`, prints the draft, then a review of it.
- What it leaves open:
  - What `critique` does that `/review` does not.
  - Whether `/edit`, `/review`, and `/print-and-review` become subcommands of `/prose`, stay as they are, or stay as aliases of the new subcommands.

---

Authored by Scott Bellware on Wed Nov 18 2026 at 7:25:07 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 5:21:27 PM PT
