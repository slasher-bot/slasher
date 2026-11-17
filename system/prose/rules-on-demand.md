# Content is judged by named criteria for each paragraph and each sentence

Source: system/prose/source/content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence.md

Trigger: When reviewing or editing content, as with `/review`, `/print-and-review`, or `/edit`

**Trigger:** When reviewing or editing content, as with `/review`, `/print-and-review`, or `/edit`

**Every review of content judges it by the same named criteria.** `/review`, `/print-and-review`, and `/edit` each judge by this rule. Content is prose written for people to read, such as a page, a README, an article, or a draft.

**A paragraph is judged by four criteria:**

- **Structure and flow**: the paragraph holds together, connects to the paragraphs beside it, and serves a purpose in the text.
- **Clarity and concision**: its meaning is clear on a first read, and nothing in it is vague, repeated, or longer than it needs to be.
- **Tone and voice**: it sounds like the rest of the text, in a register that fits the reader.
- **Content gaps**: nothing the reader needs is missing, thin, or assumed.

**A sentence is judged by three criteria:**

- **Precision**: it says exactly what it means, and each word does work.
- **Readability**: it can be followed on a first read. A long sentence is not a fault. A tangled one is.
- **Connection**: it follows from the sentence before it, with no missing or abrupt transition.

**A passage that breaks the `language` package's writing-states-the-evidence-and-the-reader-draws-the-conclusion rule is a finding under tone and voice.**

**Each finding names its criterion, what is wrong, and why it matters to the reader.** Judge the text by its kind and its reader: a personal essay and a business proposal hold different standards. Judge it by the writer's voice, not the agent's: a phrasing the agent would write differently is not a finding unless it is unclear.

**A passage with nothing wrong is said to be clean, in a line.** Name what works where it is worth keeping, since knowing what to keep is as useful as knowing what to change. Give no finding to fill a criterion.

**Why:** a review that names its criteria judges every text the same way, and lets the writer see why a finding was made. A finding manufactured to fill a list costs the writer time, and hides the findings that matter.

**How to apply:** on any review of content, judge each paragraph by its four criteria and, where sentences are reviewed, each sentence by its three. Name the criterion in each finding, say what is wrong and why it matters, and say where a passage is clean.

# Edit walks the content paragraph by paragraph, then sentence by sentence

Source: system/prose/source/edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence.md

Trigger: When the engineer types `/edit`, or asks to work through content paragraph by paragraph

**Trigger:** When the engineer types `/edit`, or asks to work through content paragraph by paragraph

**`/edit <content>` walks the content one paragraph at a time.** Content is prose written for people to read, such as a file, a page, or a draft in the chat. A bare `/edit` walks the content the conversation is on. Where the words name no content, or the conversation is on none, say so, and start nothing. It judges each paragraph by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule.

**As the engineer stated it:** Do the Both, option, but use the commend "edit" rather than "walkthrough"

**The walk starts by numbering the paragraphs.** Read the content whole, for its arc, its tone, and its intent. Number its paragraphs p1, p2, p3, and so on. A heading, a blockquote, and a code block each count as a paragraph where it stands on its own lines. Say how many paragraphs there are, then show p1 and its findings.

**Each paragraph is shown, then its findings.** Show the paragraph as written, then each finding: its criterion, what is wrong, and why it matters. Give no rewrite. Where the paragraph is clean, say so in a line.

**Subcommands move the walk:**

- **`/edit next`**: show the next paragraph and its findings.
- **`/edit previous`**: show the previous paragraph and its findings.
- **`/edit p<n>`**, as `/edit p4`: show that paragraph and its findings, and make it the current one.
- **`/edit sentences [p<n> ...]`**: judge the sentences of the paragraphs named, or of every paragraph, by the three sentence criteria. Group the findings by paragraph, and quote each sentence a finding is about.
- **`/edit print`**: print the content from p1 to the current paragraph, with every accepted change made.

**After the last paragraph, ask before the sentence pass.** Ask, through the selection interface, whether to judge the sentences of every paragraph, of the paragraphs the engineer names, or of none.

**A rewrite asked for becomes a `/review` suggestion.** Where the engineer asks for a rewrite of a finding, give it as a numbered suggestion, with the original, the suggested text, and a reason, under the the-review-command-suggests-numbered-edits-and-accept-or-reject-settles-them rule. `/review accept` and `/review reject` settle it, and `/review accept` writes it. `/edit` writes nothing itself.

**The walk holds its place for the session.** The paragraph numbers and the current paragraph stand until a new `/edit <content>` starts another walk. `/edit next` and the other subcommands with no walk started say so, and do nothing.

**`/edit` is in the REVIEW command domain.** `/edit help` says that the command takes no `help`, and names `/review help`.

