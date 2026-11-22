# Work Session — The /content command

The work session started by concluding the feature that makes `/status` say whether a record is ready to conclude. It went through two renames the engineer asked for, then settled the last open questions of the content work item, and ended with the `/content` command built in a worktree and merged to `master`.

This is the communicable record of the work session, a guided tour. The durable records it points to are the source of truth.

## 1. The status-readiness feature concludes

The engineer asked for the status of the feature `2026-11-20T19-19-26Z-status-readiness`, then completed it. Its work item concluded Completed with it.

## 2. `/prose edit` becomes `/prose line-edit`

Asked for another term for a detailed edit, the agent named the publishing terms. A **line edit** is an edit of each sentence for clarity, word choice, and flow. A **copyedit** is an edit for correctness and consistency. A **proofread** is a last check of the final copy for errors. The engineer asked whether *proofread* fit the walk better than *edit*, and was told it names a smaller job. The engineer then renamed the command `/prose line-edit`, and selected `/line-edit` as its short form. The rule is now line-edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence. The content work item was conformed to the new name at the engineer's request.

## 3. The direct-commit report names packages

Asked whether `report-direct-commits.sh` is used, the agent found that only the publish procedure names it, and nothing runs it. The engineer renamed it `report-direct-package-commits.sh`.

## 4. The content work item is settled

The engineer asked for the agent's confidence of building the content work item unattended. The agent gave 45%. The engineer confirmed that the `/content` skill copies the `/feature` skill, and settled its subcommands. It has no `new with phases` and no verdict words, and it has the six subcommands that set work aside. Both were recorded as Settled resolutions in `2026-11-20T06-40-24Z-content-items`.

## 5. The build

The engineer asked for an unattended feature, in a branch and a worktree, with no forecast. The feature `2026-11-20T20-17-39Z-content-command` added the rule content-is-a-progression-without-the-steps-that-serve-only-code. It also added the `/content` and `/contents` skills, and named the content kind in the progression rules, the list rule, the status rules, and the root state commands. It widened the commit-message rule's subject from the software to the thing that changed.

**Content** is a progression whose product is writing, titled `Content — <name>`, tagged `[content]`, on a `content/<subject>` branch. It leaves out the five hinges, the loop record, the participation question, the forecast, and the verdict.

The review at `/content complete` is offered only where the `prose` package is active, so `foundation` takes no dependency on `prose`. The compressed texts of four rules were checked by agents that had not seen them, and two repairs were made. The agent started the checks as a multi-agent workflow the engineer had not asked for, stopped it, and ran them as separate agents.

## Takeaways

- Content runs as a progression, with only the working location asked when it is created.
- A rule in `foundation` can offer what another package provides, where it says what happens when that package is not active.
- A commit message names the thing that changed, whether software or content.

## Glossary

- **content** — a progression whose product is writing, which leaves out the steps that serve only code.
- **line edit** — an edit of each sentence for clarity, word choice, and flow, which `/prose line-edit` walks.

## Where the durable records live

- The work item: `local/items/2026-11-20T06-40-24Z-content-items.md`
- The feature: `local/progressions/2026-11-20T20-17-39Z-content-command.md`
- The status-readiness feature: `local/progressions/2026-11-20T19-19-26Z-status-readiness.md`
- The content rule: `system/foundation/source/content-is-a-progression-without-the-steps-that-serve-only-code.md`
- The line-edit rule: `system/prose/source/line-edit-walks-the-content-paragraph-by-paragraph-then-sentence-by-sentence.md`
- The skills: `system/foundation/skills/content/` and `contents/`

---

Authored by Scott Bellware on Fri Nov 20 2026 at 12:30:50 PT
