# Work Session — Third-party marketplace (2026-11-12)

This work session began by returning to the third-party marketplace experiment, after the plugin had been renamed `slasher-install` and the installer renamed to match. It became a clean install in a scratch project, a fix for the status line, and three additions that make the plugin a full install of Slasher. It ended with the install proven from GitHub, and the experiment concluded Affirmed and merged.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the experiment record `2026-11-11T20-33-36Z-third-party-marketplace`, its idea `2026-11-11T20-30-36Z-third-party-marketplace-for-slasher`, and the log.

## 1. The renamed plugin tried

The engineer reinstalled the plugin under its new name, `slasher-install@slasher`, in a new, empty scratch project with `--scope project`, and ran `/slasher-install:install`. The project's own `slasher` plugin and the marketplace plugin loaded side by side, so the name clash recorded earlier was gone. Slasher installed, but without its status line.

## 2. The status line

Installing the plugin with `--scope project` writes `.claude/settings.json` before `/install` runs. The installer never edits an existing settings file, so it skipped the status line. The engineer asked whether the plugin could carry the setting: a plugin's settings apply only `agent` and `subagentStatusLine`, so it cannot. The engineer selected the agent's recommendation: `/install` adds the `statusLine` key itself, where the file has none, and changes nothing else in it. The next clean install showed the status line.

## 3. A full install

With the basics proven, the engineer asked to elaborate the plugin to a full install, and accepted the agent's recommendation of three additions. The packages stay out of the plugin, since `git subtree` adds and refreshes them.

- **The plugin carries the installer.** Designed through the hinges: the observation compares the plugin's copy with the repository's, against a control installer, implemented directly. `/install` runs `${CLAUDE_PLUGIN_ROOT}/slasher-install` and downloads nothing.
- **`/install` offers the packages.** The engineer selected the installer as the one place the list lives. `slasher-install --list` prints each set with its packages, then an `other:` line, and runs before the repository check. Its hinges settled `--list` as a flag, one line to a set, and an empty directory as the project. `/install` asks for a set, then for any other packages.
- **The README** gives the marketplace install first, and the `curl` install as the alternative.

Under `/unattended`, the agent named the five observations left unnamed. Each scratch install worked, including one that added `imap` and the Ruby package.

## 4. From GitHub

A marketplace can be added from a branch, as `slasher-bot/slasher#experiment/worktree/third-party-marketplace`. The first try was refused. Adding the local folder had recorded `slasher` under `extraKnownMarketplaces` in the engineer's user settings, removing the marketplace left that record, and Claude Code refuses a source that does not match it. The record was changed to GitHub, then removed. The clean install from GitHub succeeded.

## 5. The conclusion

The engineer declared the experiment Affirmed. Merging `master` into the branch conflicted in `README.md` and `slasher-install`, where `master` held the same installer rename, so the branch's side was kept. The branch merged into `master` with the automated tests passing, the idea became Realized, and the worktree and both copies of the branch were deleted.

Twice the agent raised the experiment's end on its own: once as the next step, and once as the verdict question on `/>>`. The engineer refused both. The rules leave the end of work with a forecast to the engineer.

## Takeaways

- A marketplace plugin that only installs Slasher avoids every clash with the project's own `slasher` plugin: no doubled hooks, no doubled commands.
- A plugin cannot set the status line, so the install command writes it.
- Carrying the installer in the plugin ties the installer to the plugin's version.
- A marketplace's source is recorded in user settings, and outlives the marketplace's removal.

## Glossary

- **marketplace plugin** — the `slasher-install` plugin, listed in the `slasher` marketplace, which carries only `/install` and the installer.
- **scratch project** — an empty directory, `/Users/sbellware/projects/slasher/scratch`, rebuilt for each trial install.

## Where the durable records live

- The experiment record `2026-11-11T20-33-36Z-third-party-marketplace` and the idea `2026-11-11T20-30-36Z-third-party-marketplace-for-slasher`.
- `slasher-install`, `system/foundation/build-marketplace-plugin.sh`, `system/foundation/build-marketplace-listing.sh`, and the `install` skill in `system/foundation/skills/install/`.
- The tests `test/automated/build-marketplace-plugin/slasher-install.sh`, `test/automated/build-marketplace-listing/slasher-install.sh`, and `test/automated/slasher-install/list.sh`.
- The log entries dated 2026-11-12.

---

Authored by Scott Bellware on Thu Nov 12 2026 at 2:40:22 PM PT
