# Work Session — Email summaries

The work session started with two work items for the email packages, asked for together, and ended with both realized by one implementation, the first started directly since that rule took effect.

This is the communicable record of the work session, a guided tour. The durable records it points to are the source of truth.

## 1. Two items, one implementation

The engineer asked for the work items `2026-11-21T01-31-32Z-summarize-messages-after-imap-receives-them` and `2026-11-21T01-31-58Z-summarize-a-message-after-smtp-sends-it` to be done unattended. Neither named a kind, so they took an implementation, under the rule the previous work session settled. One implementation, `2026-11-21T02-42-29Z-email-summaries`, carried both, in a branch and a worktree.

## 2. The summaries

A **fetch summary** is one line for each message a fetch wrote: its sender, its subject, and its gist, grouped by account and folder, at most the 20 most recent. A **send summary** is the recipients, the subject, and the gist of a message that was sent. The agent finds the messages a fetch wrote as the files that were not in the account's folders before the fetch, so no script changed. The `imap` rule, the `smtp` rule, and the `/email` help say so.

## 3. The conclusion

Asked to conclude it, the engineer selected Completed, and the merge, the worktree removal, and the branch deletion. A work item another session recorded, `2026-11-21T02-43-52Z-implementation-as-the-item-state-for-an-implementation-progression`, was committed on the engineer's selection.

## Takeaways

- The agent summarizes what the email packages receive and send. The scripts are unchanged.
- One progression can realize more than one item.

## Glossary

- **fetch summary** — a line for each message a fetch wrote: sender, subject, and gist.
- **send summary** — the recipients, subject, and gist of a message sent.

## Where the durable records live

- The implementation: `local/progressions/2026-11-21T02-42-29Z-email-summaries.md`
- The work items: `local/items/2026-11-21T01-31-32Z-summarize-messages-after-imap-receives-them.md` and `local/items/2026-11-21T01-31-58Z-summarize-a-message-after-smtp-sends-it.md`
- The rules: `system/imap/source/email-fetches-the-accounts-named-and-lists-them-without-credentials.md` and `system/smtp/source/smtp-sends-a-message-only-after-the-engineer-confirms-it.md`

---

Authored by Scott Bellware on Fri Nov 20 2026 at 19:06:43 PT
