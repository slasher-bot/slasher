# A fetch file takes `store = "project"`, and a fetch file without a `store` line is taken as one

- **State:** Completed
- **Tags:** [work]

- The `imap` package's `fetch.toml` takes `store = "project"`, which sends the messages into the project, in `slasher/local/email/<name>/`.
- A fetch file with no `store` line is taken as `store = "project"`, as it is now.
- `store = "private"` is unchanged.

**As the engineer stated it:** "store = project" should be supported, even if it defaults to "project" when left out

**Progression:** `2026-11-14T17-01-25Z-fetch-file-store-project`, the feature that builds it.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 08:36:12 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 09:01:25 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 09:13:43 PT
Changed by Scott Bellware on Sat Nov 14 2026 at 16:03:40 PT
