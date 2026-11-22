# The package refresh fails looking for an SSH key, and SLASHER_ORIGIN in the session environment has no effect

**State:** Open

**Tags:** [problem]

Reported by James Hughes:

> I tried to update a local repo with the changes you published on 11/17, but /packages refresh failed looking for an SSH key. I tried adding SLASHER_ORIGIN=https://github.com/slasher-botto claude’s session environment, but it didn’t have any effect. I was able to work around it by running slasher/system/foundation/refresh-packages.sh directly.

---

Authored by Scott Bellware on Sat Nov 21 2026 at 22:31:22 PT
