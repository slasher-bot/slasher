# What is the system project on disk? The item says it has a local/ directory for your most general content. — A full Slasher project, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What is the system project on disk? The item says it has a local/ directory for your most general content.

The options:

- **A full Slasher project** — A git repository with Slasher installed, so it has slasher/local/. Every record command works there unchanged, and it is found the same way a registry project is.
- **A plain directory with local/** — Only a local/ directory holding records, with no installed packages and no requirement to be a git repository. Record commands need to know about this second layout.

The engineer's answer: **A full Slasher project**
