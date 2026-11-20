# Content is judged by named criteria for each paragraph and each sentence

Source: system/prose/source/content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence.md

Trigger: When reviewing or editing content, as with `/prose`, `/edit`, or `/review`

**Trigger:** When reviewing or editing content, as with `/prose`, `/edit`, or `/review`

**Every review of content judges it by the same named criteria.** `/prose edit`, `/prose suggest`, and `/prose critique` each judge by this rule. Content is prose written for people to read, such as a page, a README, an article, or a draft.

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

Trigger: When the engineer types `/prose edit` or `/edit`, or asks to work through content paragraph by paragraph

**Trigger:** When the engineer types `/prose edit` or `/edit`, or asks to work through content paragraph by paragraph

**`/prose edit <content>` walks the content one paragraph at a time.** `/edit` is its short form, and does exactly what it does. Content is prose written for people to read, such as a file, a page, or a draft in the chat. A bare `/prose edit` walks the content the conversation is on. Where the words name no content, or the conversation is on none, say so, and start nothing. It judges each paragraph and each sentence by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule.

**As the engineer stated it:** Do the Both, option, but use the commend "edit" rather than "walkthrough"

**As the engineer later stated it:** `edit` goes paragraph by paragraph, sentence by sentence, allowing the user to `accept`, `reject`, or `ignore`. This reflects the prior implementation of the `doc-edit` rules

**As the engineer later stated it:** The sentences in a paragraph should be numbered as "s1", "s2", etc

**The walk starts by numbering the paragraphs and their sentences.** Read the content whole, for its arc, its tone, and its intent. Number its paragraphs p1, p2, p3, and so on. A heading, a blockquote, and a code block each count as a paragraph where it stands on its own lines. Number the sentences of each paragraph s1, s2, s3, and so on, from 1 in each paragraph. A sentence is named by its paragraph and its number, as p4 s2. Say how many paragraphs there are, then show p1.

**Each paragraph is shown, then its findings, each with a suggestion.** Show the paragraph as written, then each finding: its criterion, what is wrong, and why it matters. Give each finding a suggested change, as a numbered suggestion with the original, the suggested text, and a reason, under the prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them rule. Where the paragraph is clean, say so in a line.

**Each suggestion is accepted, rejected, or ignored.** Ask through the selection interface, one suggestion at a time, with the options *Accept*, *Reject*, and *Ignore*.

1. **Accept** makes the change. In a file, write it at once, since the selection is the engineer's decision. In a draft in the chat, the change stands in the draft.
2. **Reject** drops the suggestion, and changes nothing.
3. **Ignore** changes nothing, and leaves the suggestion pending under its number. `/prose accept` or `/prose reject` can settle it later.

**Subcommands move the walk:**

- **`/prose edit next`**: show the next paragraph and its findings.
- **`/prose edit previous`**: show the previous paragraph and its findings.
- **`/prose edit p<n>`**, as `/prose edit p4`: show that paragraph and its findings, and make it the current one.
- **`/prose edit p<n> s<n>`**, as `/prose edit p4 s2`: judge that sentence by the three sentence criteria, and show it with its findings and suggestions.
- **`/prose edit sentences [p<n> ...]`**: judge the sentences of the paragraphs named, or of every paragraph, by the three sentence criteria. Group the findings by paragraph, and name each sentence a finding is about by its number, as p4 s2, with the sentence quoted.
- **`/prose edit print`**: print the content from p1 to the current paragraph, with every accepted change made.

**After the last paragraph, ask before the sentence pass.** Ask, through the selection interface, whether to judge the sentences of every paragraph, of the paragraphs the engineer names, or of none.

**The walk holds its place for the session.** The paragraph and sentence numbers and the current paragraph stand until a new `/prose edit <content>` starts another walk. An accepted change does not renumber the walk. `/prose edit next` and the other subcommands with no walk started say so, and do nothing.

**`/prose edit` is a subcommand of `/prose`,** in the PROSE command domain, under the prose-reviews-content-through-its-subcommands rule.

**Why:** a long text reviewed in one answer gives the writer every finding at once, and the writer loses the passage each one is about. A walk keeps one paragraph in view with its findings. Numbered paragraphs and sentences let the writer name any passage in a word. Each suggestion is the writer's to accept, reject, or put off, so the writer's words change only by the writer's decision.

**How to apply:** on `/prose edit <content>`, number the paragraphs and their sentences, say how many paragraphs there are, and show p1 with its findings and suggestions. Ask for each suggestion whether to accept, reject, or ignore it. On each subcommand, move the walk and show the paragraph or the sentence with its findings, or judge its sentences, or print the content so far.

# `/prose critique` gives an overall critical review of content

Source: system/prose/source/prose-critique-gives-an-overall-critical-review-of-content.md

Trigger: When the engineer types `/prose critique`, or asks for a critique of content

**Trigger:** When the engineer types `/prose critique`, or asks for a critique of content

**As the engineer stated it:** `critique` provides an overall critical review

**`/prose critique <content>` reviews the content named as a whole.** A bare `/prose critique` reviews the content the conversation is on, with every change made to it so far. Where the words name no content, or the conversation is on none, say so, and review nothing.

**The critique judges the whole before its parts.** It asks whether the content says what it means to, in the order a reader needs, in words the reader holds, for its purpose and its reader. It judges by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule. Where the content is Slasher's own prose, such as a rule or a record, it is also judged by the `language` package's rules.

**The critique is a numbered list of findings, most important first.** Each finding quotes or names the passage it is about, names its criterion, and says what is wrong and why it matters to the reader. The numbers are handles. Where the content works and is worth keeping, say so. Where nothing needs to change, say so in one line, and give no findings to fill the list.

