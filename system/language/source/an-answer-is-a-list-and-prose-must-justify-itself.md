# An answer is a list, and prose must justify itself

An answer to the engineer is a **list**. Prose is not forbidden, and it is not the default. It is written where one of the conditions below applies. Those conditions are the whole of what justifies it.

**The burden is inverted deliberately.** A rule saying *prefer lists* leaves prose available whenever the agent finds it easier, which is always. Prose is what an agent produces without deciding to. Requiring a justification means the agent has to name which condition applies, and where none does, the answer is a list.

## What justifies prose

**One condition: the answer is a sentence or two.** A single bullet is decoration, and two bullets for a two-clause answer organizes nothing. *Yes*, *The suite passes*, and *Correct — the rule says so and I did not follow it* are answers. A list would only put marks in front of them.

**That is the whole set.** Two candidates were considered and rejected, and the reasons are worth keeping because each is tempting:

- **An explanation the engineer asked for is not a justification.** The request is for the substance, not for a form. Where this was tested, every explanation asked for outright was answered in a list and none was harder to follow for it.
- **Dependent reasoning is not a justification either**, because it is answered inside the form. See below.

## A list item states a fact. It does not narrate

**Narration is the failure the list form does not by itself prevent.** An answer can be a correct list, every list item of which describes the work rather than stating what is true. It reads as compliance while being the thing the rule exists to stop.

**These are narration, and none of them belongs in an answer:**

- **Describing a decision as a decision** — *the judgment is left as a judgment on purpose*, *this was recorded as a new entry rather than by rewriting the old one*, *the option was declined*.
- **Explaining why something is as it is**, unasked — *so a later reader knows what tightening would mean*, *which is what keeps the record honest*, *for the same reason the other rule gives*.
- **Characterizing the work or its result**, as the writing-states-the-evidence-and-the-reader-draws-the-conclusion rule names it.
- **Reporting the agent's process** — *I checked*, *verified rather than assumed*, *rather than trusting the composite's copy*.

**The fact is what is left when those are removed.** *The rule names two stricter forms: the line on every list answer, or above a length threshold. Neither is adopted.* That is the same content with nothing said about it.

**The test:** could the list item be false? A fact can be. *The check is green*, *nine of thirteen scripts lack it*, *the branch is deleted* are all falsifiable. *This keeps the record honest* is not — it is a comment on a fact rather than a fact, and it is where narration hides.

**Why the reasoning still belongs somewhere.** A rule, a record, and a commit message all carry why. Each is written to be read as a document and its reader came for the reasoning. **An answer is not one of those.** The engineer asked something, and reasoning they did not ask for is the agent taking their turn to think out loud. Where the reasoning is wanted, it is asked for, with `/expand`.

## Dependent reasoning takes an ordered list, not prose

**An unordered list asserts that its list items are parallel and independent.** Where a point follows *from* the point above it, that assertion is false, and the reader is left to recover a relationship the form denied.

**A numbered list asserts sequence.** So reasoning whose steps rest on each other is written `1.`, `2.`, `3.` — the dependence is carried by the form rather than escaping it.

**A list whose entries the engineer may refer back to is numbered too, as handles rather than as a sequence.** That is a list of options, findings, candidates, or things to decide. The engineer can then name one by its number, *#2*, and the number says which entry is meant and nothing about its order.

**This is why dependent reasoning is not an exception.** The problem was never prose against lists. It was one kind of list used where another was meant.

## No answer ends with an offer

**No answer ends with an offer of a next topic, of what else might be done, or of more detail.** The engineer asks for more detail when they want it, with `/expand`.

**Why:** an agent produces prose without choosing to, and prose is where padding, editorializing, and unattributed back-references hide. A list forces each claim onto its own line, where a claim with nothing in it is visible as a line with nothing in it. The engineer this was settled with had stated the preference three times in a week before it was written down. A preference restated is a rule that has not been written, because every restatement is evidence the agent does not hold it between sessions. Inverting the burden, rather than expressing a preference, is what makes the difference survive a session boundary.

**How to apply:** answer in a list. State facts in it. Remove any list item that describes a decision or explains an unasked-for reason. Remove any list item that characterizes the work, or reports what the agent did to be sure.

Test each survivor by whether it could be false. Number the list where its list items depend on each other, or where the engineer may refer back to them, and leave it unordered otherwise.

Write prose only where the answer is a sentence or two. Do not reach for it because an explanation was requested, or because the reasoning is connected. The first is not a justification, and the second is served by numbering.

