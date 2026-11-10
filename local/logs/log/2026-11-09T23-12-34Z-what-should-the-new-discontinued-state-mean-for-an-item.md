# What should the new Discontinued state mean for an item, compared with Deferred (kept on purpose, no date, no one working on it, can be reopened)? — Same as implementations, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What should the new Discontinued state mean for an item, compared with Deferred (kept on purpose, no date, no one working on it, can be reopened)?

The options:

- **Same as implementations** — Stopped with no plan to resume, and can be reopened. Same wording as for features and experiments. Very close to Deferred.
- **Ends the item** — Stopped with no plan to resume, and cannot be taken back, like Abandoned and Obsolete. Clearly different from Deferred.
- **Replaces Deferred** — Discontinued replaces Deferred for items, and existing Deferred items are converted. One word for both kinds of record.

The engineer's answer: **Same as implementations**