**The critique changes nothing, and suggests no numbered edit.** `/prose suggest` gives numbered edits that `/prose accept` can make. A critique gives the engineer the judgment of the whole, and the engineer decides what to act on.

**Why:** a review of passages one by one does not say whether the whole works. A critique of the whole lets the engineer judge the next change against the text as it is.

**How to apply:** on `/prose critique`, find the content, judge it whole by its criteria, and give a numbered list of findings, most important first. Change nothing.

# `/prose` reviews content through its subcommands

Source: system/prose/source/prose-reviews-content-through-its-subcommands.md

Trigger: When the engineer types `/prose`, `/edit`, `/review`, `/accept`, or `/reject`

**Trigger:** When the engineer types `/prose`, `/edit`, `/review`, `/accept`, or `/reject`

**As the engineer stated it:** A "/prose" command, with subcommands like "edit", "suggest", and "critique", which reviews content.

**As the engineer later stated it:** These will all be subcommands of `/prose`. `/accept` and `/reject` are aliases for `/prose accept` and `prose reject`. `print-and-review` should be removed, along with its `pr` alias.

**As the engineer later selected it:** `/edit` stays as a short form of `/prose edit`, and `/review` as a short form of `/prose suggest`.

**`/prose` reviews content.** Content is prose written for people to read, such as a page, a README, an article, or a draft in the chat. Every subcommand judges it by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule.

**Its subcommands:**

- **`/prose edit`** walks the content paragraph by paragraph, then sentence by sentence, and each suggestion is accepted, rejected, or ignored. The edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence rule governs it.
- **`/prose suggest`** lists numbered suggested edits to the content. The prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them rule governs it.
- **`/prose accept`** and **`/prose reject`** settle pending suggestions by their numbers, as that rule says.
- **`/prose critique`** gives an overall critical review of the content. The prose-critique-gives-an-overall-critical-review-of-content rule governs it.

**A bare `/prose` asks which subcommand is meant**, through the selection interface, under the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule.

**Four short forms do exactly what their subcommands do,** and pass their words on unchanged:

- `/edit` is `/prose edit`.
- `/review` is `/prose suggest`. `/review accept` and `/review reject` are `/prose accept` and `/prose reject`.
- `/accept` is `/prose accept`.
- `/reject` is `/prose reject`.

**Suggestions share one numbering in a session.** A suggestion that `/prose edit` makes and one that `/prose suggest` makes are numbered in the same sequence, so `/accept 3` names one suggestion, whichever subcommand made it.

**`/prose` is the PROSE command domain.** `/prose help` prints its help. `/edit help`, `/review help`, `/accept help`, and `/reject help` say that the command takes no `help`, name `/prose help`, and do nothing more. Claude Code's built-in code-review command also takes `/review`. Where it does, the engineer types `/slasher:review`.

**Why:** the acts of working on content belong together, under one name the engineer can ask for help on. The short forms keep the commands the engineer already types.

**How to apply:** on `/prose`, read the first word as the subcommand, and follow the rule that governs it. With no subcommand, ask which is meant. On a short form, do what its subcommand does.

# `/prose suggest` suggests numbered edits to content, and accept or reject settles them

Source: system/prose/source/prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them.md

Trigger: When the engineer types `/prose suggest`, `/prose accept`, `/prose reject`, `/review`, `/accept`, or `/reject`, or asks for suggested edits to content

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

**A suggestion is pending until it is accepted or rejected.** A later `/prose suggest`, or a `/prose edit` walk, adds its suggestions after the pending ones, and the numbering continues. Neither drops a pending suggestion. A number is never used again in the same session, so a number always names one suggestion.

**`/prose accept` shows the result, then writes it on the engineer's selection.** `/prose accept 1 3`, or `/accept 1 3`, accepts suggestions 1 and 3. A number may be written `#3` or `3`. A bare `/prose accept` accepts every pending suggestion. Show each changed passage as it would read. Then ask, through the selection interface, whether to write the changes to the file, with the options *Write the changes* and *Something else — say what to change*. Write them only on that selection. An accepted suggestion stops being pending when its change is written. Where the engineer does not select writing, the suggestions stay pending.

**Where the content is a draft in the chat, accepting prints the revised draft.** There is no file to write, so show the draft with the accepted changes made, and ask nothing.

**`/prose reject` drops suggestions and changes nothing.** `/prose reject 2`, or `/reject 2`, drops suggestion 2. A bare `/prose reject` drops every pending suggestion. Say which numbers were dropped.

**A number that names no pending suggestion is not guessed at.** Say so, and act on the other numbers named. Where no suggestion is pending, `/prose accept` and `/prose reject` say so, and do nothing.

**`/prose suggest`, `/prose accept`, and `/prose reject` are subcommands of `/prose`,** in the PROSE command domain. `/review` is a short form of `/prose suggest`, and `/review accept` and `/review reject` of `/prose accept` and `/prose reject`, under the prose-reviews-content-through-its-subcommands rule.

**Why:** the content is the engineer's, and each change to it is the engineer's decision. A suggestion shown beside the original lets the engineer judge it before anything changes. Showing the result before writing it lets the engineer see the accepted changes together. Pending suggestions are kept, so a second review loses nothing from the first.

**How to apply:** on `/prose suggest`, suggest numbered edits to the content named, or to the content the conversation is on, and change nothing. On `/prose accept`, show the result of the accepted suggestions, and write it only on the engineer's selection. On `/prose reject`, drop the suggestions named.
