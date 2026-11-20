# A project's local directory can be located in any directory

**State:** Realized

**Tags:** [idea]

A project's local directory can be located in any directory. When the local directory is not in its default location, it's configured in the project registry.

## Settled

- **2026-11-16** — The registry key that gives the location is `local`, beside the existing `journal` key, as in `local = "~/records/checkout"`.
- **2026-11-16** — A configured directory that does not exist stops with an error. Nothing falls back to `slasher/local`.
- **2026-11-16** — Where a relocated local directory is in a git repository, a record is committed in that repository.
- **2026-11-16** — Every worktree of a project uses the one relocated local directory. A record is written once, in that directory, and no merge acts on it. The engineer noted that the capability is used in content projects, where branches are rarer.

**Progression:** `2026-11-17T04-44-33Z-relocatable-local-directory`, the feature that builds it.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 9:06:34 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 8:15:22 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 8:15:42 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 8:17:16 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 8:41:21 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 8:44:33 PM PT
Changed by Scott Bellware on Mon Nov 16 2026 at 8:54:45 PM PT