**Why:** a long text reviewed in one answer gives the writer every finding at once, and the writer loses the passage each one is about. A walk keeps one paragraph in view with its findings. Findings without a rewrite keep the writer's words the writer's, and a rewrite the writer asks for is settled the way every suggested edit is.

**How to apply:** on `/edit <content>`, number the paragraphs, say how many, and show p1 with its findings. On each subcommand, move the walk and show the paragraph with its findings, or judge its sentences, or print the content so far. Give no rewrite unless asked, and give one as a `/review` suggestion.

# Print-and-review prints the draft and a review of it

Source: system/prose/source/print-and-review-prints-the-draft-and-a-review-of-it.md

Trigger: When the engineer types `/print-and-review` or `/pr`, or asks for the draft to be printed and reviewed

**Trigger:** When the engineer types `/print-and-review` or `/pr`, or asks for the draft to be printed and reviewed

**`/print-and-review` prints the draft as it now stands, then a review of it.** `/pr` is its shortcut alias. The draft is the text the conversation is working on, such as an article, a page, a message, or a rule, with every change made to it so far. `/pr <file>` names a file, and the draft is that file's text.

**As the engineer stated it:** "/reprint-and-review" command with a "/rr" shortcut alias. This is useful typically in content editing when working a draft of a text. It asks the agent to reprint the text so far, and to follow it with a review or critique.

**As the engineer later stated it:** Change "/reprint-and-review" to "/print-and-review"

**As the engineer later stated it:** Change "/rr" to "/pr"

**The draft is printed whole and unchanged.** Print it as it stands, in a fenced block where it is markdown or code, so its form is seen as written. Do not correct it while printing it.

**The review follows the draft, as a numbered list of findings, most important first.** Each finding quotes the passage it is about, names its criterion, says what is wrong with it and why it matters, and suggests a change in the words the change would use. The numbers are handles, so the engineer can answer *take 2 and 4*.

**The review judges the draft by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule, for its purpose and its reader.** It asks whether the draft says what it means to, in the order a reader needs, in words the reader holds. Where the draft is Slasher's own prose, such as a rule or a record, it is also judged by the `language` package's rules. Where nothing needs to change, say so in one line, and give no findings to fill the list. Where a passage works and is worth keeping, say so.

**The command changes nothing.** It does not edit the draft or its file. The engineer decides which findings to act on, and asks for the change.

**Where no draft is under way, and no file is named, say so, and ask which text is meant**, through the free-text option.

**Why:** a draft worked on in conversation is changed a piece at a time, and its whole is not seen again until it is asked for. Seeing the whole and a critique of it together lets the engineer judge the next change against the text as it is, not as remembered.

**How to apply:** on `/print-and-review` or `/pr`, find the draft, or read the file named. Print it whole and unchanged. Then give a numbered list of findings, each quoting its passage, naming its criterion and what is wrong, and suggesting the change. Change nothing.

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

**A suggestion is pending until it is accepted or rejected.** A later `/review` adds its suggestions after the pending ones, and the numbering continues. A later `/review` drops no pending suggestion. A number is never used again in the same session, so a number always names one suggestion.

**`/review accept` shows the result, then writes it on the engineer's selection.** `/review accept 1 3` accepts suggestions 1 and 3. A bare `/review accept` accepts every pending suggestion. Show each changed passage as it would read. Then ask, through the selection interface, whether to write the changes to the file, with the options *Write the changes* and *Something else — say what to change*. Write them only on that selection. An accepted suggestion stops being pending when its change is written. Where the engineer does not select writing, the suggestions stay pending.

**Where the content is a draft in the chat, accepting prints the revised draft.** There is no file to write, so show the draft with the accepted changes made, and ask nothing.

**`/review reject` drops suggestions and changes nothing.** `/review reject 2` drops suggestion 2. A bare `/review reject` drops every pending suggestion. Say which numbers were dropped.

**A number that names no pending suggestion is not guessed at.** Say so, and act on the other numbers named. Where no suggestion is pending, `/review accept` and `/review reject` say so, and do nothing.

**`/review` is the REVIEW command domain.** `/review help` prints its help. Claude Code's built-in code-review command also takes `/review`. Where it does, the engineer types `/slasher:review`, `/slasher:review accept`, and `/slasher:review reject`.

**Why:** the content is the engineer's, and each change to it is the engineer's decision. A suggestion shown beside the original lets the engineer judge it before anything changes. Showing the result before writing it lets the engineer see the accepted changes together. Pending suggestions are kept, so a second review loses nothing from the first.

**How to apply:** on `/review`, suggest numbered edits to the content named, or to the content the conversation is on, and change nothing. On `/review accept`, show the result of the accepted suggestions, and write it only on the engineer's selection. On `/review reject`, drop the suggestions named.
