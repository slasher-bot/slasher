# Implementation — Email summaries

**Tags:** [implementation]

## Intent

**As the engineer stated it:** Do #1, #2 unattended, with #1 the work item `2026-11-21T01-31-32Z-summarize-messages-after-imap-receives-them`, which reads *After imap receives messages, summarize them*, and #2 the work item `2026-11-21T01-31-58Z-summarize-a-message-after-smtp-sends-it`, which reads *After smtp sends a message, summarize it*.

**The agent summarizes the messages a fetch writes, and the message a send sends.**

Realizes the work items `2026-11-21T01-31-32Z-summarize-messages-after-imap-receives-them` and `2026-11-21T01-31-58Z-summarize-a-message-after-smtp-sends-it`.

## State

- **State:** Active

## Setup

- **Tags:** [implementation]
- **Upstream branch:** `master`
- **Progression branch:** `implementation/worktree/email-summaries`
- **Working location:** a branch and a worktree, at `../slasher-implementation-worktree-email-summaries`. The main working tree stays on `master`.
- **Participation:** unattended, stated by the engineer in the request. The question was not asked.
- **Forecast:** none given.
- **Items:** `2026-11-21T01-31-32Z-summarize-messages-after-imap-receives-them` and `2026-11-21T01-31-58Z-summarize-a-message-after-smtp-sends-it`

## Plan, as accepted on 2026-11-21

1. Write the implementation record Active and its log entry. Make both work items Progression, with their log entries. Commit them on master, on the engineer's selection.
2. Create the branch implementation/worktree/email-summaries in a new worktree at ../slasher-implementation-worktree-email-summaries.
3. After /email fetch, summarize each message the fetch wrote. Find them as the files in the account's folders that were not there before the fetch.
4. Give each fetched message one line: its sender, its subject, and its gist in a few words. Group the lines by account and folder.
5. Where a fetch writes more than 20 messages, summarize the 20 most recent, and say how many others there are.
6. Where a fetch writes no message, say so, and summarize nothing.
7. After /email send succeeds, summarize the message sent: its recipients, its subject, and its gist in a sentence or two.
8. Where a send fails, summarize nothing.
9. State these in the imap rule and the smtp rule. Change no script.
10. Compile the source, and run the suite.
11. Commit the change on the branch.

## Confirmations

- **2026-11-21** — Participation: Unattended, stated by the engineer in the request.
- **2026-11-21** — Working location: Branch and worktree, selected by the engineer.
- **2026-11-21** — Plan: Accept, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 20 2026 at 6:42:29 PM PT
