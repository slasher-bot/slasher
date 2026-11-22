# An /items command does what /report does

- **State:** Realized
- **Tags:** [idea]

**A command, `/items`, would do what `/report` does: list the current items, then the current features and experiments.** It would take the same optional number, as `/items 10`.

**Not yet settled:** whether `/items` is an alias of `/report` or replaces it; whether it also takes `brief`; and how it sits beside `/item`, whose `/item list` and `/item current` already list items.

## Settled

- **2026-11-07** — `/items` replaces `/report`, and `/report` stops working.
- **2026-11-07** — `/brief` becomes its own command, in place of `/report brief`. `/items` takes no `brief`.
- **2026-11-07** — `/item current` and `/item list current` are left as they are, listing the items only.

## History

Realized on the branch `feature/items-command`.

As the engineer first stated it: "A \"/items\" command that does what \"/report\" does"

---

Authored by Scott Bellware on Sat Nov 7 2026 at 01:00:56 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 01:02:55 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 01:04:28 PT
Changed by Scott Bellware on Sat Nov 7 2026 at 01:05:12 PT
