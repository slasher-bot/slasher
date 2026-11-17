# Compare Slasher's prose utilities with the doc-edit skill

**State:** Completed

**Tags:** [work]

Compare Slasher's prose utilities with the doc-edit skill.

## Comparison, Mon Nov 16 2026

Slasher's prose package holds two commands: `/review`, which suggests numbered edits that `/review accept` or `/review reject` settles, and `/print-and-review`, or `/pr`, which prints the draft whole and then a numbered list of findings. doc-edit is the engineer's own skill, built in a Claude desktop session on Thu May 14 2026 and synced to Claude Code from the engineer's account. It walks a document paragraph by paragraph, then sentence by sentence, giving feedback and no rewrites.

### What each does that the other does not

- **doc-edit walks the document in order.** It numbers every paragraph, p1 to pN, and moves with `next`, `previous`, and `p<n>`. Slasher's commands review the draft as a whole, in one answer.
- **doc-edit has two passes.** A paragraph pass judges structure and flow, clarity and concision, tone and voice, and content gaps. A sentence pass, on the paragraphs the user picks, judges precision, readability, and connection. Slasher names no dimensions: `/print-and-review` judges the draft by its purpose and its reader, and Slasher's own prose by the `language` rules.
- **doc-edit gives no rewrite unless asked.** Each finding names the issue and why it matters. Slasher gives the change: `/review` shows the suggested text beside the original, and each `/print-and-review` finding suggests the change in the words it would use.
- **Slasher settles each change.** `/review` numbers its suggestions, keeps them pending across reviews, and writes only accepted ones, on a selection. doc-edit has no state per finding. Its `commit` writes the changes the user accepted in conversation.
- **doc-edit's print is partial.** `print` gives the document from p1 to the current paragraph, with the agreed changes. `/print-and-review` prints the whole draft, then reviews it.
- **doc-edit says when to stop.** It calls out a paragraph that is clean, acknowledges what works, and asks before the sentence pass. `/print-and-review` says so in one line where nothing needs to change.
- **doc-edit flags writing that draws conclusions for the reader**, such as *clearly* or *this shows that*, where evidence could speak for itself. Slasher's prose package has no such check. The `language` package's answer-is-a-list rule forbids narration and characterizing in the agent's own answers, not in the engineer's content.

### Where they overlap

- Both leave the content unchanged until the user accepts a change.
- Both refuse to manufacture findings for a clean passage.
- Both keep the writer's voice: doc-edit by giving no rewrite, Slasher by showing each suggestion beside the original for the engineer's decision.

### Where they conflict

- doc-edit triggers on its own, on phrases such as *review my writing* or *look at this*. Slasher's commands run only when typed. In a session where both are installed, a request to review content can reach doc-edit before `/review`.
- doc-edit's `next`, `previous`, `print`, and `commit` are bare words. Slasher's `/next` takes the next step of the work under way, and `/print-and-review` prints a draft. The same word means different things in the two.


---

Authored by Scott Bellware on Mon Nov 16 2026 at 12:00:50 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 3:15:53 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 3:16:16 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 3:19:44 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 6:22:14 PM PT
