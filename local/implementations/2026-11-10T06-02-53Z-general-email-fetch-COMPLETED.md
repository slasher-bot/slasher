# Feature — General email fetch

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/feature new #4", with the item chosen as `2026-10-31T16-20-53Z-email-is-fetched-through-a-general-credential-store`, which reads "Email is fetched through a general mechanism, with a general token or credential store".

**Email is fetched by a general mechanism, not tied to one provider, which reads its access from a general store of tokens or credentials.** The item leaves three matters unsettled: what the fetched email is for, which providers and protocols the fetch covers, and where the store lives, outside any repository.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/general-email-fetch`
- **Base:** `99bca91d`, from `master`
- **Working location:** branch and worktree, at `../slasher-feature-worktree-general-email-fetch`, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Forecast:** none, chosen at the start.

## Phases

**As the engineer stated it:** "The feature's first phase is the macOS Keychain implementation. The next phase is the mailbox fetch."

1. **Keychain credentials** — the macOS Keychain implementation: a credential is stored in and read from the Keychain. Branch `feature/worktree/general-email-fetch.keychain-credentials`. No forecast. Started from `99ea1898`, on the feature's branch. Completed, with no forecast, and merged into the feature's branch.
   - **Outcomes:** a credential is read by its host or by its name, written from standard input with an optional name, and a read of a missing credential fails. The tests are named at the feature's close.
2. **Mailbox fetch** — an IMAP mailbox is fetched into the project, with its credential read from the Keychain. Branch `feature/worktree/general-email-fetch.mailbox-fetch`. No forecast. Started from `6fc6dc0a`, on the feature's branch. Completed, with no forecast, and merged into the feature's branch.
   - **Outcomes:** a mailbox is fetched by its credential's name, the inbox and the sent folder by default, into the project or the private store. A fetch file lists folders and Gmail labels. A repeat fetch skips messages already fetched. The `imap` package has its README and LICENSE, and is not in the default package set. The tests are named at the feature's close.

**As the engineer later stated it:** "Two new phases: Email commands. Packaging and installation"

3. **Email commands** — Slasher commands for the email fetch. Branch `feature/worktree/general-email-fetch.email-commands`. No forecast. Started from `f217eab3`, on the feature's branch. Completed, with no forecast, and merged into the feature's branch.
   - **Outcomes:** `/email fetch` fetches an account by its name, every account on a host, or every IMAP account with no argument, and a bare `/email` is the same. `/email list` lists the accounts by name, host, and login, without credentials. An unnamed account's mail goes under its host and login. The `imap` package's first rule keeps credentials out of the chat. The tests are named.
**As the engineer later stated it:** "I'll proceed with the expanded command table work as another phase here". It goes after email commands, and carries the work item `2026-11-10T18-55-12Z-command-table-printing-is-optimized`.

4. **Command table** — a package contributes its own rows to the command table, as `imap` contributes `/email`, and the table's printing is optimized, perhaps split into separate rules. Branch `feature/worktree/general-email-fetch.command-table`. No forecast. Started from `30d0f817`, on the feature's branch. Master was merged into it first. Completed, with no forecast, and merged into the feature's branch.
   - **Outcomes:** each command domain carries its rows of the command table beside its skill, and the plugin build joins the active packages' rows in the help's order, so `imap` contributes `/email`. The build writes the startup table's sentence. The table commands print the built tables, loading no rule. The command table rule is split into a short session-start rule and an on-demand rule for writing a row. A test keeps each row in step with its help. The README's copy of the table is kept by hand.
5. **Packaging and installation** — the `imap` package is packaged and installed. Branch `feature/worktree/general-email-fetch.packaging-and-installation`. No forecast. Started from `544bd4db`, on the feature's branch.
   - **Scope:** `imap` installed by name, with an interactive test. Refresh, activation, and deactivation handle it, each tested. The installer or `imap`'s own `install-dependencies.sh` checks for macOS and Python 3.11 or later. The package repository `slasher-bot/imap` is created, and the package published to it from this feature.
   - **Completed,** with no forecast, and merged into the feature's branch.
   - **Outcomes:** the scripts check their requirements when they run, since `install-dependencies.sh` is not run by the installer. `slasher-bot/imap` is created and holds the published package. `imap` installs by name, confirmed by the engineer's interactive run. Deactivation and refresh are covered. The `/email` row arrives in an install once foundation is republished after the feature merges.

## Confirmations

- **2026-11-09** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-11-09** — Participation: Attended, selected by the engineer. Agent's confidence 45%, risk of redo 55%, It'll work 70%, Your approval 50%, attended confidence 75%. The warning was shown, and Attended was recommended.
- **2026-11-09** — The feature states no forecast, selected by the engineer at the start.
- **2026-11-09** — Neither phase states a forecast, selected by the engineer when the phases were added.
- **2026-11-10** — The engineer certified the Keychain credentials by a final visual inspection: a credential written by the script to the login keychain was seen in Keychain Access, and read back by name and by host. **As the engineer stated it:** "I've certified the feature by final visual inspection".
- **2026-11-10** — Neither of the two later phases states a forecast, selected by the engineer when they were added.
- **2026-11-10** — The command table phase goes after email commands, states no forecast, and carries the work item on the command table's printing, selected by the engineer when it was added.
- **2026-11-10** — The packaging and installation phase's scope, selected by the engineer, includes creating the package repository `slasher-bot/imap` and publishing the package to it from this feature. That is the exception to the local rule that a package is published from `master`, put to the engineer through the selection interface, as the rule asks where an implementation's intent is about publishing.
- **2026-11-10** — The feature is Completed, as the engineer asked. It states no forecast, so it is not asked the verdict question. Each phase's commits were squashed into one, and the branch force-pushed, selected by the engineer. It merges into `master`.

## Outcome

The five phases are done. A credential is kept in the macOS Keychain and read by host or by name. A mailbox is fetched into the project or the private store, by name, by host, or every account, with a fetch file listing folders and Gmail labels. `/email` fetches and lists the accounts, keeping credentials out of the chat. Each package carries its command table rows, and the build joins them. The `imap` package is published to `slasher-bot/imap` and installs by name. The email-fetching idea is Realized, and the command-table work item is Done.

## Prior work

**As the engineer stated it:** "There's an old Waytide project at ~/works/RCC that has email retreival implementations".

- **The fetch:** `~/projects/sbellware/download-mailbox/download_mailbox.py`, a 310-line Python script on the standard library's `imaplib`. It takes a host, a user, a folder, an output directory, and the name of an environment variable holding the password, prompting where it is unset. It connects over TLS on port 993 by default. It writes each message as text, saves attachments, strips HTML where no plain-text part exists, and skips messages already downloaded, by UID.
- **The callers:** `~/works/RCC/email-export/`, four shell scripts. Each sources a credentials file at `${XDG_CONFIG_HOME:-$HOME/.config}/rcc/credentials`, which sets one environment variable per mailbox, and calls the fetch for one mailbox or Gmail label into a directory of its own. Two mailboxes are fetched: a Gmail account, by label, and a mailbox on the organization's own IMAP server.
- **What it shows for the unsettled matters:** the provider is general already, since any IMAP server serves. The store is a per-machine file under `~/.config/`, outside any repository, but it is specific to one project and holds passwords, not tokens. Gmail is reached by IMAP with a password, not by OAuth.
---

Authored by Scott Bellware on Mon Nov 9 2026 at 10:02:53 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:06:29 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:25:56 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 10:28:57 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:03:13 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:16:52 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:33:57 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 6:54:04 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:04:20 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 7:04:57 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 8:18:29 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 8:29:59 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 8:30:36 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:41:12 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:43:55 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:46:21 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:38:41 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:43:43 PM PT
