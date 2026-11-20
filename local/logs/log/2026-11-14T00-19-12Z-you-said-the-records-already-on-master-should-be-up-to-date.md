# You said: "The records already on master should be up to date, because contributors all have access to master, and will need to understand the correct and current state of items." No rule says this now. The progressions rule makes an item Progression when an experiment or feature is created for it, but it doesn't say which branch that change is committed on. How should this be recorded? — Amend the progressions rule, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> You said: "The records already on master should be up to date, because contributors all have access to master, and will need to understand the correct and current state of items." No rule says this now. The progressions rule makes an item Progression when an experiment or feature is created for it, but it doesn't say which branch that change is committed on. How should this be recorded?

The options:

- **Amend the progressions rule** — Add to foundation's the-progressions-directory-holds-one-record-per-progression rule: an item's state change for a progression is also committed on master, so master shows each item's current state.
- **New local rule** — Write it as this project's own rule in local/rules/, with a matching log entry.
- **A note** — Record it as a note in local/items/, because the thinking hasn't settled yet.
- **Don't record it** — Fix this item on master and record nothing.

The engineer's answer: **Amend the progressions rule**
