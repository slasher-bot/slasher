# An edit command suggests edits to content, and accept or reject settles them

- **State:** Realized
- **Tags:** [idea]

**`/edit` tells the agent to suggest edits to content.** `/edit accept` tells the agent to incorporate the suggested edits. `/edit reject` tells the agent not to incorporate them.

**As the engineer stated it:** "/edit" command. It tells the agent to suggest edits to content. "/edit accept" tells the agent to incorporate the suggest edits. "/edit reject" tells the agent to not incorporate the agent's sugested edits.

**Implementation:** `2026-11-15T19-38-31Z-review-command`

**Settled 2026-11-15:** the command is `/suggest`, not `/edit`: `/suggest`, `/suggest accept`, and `/suggest reject`. **As the engineer stated it:** It should be "/suggest" rather than "/edit"

**Settled 2026-11-15:** the command is `/review`, not `/suggest`: `/review`, `/review accept`, and `/review reject`. **As the engineer stated it:** Change "/suggest" to "/review"

**Settled 2026-11-15:** the command is `/suggest` again, not `/review`, since Claude Code's built-in code-review command takes `/review`. The engineer selected `/suggest` over keeping `/review`, `/revise`, and `/proofread`.

**Settled 2026-11-15:** the command is `/review` again, not `/suggest`, although Claude Code's built-in code-review command takes `/review`. Where it does, the command is typed `/slasher:review`. **As the engineer stated it:** Change "/suggest" to "/review"

---

Authored by Scott Bellware on Sat Nov 14 2026 at 6:42:30 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:38:31 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:40:02 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:42:08 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 11:56:21 AM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:31:11 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:32:30 PM PT
Changed by Scott Bellware on Sun Nov 15 2026 at 12:34:45 PM PT