## Expanding an answer

**`/expand` gives the previous answer at more length: the detail that was compressed out of it.** It says the same thing the answer said, with no claim changed, and adds the reasoning, the figures, and the examples the list left out. It is still led by its point, and still a list where its items are facts, with prose where reasoning runs from one step to the next.

## Answering in brief

**`/brief` asks for an answer in brief, as opening a request with *Brief:* does.** Words typed after it are the request, and they are answered in brief. A bare `/brief` gives the previous answer again in brief, with no claim changed. A brief answer leads with its point and takes a few lines. `/brief` and `/expand` are counterparts: one gives an answer in fewer words, and the other in more.

## Compressed

1. An answer to the engineer is a list.
2. Prose is not forbidden, but it is not the default.
3. Prose is written only where a condition below applies. The agent must name the condition that applies.
4. Where no condition applies, the answer is a list.

## What justifies prose

1. Only one condition justifies prose: the answer is a sentence or two.
2. Such an answer takes no list. Examples: *Yes*, *The suite passes*, *Correct — the rule says so and I did not follow it*. Do not put it in a single bullet, or in two bullets for a two-clause answer.
3. No other condition justifies prose.
4. An explanation the engineer asked for does not justify prose. It is answered in a list.
5. Connected or dependent reasoning does not justify prose. It is answered in a numbered list.

## A list item states a fact. It does not narrate

1. Each list item states what is true. It does not describe the work.
2. A list whose items are narration fails this rule, even when the list form is correct.
3. Do not describe a decision as a decision. Examples: *the judgment is left as a judgment on purpose*, *this was recorded as a new entry rather than by rewriting the old one*, *the option was declined*.
4. Do not explain why something is as it is, unless asked. Examples: *so a later reader knows what tightening would mean*, *which is what keeps the record honest*, *for the same reason the other rule gives*.
5. Do not characterize the work or its result. The writing-states-the-evidence-and-the-reader-draws-the-conclusion rule names the forms.
6. Do not report the agent's process. Examples: *I checked*, *verified rather than assumed*, *rather than trusting the composite's copy*.
7. State the fact that is left once those are removed. Example: *The rule names two stricter forms: the line on every list answer, or above a length threshold. Neither is adopted.*
8. Test each list item by asking whether it could be false. Remove it if it could not.
9. *The check is green*, *nine of thirteen scripts lack it*, and *the branch is deleted* are facts. *This keeps the record honest* is narration.
10. Reasoning belongs in rules, records, and commit messages. It does not belong in an answer unless asked for.
11. Reasoning the engineer wants is asked for with `/expand`.

## Dependent reasoning takes an ordered list, not prose

1. An unordered list is only for list items that are parallel and independent.
2. Number reasoning whose steps rest on each other: `1.`, `2.`, `3.`.
3. Number a list whose entries the engineer may refer back to, such as options, findings, candidates, or things to decide.
4. Those numbers are handles, such as *#2*. They imply no order.
5. In all other cases, leave the list unordered.

## No answer ends with an offer

1. End no answer with an offer of a next topic, of what else might be done, or of more detail.
2. The engineer asks for more detail with `/expand`.

## Expanding an answer

1. `/expand` gives the previous answer at more length, adding the detail compressed out of it: the reasoning, the figures, and the examples.
2. It says the same thing, with no claim changed, and is still led by its point.
3. It is a list where its items are facts, with prose where reasoning runs from one step to the next.

## Answering in brief

1. `/brief <request>` answers the request in brief, as opening it with *Brief:* does.
2. A bare `/brief` gives the previous answer again in brief, with no claim changed.
3. A brief answer leads with its point and takes a few lines.

## Compression

