# You said: when an implementation starts, its first record is committed on master, then the branch is made. The branch's copy gets the updates during the work, and master's copy stays as first written until the merge. How should this be recorded? — Amend the branch rule, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> You said: when an implementation starts, its first record is committed on master, then the branch is made. The branch's copy gets the updates during the work, and master's copy stays as first written until the merge. How should this be recorded?

The options:

- **Amend the branch rule** — Amend foundation's an-implementation-runs-on-a-branch-to-a-declared-end rule, in its branch section, with a History line. That rule already orders the start: new creates the branch and writes the record.
- **Amend the records rule** — Amend foundation's the-implementations-directory-holds-one-record-per-implementation rule, which says where the record is and what it carries.
- **A new local rule** — A rule in local/rules/ for this project only, with its log entry. Consuming projects would not get it.
- **A note** — A note in local/items/, where the thinking has not settled. It binds nothing.

The engineer's answer: **Amend the branch rule**
