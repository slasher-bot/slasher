# The mailbox fetch phase's behavior is built and covered

A mailbox is fetched by its credential's name, into the project or its private store, with a fetch file listing folders and Gmail labels, the sent folder fetched by default, and a repeat fetch skipping messages already fetched. Each is tested against a local IMAP server written for the tests, and the automated suite passes, 35 of 35. The engineer has steps to test a real mailbox interactively, with its mail kept in the private store.
