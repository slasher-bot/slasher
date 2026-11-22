# Unattended carries out a request without stopping for the engineer

**Trigger:** When the engineer types `/unattended`

**`/unattended <request>` has the agent carry out the request on its own.** The agent decides each question it would otherwise put to the engineer, and does not stop for it. Where nothing follows the command, ask what the request is, through the selection interface's free-text option.

**As the engineer stated it:** An "/unattended" command that executes the request autonomously

**The agent shows a plan first, and waits for it to be accepted.** It presents the plan through the selection interface, as the `design-by-efferent` package's attended-or-unattended-is-chosen-when-the-work-is-created rule describes: the question opens *Accept the plan?*, the plan is its list, and the options are *Accept* and *Revise*. On *Revise*, it revises the plan as directed and shows it again. Nothing is generated until the plan is accepted. This is the one wait before the work.

**Once the plan is accepted, the agent decides every question itself.** That covers a choice between candidates, a design decision, a wording, a confirmation to proceed, and a commit on any branch but `master`. Each decision is recorded where its convention records it, as the agent's decision with its reasoning, not as though the engineer was asked.

**A commit on `master` and a push still wait for the engineer.** The agent puts each one through the selection interface, as it would without the command. A commit on `master` lands where every reader reads, and a push sends the work outside the machine.

**The request decides where the work is done.** Where the request names a feature to build, the agent starts a feature for it. Where it names an item to start or do, without naming a kind, the agent starts an implementation for it, as the the-items-directory-holds-one-file-per-item rule says. The progression runs unattended, and the agent chooses its working location, and records it as its own selection. It states no forecast unless the engineer gave one in the request. The verdict question at its end still waits for the engineer, since a verdict is the engineer's declaration. Otherwise the agent works where the working tree already is, and creates no branch.

**It holds for the one request.** When the request is done, the next prompt is attended again, unless it too begins with `/unattended`.

**Why:** an engineer who already knows what they want is slowed by questions whose answers they would accept from the agent anyway. The plan is the one place they look before the work starts. A commit on `master` and a push are the two acts that reach other people.

**How to apply:** on `/unattended <request>`, show a plan and wait for *Accept*. Then carry out the request without stopping, deciding each question and recording each decision, except a commit on `master` or a push, which wait for the engineer's selection. Start a feature where the request names one or an item to start, and otherwise work where the tree is.

## Compressed

1. `/unattended <request>` has the agent carry out the request on its own. With no request typed, ask for one through the free-text option.
2. Show a plan first, through the selection interface: *Accept the plan?*, the plan as its list, and the options *Accept* and *Revise*. On *Revise*, revise it as the engineer directs, and show it again. Generate nothing until it is accepted.
3. After acceptance, decide every question yourself: candidates, design, wording, confirmations, and commits on any branch but `master`. Record each decision where its convention records it, as the agent's, with its reasoning.
4. A commit on `master` and a push still wait for the engineer's selection.
5. Where the request names a feature to build, start an unattended feature for it. Where it names an item to start or do, without naming a kind, start an unattended implementation for it, as the the-items-directory-holds-one-file-per-item rule says. Choose its working location, and record it as the agent's selection. It states no forecast unless the engineer gave one in the request. The verdict question at its end waits for the engineer. Otherwise work where the working tree is, creating no branch.
6. It holds for the one request. The next prompt is attended unless it also begins with `/unattended`.

## Compression

- 2026-11-07, compressed: written with the rule; checked: 15 directives, 14 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: *decide each question, and do not stop for it*, which point 3 carries once the plan is accepted
- 2026-11-08, revised: the agent chooses a forecast at the start, and the verdict question at the end waits for the engineer; not re-checked
- 2026-11-20, revised: the agent chooses only the working location, since no forecast question is asked; checked: 23 directives, 22 kept, 1 less precise, 0 lost, 1 repair: a revised plan follows the engineer's direction; re-checked: 23 directives, 23 kept, 0 less precise, 0 lost
- 2026-11-21, revised: an item started without a kind named takes an implementation, not a feature; checked: 28 directives, 27 kept, 1 less precise, 0 lost, 1 repair: the items rule is named; re-checked: 28 directives, 28 kept, 0 less precise, 0 lost

## History

Until Sat Nov 21 2026 an item named in an unattended request took a feature. The engineer settled that an item started directly takes an implementation.

Until Fri Nov 20 2026 the agent also chose whether an unattended feature states a forecast. No forecast question is asked any more.

Until Sun Nov 8 2026 the agent chose whether an unattended feature reached a verdict, at its start.

Related:

- the `design-by-efferent` package's attended-or-unattended-is-chosen-when-the-work-is-created rule — the plan's form, and unattended work in a feature
- the a-progression-runs-on-a-branch-to-a-declared-end rule — a feature's start, which the agent decides here
- the `git` package's run-the-test-suite-after-changes-before-considering-whether-to-commit rule — the commit on `master` that still waits
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the prompts the agent decides instead of putting

---

Authored by Scott Bellware on Sat Nov 7 2026 at 01:17:43 PT
Changed by Scott Bellware on Sun Nov 8 2026 at 21:36:25 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 16:42:17 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 00:24:11 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 12:38:10 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 18:14:21 PT
