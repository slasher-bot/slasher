# A line edit walks the content paragraph by paragraph, then sentence by sentence

**Trigger:** When the engineer types `/prose line-edit` or `/line-edit`, or asks to work through content paragraph by paragraph

**`/prose line-edit <content>` walks the content one paragraph at a time.** `/line-edit` is its short form, and does exactly what it does. Content is prose written for people to read, such as a file, a page, or a draft in the chat. A bare `/prose line-edit` walks the content the conversation is on. Where the words name no content, or the conversation is on none, say so, and start nothing. It judges each paragraph and each sentence by the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule.

**As the engineer stated it:** Do the Both, option, but use the commend "edit" rather than "walkthrough"

**As the engineer later stated it:** `edit` goes paragraph by paragraph, sentence by sentence, allowing the user to `accept`, `reject`, or `ignore`. This reflects the prior implementation of the `doc-edit` rules

**As the engineer later stated it:** The sentences in a paragraph should be numbered as "s1", "s2", etc

**As the engineer later stated it:** Change "/prose edit" to "/prose line-edit". Asked what becomes of the short form `/edit`, the engineer selected *Rename to /line-edit*.

**The walk starts by numbering the paragraphs and their sentences.** Read the content whole, for its arc, its tone, and its intent. Number its paragraphs p1, p2, p3, and so on. A heading, a blockquote, and a code block each count as a paragraph where it stands on its own lines. Number the sentences of each paragraph s1, s2, s3, and so on, from 1 in each paragraph. A sentence is named by its paragraph and its number, as p4 s2. Say how many paragraphs there are, then show p1.

**Each paragraph is shown, then its findings, each with a suggestion.** Show the paragraph as written, then each finding: its criterion, what is wrong, and why it matters. Give each finding a suggested change, as a numbered suggestion with the original, the suggested text, and a reason, under the prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them rule. Where the paragraph is clean, say so in a line.

**Each suggestion is accepted, rejected, or ignored.** Ask through the selection interface, one suggestion at a time, with the options *Accept*, *Reject*, and *Ignore*.

1. **Accept** makes the change. In a file, write it at once, since the selection is the engineer's decision. In a draft in the chat, the change stands in the draft.
2. **Reject** drops the suggestion, and changes nothing.
3. **Ignore** changes nothing, and leaves the suggestion pending under its number. `/prose accept` or `/prose reject` can settle it later.

**Subcommands move the walk:**

- **`/prose line-edit next`**: show the next paragraph and its findings.
- **`/prose line-edit previous`**: show the previous paragraph and its findings.
- **`/prose line-edit p<n>`**, as `/prose line-edit p4`: show that paragraph and its findings, and make it the current one.
- **`/prose line-edit p<n> s<n>`**, as `/prose line-edit p4 s2`: judge that sentence by the three sentence criteria, and show it with its findings and suggestions.
- **`/prose line-edit sentences [p<n> ...]`**: judge the sentences of the paragraphs named, or of every paragraph, by the three sentence criteria. Group the findings by paragraph, and name each sentence a finding is about by its number, as p4 s2, with the sentence quoted.
- **`/prose line-edit print`**: print the content from p1 to the current paragraph, with every accepted change made.

**After the last paragraph, ask before the sentence pass.** Ask, through the selection interface, whether to judge the sentences of every paragraph, of the paragraphs the engineer names, or of none.

**The walk holds its place for the session.** The paragraph and sentence numbers and the current paragraph stand until a new `/prose line-edit <content>` starts another walk. An accepted change does not renumber the walk. `/prose line-edit next` and the other subcommands with no walk started say so, and do nothing.

**`/prose line-edit` is a subcommand of `/prose`,** in the PROSE command domain, under the prose-reviews-content-through-its-subcommands rule.

**Why:** a long text reviewed in one answer gives the writer every finding at once, and the writer loses the passage each one is about. A walk keeps one paragraph in view with its findings. Numbered paragraphs and sentences let the writer name any passage in a word. Each suggestion is the writer's to accept, reject, or put off, so the writer's words change only by the writer's decision.

**How to apply:** on `/prose line-edit <content>`, number the paragraphs and their sentences, say how many paragraphs there are, and show p1 with its findings and suggestions. Ask for each suggestion whether to accept, reject, or ignore it. On each subcommand, move the walk and show the paragraph or the sentence with its findings, or judge its sentences, or print the content so far.

## History

Until Thu Nov 19 2026 the command was `/edit`, in the REVIEW command domain. The engineer made it `/prose edit`, and kept `/edit` as its short form.

Until Fri Nov 20 2026 the command was `/prose edit`, its short form was `/edit`, and the rule was named edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence. The engineer renamed the command `/prose line-edit`, the publishing term for an edit of each sentence for clarity, word choice, and flow, and its short form `/line-edit`.

Until Thu Nov 19 2026 a walk gave findings and no rewrite, and a rewrite the engineer asked for became a `/review` suggestion. Sentences had no numbers, and a sentence finding quoted its sentence. The engineer settled that each suggestion is accepted, rejected, or ignored, and that sentences are numbered s1, s2.

Related:

- the prose-reviews-content-through-its-subcommands rule — the command this is a subcommand of
- the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule — the criteria each paragraph and sentence is judged by
- the prose-suggest-suggests-numbered-edits-and-accept-or-reject-settles-them rule — the numbered suggestion each finding gives, and how a pending one is settled
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question each suggestion asks

---

Authored by Scott Bellware on Mon Nov 16 2026 at 18:08:38 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 18:31:25 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 11:50:20 PT
