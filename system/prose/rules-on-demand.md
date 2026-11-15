# Print-and-review prints the draft and a review of it

Source: system/prose/source/print-and-review-prints-the-draft-and-a-review-of-it.md

Trigger: When the engineer types `/print-and-review` or `/pr`, or asks for the draft to be printed and reviewed

**Trigger:** When the engineer types `/print-and-review` or `/pr`, or asks for the draft to be printed and reviewed

**`/print-and-review` prints the draft as it now stands, then a review of it.** `/pr` is its shortcut alias. The draft is the text the conversation is working on, such as an article, a page, a message, or a rule, with every change made to it so far. `/pr <file>` names a file, and the draft is that file's text.

**As the engineer stated it:** "/reprint-and-review" command with a "/rr" shortcut alias. This is useful typically in content editing when working a draft of a text. It asks the agent to reprint the text so far, and to follow it with a review or critique.

**As the engineer later stated it:** Change "/reprint-and-review" to "/print-and-review"

**As the engineer later stated it:** Change "/rr" to "/pr"

**The draft is printed whole and unchanged.** Print it as it stands, in a fenced block where it is markdown or code, so its form is seen as written. Do not correct it while printing it.

**The review follows the draft, as a numbered list of findings, most important first.** Each finding quotes the passage it is about, says what is wrong with it, and suggests a change in the words the change would use. The numbers are handles, so the engineer can answer *take 2 and 4*.

**The review judges the draft by its purpose and its reader.** It asks whether the draft says what it means to, in the order a reader needs, in words the reader holds. Where the draft is Slasher's own prose, such as a rule or a record, it is also judged by the `language` package's rules. Where nothing needs to change, say so in one line, and give no findings to fill the list.

**The command changes nothing.** It does not edit the draft or its file. The engineer decides which findings to act on, and asks for the change.

**Where no draft is under way, and no file is named, say so, and ask which text is meant**, through the free-text option.

**Why:** a draft worked on in conversation is changed a piece at a time, and its whole is not seen again until it is asked for. Seeing the whole and a critique of it together lets the engineer judge the next change against the text as it is, not as remembered.

**How to apply:** on `/print-and-review` or `/pr`, find the draft, or read the file named. Print it whole and unchanged. Then give a numbered list of findings, each quoting its passage, naming what is wrong, and suggesting the change. Change nothing.

# The review command suggests numbered edits to content, and accept or reject settles them

Source: system/prose/source/the-review-command-suggests-numbered-edits-and-accept-or-reject-settles-them.md

Trigger: When the engineer types `/review`, or asks for suggested edits to content

**Trigger:** When the engineer types `/review`, or asks for suggested edits to content

**As the engineer stated it:** "/edit" command. It tells the agent to suggest edits to content. "/edit accept" tells the agent to incorporate the suggest edits. "/edit reject" tells the agent to not incorporate the agent's sugested edits.

**As the engineer later stated it:** It should be "/suggest" rather than "/edit"

**As the engineer later stated it:** Change "/suggest" to "/review"

**As the engineer later selected it:** `/suggest`, since Claude Code's built-in code-review command takes `/review`

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

**`/review` is the REVIEW command domain.** `/review help` prints its help. Claude Code's built-in code-review command also takes `/review`. Where it does, the engineer types `/slasher:review`, `/slasher:review accept`, and `/slasher:review reject`.

**Why:** the content is the engineer's, and each change to it is the engineer's decision. A suggestion shown beside the original lets the engineer judge it before anything changes. Showing the result before writing it lets the engineer see the accepted changes together. Pending suggestions are kept, so a second review loses nothing from the first.

**How to apply:** on `/review`, suggest numbered edits to the content named, or to the content the conversation is on, and change nothing. On `/review accept`, show the result of the accepted suggestions, and write it only on the engineer's selection. On `/review reject`, drop the suggestions named.
