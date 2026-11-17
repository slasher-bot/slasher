# Edit walks the content paragraph by paragraph, then sentence by sentence

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

Related:

- the content-is-judged-by-named-criteria-for-each-paragraph-and-each-sentence rule — the criteria each paragraph and sentence is judged by
- the the-review-command-suggests-numbered-edits-and-accept-or-reject-settles-them rule — the suggestion a rewrite becomes, and how it is settled
- the print-and-review-prints-the-draft-and-a-review-of-it rule — a whole draft reviewed in one answer

---

Authored by Scott Bellware on Mon Nov 16 2026 at 6:08:38 PM PT
