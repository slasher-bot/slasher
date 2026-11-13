# The feature's intent is to publish the smtp package: create the repository slasher-bot/smtp and publish the package to it from this feature, as the imap feature did. The local rule publishes only from master, and makes this the one exception, where the implementation is about publishing. Is the publish from this feature allowed? — Publish from the feature, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The feature's intent is to publish the smtp package: create the repository slasher-bot/smtp and publish the package to it from this feature, as the imap feature did. The local rule publishes only from master, and makes this the one exception, where the implementation is about publishing. Is the publish from this feature allowed?

The options:

- **Publish from the feature** — Create slasher-bot/smtp and publish the package from this feature's branch, recorded as a confirmation in its record.
- **Publish from master only** — The feature prepares everything, and the publish waits until the work is merged to master.

The engineer's answer: **Publish from the feature**
