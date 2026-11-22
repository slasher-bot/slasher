# `/prose suggest` suggests numbered edits to content, and accept or reject settles them

**Trigger:** When the engineer types `/prose suggest`, `/prose accept`, `/prose reject`, `/review`, `/accept`, or `/reject`, or asks for suggested edits to content

**As the engineer stated it:** "/edit" command. It tells the agent to suggest edits to content. "/edit accept" tells the agent to incorporate the suggest edits. "/edit reject" tells the agent to not incorporate the agent's sugested edits.

**As the engineer later stated it:** It should be "/suggest" rather than "/edit"

**As the engineer later stated it:** Change "/suggest" to "/review"

**As the engineer later selected it:** `/suggest`, since Claude Code's built-in code-review command takes `/review`

**As the engineer later stated it:** Change "/suggest" to "/review"

**As the engineer later stated it:** `suggest` lists suggested changes in a numbered list. A change can be rejected or rejected using `/accept <number>` and `/reject <number>`, eg: `/accept #3` or `/reject #3`. `/accept` and `/reject` are aliases for `/prose accept` and `prose reject`.

**`/prose suggest <content>` suggests edits to the content the words name.** A bare `/prose suggest` suggests edits to the content the conversation is on. Content is prose, such as a page, a README, an article, or a draft in the chat. Where the words name no content, or the conversation is on none, say so, and suggest nothing. Where the words name more than one piece of content, ask which, through the selection interface.

**Suggest, and change nothing.** A suggestion leaves the content as it is. The content changes only when the engineer accepts a suggestion and selects writing it.

**Suggestions are made by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule.** A suggestion is made only where a passage falls short of a criterion, and its reason opens with that criterion. Where nothing needs to change, say so in one line, and suggest nothing to fill the list.

**Each suggestion is numbered, and shows the original, the suggested text, and a reason.** Give each suggestion a number, then a short heading that names the passage. Under the heading, give the original text, the suggested text, and a one-line reason, each on its own line:

```
1. Receipt heading

   Original:  Thanks for your purchase!!
   Suggested: Thank you for your order.
   Reason:    Tone and voice. One exclamation mark is enough, and "order" matches the cart.

2. Refund line

   Original:  Refunds may be possible in some cases.
   Suggested: You can return any item within 30 days for a refund.
   Reason:    Precision. It states the policy and does not hedge.
```

**A suggestion is pending until it is accepted or rejected.** A later `/prose suggest`, or a `/prose line-edit` walk, adds its suggestions after the pending ones, and the numbering continues. Neither drops a pending suggestion. A number is never used again in the same session, so a number always names one suggestion.

**`/prose accept` shows the result, then writes it on the engineer's selection.** `/prose accept 1 3`, or `/accept 1 3`, accepts suggestions 1 and 3. A number may be written `#3` or `3`. A bare `/prose accept` accepts every pending suggestion. Show each changed passage as it would read. Then ask, through the selection interface, whether to write the changes to the file, with the options *Write the changes* and *Something else — say what to change*. Write them only on that selection. An accepted suggestion stops being pending when its change is written. Where the engineer does not select writing, the suggestions stay pending.

**Where the content is a draft in the chat, accepting prints the revised draft.** There is no file to write, so show the draft with the accepted changes made, and ask nothing.

**`/prose reject` drops suggestions and changes nothing.** `/prose reject 2`, or `/reject 2`, drops suggestion 2. A bare `/prose reject` drops every pending suggestion. Say which numbers were dropped.

**A number that names no pending suggestion is not guessed at.** Say so, and act on the other numbers named. Where no suggestion is pending, `/prose accept` and `/prose reject` say so, and do nothing.

**`/prose suggest`, `/prose accept`, and `/prose reject` are subcommands of `/prose`,** in the PROSE command domain. `/review` is a short form of `/prose suggest`, and `/review accept` and `/review reject` of `/prose accept` and `/prose reject`, under the prose-reviews-content-through-its-subcommands rule.

**Why:** the content is the engineer's, and each change to it is the engineer's decision. A suggestion shown beside the original lets the engineer judge it before anything changes. Showing the result before writing it lets the engineer see the accepted changes together. Pending suggestions are kept, so a second review loses nothing from the first.

**How to apply:** on `/prose suggest`, suggest numbered edits to the content named, or to the content the conversation is on, and change nothing. On `/prose accept`, show the result of the accepted suggestions, and write it only on the engineer's selection. On `/prose reject`, drop the suggestions named.

## History

Until Thu Nov 19 2026 this rule was the the-review-command-suggests-numbered-edits-and-accept-or-reject-settles-them rule, and governed `/review`, `/review accept`, and `/review reject`, the REVIEW command domain. The engineer made them subcommands of `/prose`, and kept `/review` as a short form.

Until Mon Nov 16 2026 a suggestion's reason named no criterion.

Related:

- the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule — the criteria each suggestion's reason names
- the prose-reviews-content-through-its-subcommands rule — the command this is a subcommand of, and its short forms
- the line-edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence rule — a walk whose suggestions share this numbering
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question `/prose accept` asks before it writes
- the prose-critique-gives-an-overall-critical-review-of-content rule — a review of the whole, which suggests no numbered edits

---

Authored by Scott Bellware on Sun Nov 15 2026 at 12:02:19 PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:29:39 PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:32:30 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 18:08:58 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 18:31:25 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 11:50:20 PT
