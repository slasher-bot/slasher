# A fetch file takes `store = "project"`, and a fetch file without a `store` line is taken as one

- **State:** Implementation
- **Tags:** [work]

- The `imap` package's `fetch.toml` takes `store = "project"`, which sends the messages into the project, in `slasher/local/email/<name>/`.
- A fetch file with no `store` line is taken as `store = "project"`, as it is now.
- `store = "private"` is unchanged.

**As the engineer stated it:** "store = project" should be supported, even if it defaults to "project" when left out

**Implementation:** `2026-11-14T17-01-25Z-fetch-file-store-project`, the feature that builds it.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 8:36:12 AM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 9:01:25 AM PT