- 2026-10-24, compressed: compression 0.49, change 0.71, solubility 25 → 53, clarity 0.41 → 0.78, 22 directives, 22 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 53 → 54, clarity 0.78 → 0.78; checked: 22 directives, 22 kept, 0 less precise, 0 lost
- 2026-11-03, revised: /expand gives the previous answer at more length; checked: 29 directives, 28 kept, 1 less precise, 0 lost. Left less precise, from before this change: the detail behind a sentence or two taking no list
- 2026-11-07, revised: the expansion line ends every answer the agent compressed, list or prose, and is no longer the agent's judgment; re-checked: 24 directives, 23 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the bans on a single bullet and on two bullets for a two-clause answer, which *Such an answer takes no list* carries
- 2026-11-07, revised: a brief explanation always ends with the expansion line, and another answer only where the agent judges an expansion would add something; checked: 25 directives, 23 kept, 1 less precise, 1 lost, 1 repair: the ban on a single bullet, or two bullets for a two-clause answer, restored to the compressed text; re-checked: 25 directives, 24 kept, 1 less precise, 0 lost. Left less precise: the line left off reports and confirmations, which *an answer that says all it has* carries
- 2026-11-11, revised: `/brief` answers a request in brief, or gives the previous answer again in brief; checked: 29 directives, 28 kept, 1 less precise, 0 lost, 0 repairs. Left less precise, from before this change: the line left off reports and confirmations, which *an answer that says all it has* carries
- 2026-11-16, revised: the examples of characterizing the work moved to the writing-states-the-evidence-and-the-reader-draws-the-conclusion rule; checked: 50 directives, 49 kept, 1 less precise, 0 lost. Left less precise, from before this change: the expansion line left off a report and a confirmation, named only as an answer that says all it has
- 2026-11-19, revised: no answer ends with the expansion line, which the engineer asked to have removed; checked: 25 directives, 25 kept, 0 less precise, 0 lost

## History

Until Thu Nov 19 2026 a brief explanation, and an answer the agent had compressed, ended with the line *For more detail than bullet points, ask for an expanded answer.* The engineer had it removed.

Until Mon Nov 16 2026 this rule gave its own examples of characterizing the work. They moved to the writing-states-the-evidence-and-the-reader-draws-the-conclusion rule, so they are stated once.

Until Wed Nov 11 2026 no command asked for an answer in brief. An answer was asked for in brief by opening the request with *Brief:*.

For a time on Sat Nov 7 2026 the expansion line ended every answer the agent compressed, list or prose. The engineer found it displayed too often, and settled that a brief explanation always ends with it, and another answer only at the agent's judgment.

Until Sat Nov 7 2026 the expansion line ended a list answer only where the agent judged that an expansion would add something. The rule called that judgment its known weakness, and left two stricter forms unadopted: the line on every list answer, or above a length threshold. The engineer settled that the line ends every answer the agent compressed, list or prose, and that a brief explanation always ends with it.

Until Mon Nov 2 2026 an answer offered an expansion, and no rule said what the expansion gave.

Until Sun Oct 25 2026 this rule was titled "An answer is a list. Prose must justify itself".

Related:

- the writing-states-the-evidence-and-the-reader-draws-the-conclusion rule — the forms that characterize the work
- the communicate-plainly-and-name-the-actual-thing rule — which governs the words inside the list and reaches conversation the same way this does
- the language-is-used-precisely-here-and-words-are-load-bearing rule premise
- `foundation`'s present-every-prompt-to-the-engineer-through-the-selection-ui rule — the selection interface, which is where a **question** goes — this rule governs an **answer**, and the two do not overlap

---

Authored by Scott Bellware on Fri Aug 7 2026 at 12:55:09 PT
Changed by Scott Bellware on Fri Aug 7 2026 at 13:02:58 PT
Changed by Scott Bellware on Fri Aug 7 2026 at 13:10:48 PT
Changed by Scott Bellware on Fri Aug 7 2026 at 13:28:11 PT
Changed by Scott Bellware on Sun Aug 9 2026 at 18:06:52 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 18:14:48 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 20:18:59 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 21:29:23 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 21:43:08 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 22:48:55 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 23:41:53 PT
Changed by Scott Bellware on Tue Aug 11 2026 at 01:12:44 PT
Changed by Scott Bellware on Tue Aug 11 2026 at 02:41:09 PT
Changed by Scott Bellware on Tue Aug 11 2026 at 05:06:31 PT
Changed by Scott Bellware on Wed Oct 21 2026 at 09:37:27 PT
Changed by Scott Bellware on Wed Oct 21 2026 at 21:35:39 PT
Changed by Scott Bellware on Sat Oct 24 2026 at 14:41:36 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:22:48 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:25:01 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:25:07 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:25:32 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:06:51 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:29:24 PT
Changed by Scott Bellware on Tue Nov 3 2026 at 10:38:55 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 00:22:04 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 00:30:08 PT
Changed by Scott Bellware on Wed Nov 11 2026 at 15:08:14 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 18:15:56 PT
Changed by Scott Bellware on Thu Nov 19 2026 at 16:33:50 PT
