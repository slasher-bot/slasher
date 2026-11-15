# The review command suggests numbered edits to content, and accept or reject settles them

**Trigger:** When the engineer types `/review`, or asks for suggested edits to content

**As the engineer stated it:** "/edit" command. It tells the agent to suggest edits to content. "/edit accept" tells the agent to incorporate the suggest edits. "/edit reject" tells the agent to not incorporate the agent's sugested edits.

**As the engineer later stated it:** It should be "/suggest" rather than "/edit"

**As the engineer later stated it:** Change "/suggest" to "/review"

**`/review <content>` suggests edits to the content the words name.** A bare `/review` suggests edits to the content the conversation is on. Content is prose, such as a page, a README, an article, or a draft in the chat. Where the words name no content, or the conversation is on none, say so, and suggest nothing. Where the words name more than one piece of content, ask which, through the selection interface.

**Suggest, and change nothing.** A suggestion leaves the content as it is. The content changes only when the engineer accepts a suggestion and selects writing it.

**Each suggestion is numbered, and shows the original, the suggested text, and a reason.** Give each suggestion a number, then a short heading that names the passage. Under the heading, give the original text, the suggested text, and a one-line reason, each on its own line:

```
1. Receipt heading

   Original:  Thanks for your purchase!!
   Suggested: Thank you for your order.
   Reason:    One exclamation mark is enough. "Order" matches the cart.

2. Refund line

   Original:  Refunds may be possible in some cases.
   Suggested: You can return any item within 30 days for a refund.
   Reason:    It states the policy and does not hedge.
```

**A suggestion is pending until it is accepted or rejected.** A later `/review` adds its suggestions after the pending ones, and the numbering continues. A later `/review` drops no pending suggestion. A number is never used again in the same session, so a number always names one suggestion.

**`/review accept` shows the result, then writes it on the engineer's selection.** `/review accept 1 3` accepts suggestions 1 and 3. A bare `/review accept` accepts every pending suggestion. Show each changed passage as it would read. Then ask, through the selection interface, whether to write the changes to the file, with the options *Write the changes* and *Something else — say what to change*. Write them only on that selection. An accepted suggestion stops being pending when its change is written. Where the engineer does not select writing, the suggestions stay pending.

**Where the content is a draft in the chat, accepting prints the revised draft.** There is no file to write, so show the draft with the accepted changes made, and ask nothing.

**`/review reject` drops suggestions and changes nothing.** `/review reject 2` drops suggestion 2. A bare `/review reject` drops every pending suggestion. Say which numbers were dropped.

**A number that names no pending suggestion is not guessed at.** Say so, and act on the other numbers named. Where no suggestion is pending, `/review accept` and `/review reject` say so, and do nothing.

**`/review` is the REVIEW command domain.** `/review help` prints its help.

**Why:** the content is the engineer's, and each change to it is the engineer's decision. A suggestion shown beside the original lets the engineer judge it before anything changes. Showing the result before writing it lets the engineer see the accepted changes together. Pending suggestions are kept, so a second review loses nothing from the first.

**How to apply:** on `/review`, suggest numbered edits to the content named, or to the content the conversation is on, and change nothing. On `/review accept`, show the result of the accepted suggestions, and write it only on the engineer's selection. On `/review reject`, drop the suggestions named.

Related:

- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question `/review accept` asks before it writes
- the reprint-and-review-prints-the-draft-and-a-review-of-it rule — a review of a draft, which suggests no numbered edits

---

Authored by Scott Bellware on Sun Nov 15 2026 at 12:02:19 PM PT
