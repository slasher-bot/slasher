# A content package for the content-editing rules and commands

- **State:** Implementation
- **Tags:** [idea]

**The content-editing rules and commands that are starting to appear may belong in a package of their own, named `content`.**

**As the engineer stated it:** There may be a need to put the emerging content editing rules and commands in their own "content" package.

**Settled 2026-11-15:** the package is named `prose`, at `system/prose/`, not `content`. The installer already has a package set named `content`, and `slasher-install content` resolves to the set, so a package of that name could not be installed by name. The engineer selected renaming the package, then the name `prose`.

**Implementation:** `2026-11-15T19-38-31Z-review-command`

---

Authored by Scott Bellware on Sat Nov 14 2026 at 6:43:02 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:58:18 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:01:06 PM PT
