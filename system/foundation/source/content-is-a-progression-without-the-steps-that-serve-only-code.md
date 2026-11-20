# Content is a progression without the steps that serve only code

**Trigger:** When the engineer types `/content` or `/contents`, or creates, starts, changes the state of, or concludes a content progression

**As the engineer stated it:** What kind of features does Slasher need to write content? For example, writing an article for a publication should happen on a branch, but an article isn't a feature or experiment. And not all writing is an article.

**As the engineer later stated it:** The kind is content. The command is "/content"

**Content is a progression whose product is writing**, such as an article, an essay, a lesson, or a page. One kind holds all writing. Its record is titled `Content — <name>` and tagged `[content]`. Its branch is `content/<subject>`, or `content/worktree/<subject>` where it has a worktree. The the-progressions-directory-holds-one-record-per-progression rule and the a-progression-runs-on-a-branch-to-a-declared-end rule govern it, except where this rule says otherwise.

**Content keeps what every progression has.** It has a branch, a record with a state line, a declared end, and the working-location selection. It takes the same state words, the same log entries, and the same confirmations of a worktree and a branch deletion. Where it is created for an item, the item takes Progression, as for a feature.

**Content leaves out the steps that serve only code, because it is content.** It goes through none of the five hinges, and it has no loop record. It is not asked whether the engineer is in the loop. It is not asked for a forecast, and it is not asked the verdict question. This holds whatever the progression produces. Code written in a content progression, such as a script that builds a site, goes through none of these steps either.

**As the engineer stated it:** They're left out, answering *whether the steps that serve only code are left out because the work is content, or because it produces prose instead of code*. Asked on what basis, the engineer selected *Because it is content*.

**Content has no standard phases.** The writer decides the phases of a piece, if any, and adds each one with `/phase new`.

## The command

**`/content` takes these subcommands:** `new`, `start`, `complete`, `defer`, `suspend`, `discontinue`, `obsolete`, `supersede`, `abandon`, `resume`, `status`, `list`, and `help`. Each does for content what the `/feature` subcommand of the same name does for a feature. `/content status` reports as the progression-status-reports-its-phases-its-state-what-exists-and-what-is-left rule says.

**`/content` has no `new with phases`, and no `affirm`, `refute`, or `inconclusive`.** Content states no forecast and reaches no verdict. `/content complete` concludes it Completed.

**As the engineer stated it:** Do not add these to the "/content" command: new with phases; affirm, refute, inconclusive. Include: defer, suspend, discontinue, obsolete, supersede, abandon

**`/contents` and `/content list` list the current content**, as `/features` lists the current features, under the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule.

## The review before the merge

**Where the `prose` package is active, `/content complete` offers a review before the merge.** Ask, through the selection interface, whether to review the content, with the options *Review* and *No review*. Where the writer selects *Review*, ask which kind of review, with the options `/prose critique`, `/prose suggest`, and `/prose line-edit`. Then run the review the writer selected, on the content the progression produced.

**Ordinarily, the merge waits until the writer has accepted or rejected each of the review's suggestions.** The writer can leave the review before every suggestion is settled, and the merge then does not wait on it. A critique makes no suggestion, so the merge waits for nothing after it. Where the writer selects *No review*, conclude the content without one.

**Where the `prose` package is not active, `/content complete` offers no review**, and concludes the content as any progression without a forecast concludes.

**As the engineer stated it:** When it's time for a review, ask the user which type of review. And: Yes ordinarily, but the user can still escape the review. And: Offered by /content complete

**Why:** writing belongs on a branch, with a record and a declared end, as code does. The steps that design code from its use site have nothing to act on in a piece of writing, and a forecast and a verdict do not apply to it. A review takes the place of the tests that a merge of code waits for.

**How to apply:** on `/content`, read the subcommand, and act as `/feature` does for the same subcommand, with the content kind's title, tag, and branch name. Ask only the working location when the content is created. On `/content complete`, offer the review where `prose` is active, and wait for its suggestions to be settled before the merge, unless the writer leaves the review.

Related:

- the the-progressions-directory-holds-one-record-per-progression rule — the record every progression keeps
- the a-progression-runs-on-a-branch-to-a-declared-end rule — the branch, the working location, and the end
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — `/contents` and `/content list`
- the `prose` package's prose-reviews-content-through-its-subcommands rule — the reviews offered before the merge

---

Authored by Scott Bellware on Fri Nov 20 2026 at 12:19:44 PM PT
