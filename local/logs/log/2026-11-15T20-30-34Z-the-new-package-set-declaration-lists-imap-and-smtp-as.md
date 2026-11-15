# The new package-set declaration lists imap and smtp as Inactive, which is their real state here. The plugin build reads that line, so /email and /smtp drop out of this repository's plugin and command table. Before, the old declaration's Inactive line said "none", so they were built in although their rules were not loaded. How should imap and smtp stand? — Activate them too, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The new package-set declaration lists imap and smtp as Inactive, which is their real state here. The plugin build reads that line, so /email and /smtp drop out of this repository's plugin and command table. Before, the old declaration's Inactive line said "none", so they were built in although their rules were not loaded. How should imap and smtp stand?

The options:

- **Stay deactivated** — Keep Inactive: imap, smtp. /email and /smtp leave this repository's plugin, matching their rules, which already do not load here.
- **Activate them too** — Declare default, +prose, +imap, +smtp. Their rules load at session start, and /email and /smtp stay in the plugin.

The engineer's answer: **Activate them too**
