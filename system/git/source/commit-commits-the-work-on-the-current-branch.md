# `/commit` commits the work on the current branch

**Trigger:** When the engineer types `/commit` or `/c`

**As the engineer stated it:** Add a "/commit" command with "/c" alias.

**`/commit` commits the working tree's changes on the current branch, and pushes nothing.** `/c` is its shortcut alias, and does exactly what it does. Typing it is the engineer's request for the commit. Do not ask again whether to commit. This holds on `master` too, since the engineer typed the request.

**The automated suite runs first.** Run it as the run-the-test-suite-after-changes-before-considering-whether-to-commit rule says. Where anything fails or is aborted, say so, and commit nothing.

**Commit the working tree's changes.** Write the message under the commit-message rules, which load when a commit message is written. Split the work into more than one commit where one subject cannot say it, as those rules require.

**Where the working tree holds changes the session did not make, ask before committing them.** Ask through the selection interface whether to commit them with the rest, or to leave them uncommitted. Commit the session's own changes either way.

**Where there is nothing to commit, say so, and do nothing.**

**Push nothing.** `/commit-and-push` commits and then pushes, and `/push` pushes.

**Report each commit in one line:** its short SHA and its subject, as `e3ab6817` Cart totals include the shipping charge.

**`/commit` is in the PUSH command domain.** `/push help` prints its help. `/commit help` and `/c help` say that the command takes no `help`, name `/push help`, and do nothing more.

**Why:** the engineer commits work many times a day without pushing it. One command with one meaning removes the question of whether to commit, and keeps the suite run and the commit-message rules in front of the commit.

**How to apply:** on `/commit` or `/c`, run the automated suite, and commit the working tree's changes on the current branch. Ask only about changes the session did not make. Push nothing.

Related:

- the commit-and-push-commits-the-work-then-pushes-the-current-branch rule — the same commit, followed by a push
- the run-the-test-suite-after-changes-before-considering-whether-to-commit rule — the suite run before the commit

---

Authored by Scott Bellware on Thu Nov 19 2026 at 4:38:32 PM PT
