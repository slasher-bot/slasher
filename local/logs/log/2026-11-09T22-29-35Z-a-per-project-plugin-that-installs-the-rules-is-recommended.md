# The publish-to-marketplace feature recommends a per-project plugin that installs the rules on first use, with the curl install turning on the same plugin

The agent recommended it, and the engineer has not decided. A plugin's scope is chosen by whoever installs it, user, project, or local, and the manifest cannot restrict it, by the agent's own knowledge, not yet checked against the Claude Code documentation.

The recommendation: check the marketplace format, the install commands, and the scope option against the documentation first. Publish one fixed plugin, split to `slasher-bot/plugin`, carrying every package's skills, the hooks, and a copy of `install`. List it in a marketplace file in `slasher-bot/slasher`. Where a project has no packages, the session-start hook would point to `/package install`, and the other hooks would exit quietly. `/package install` would run the plugin's copy of `install`. The curl install would write the marketplace and the plugin into the project's `.claude/settings.json` in place of building `.claude/skills/slasher/`. A deactivated package's skill would refuse at run time. The authoring source would keep building its plugin locally.

What it gives up: a project without the curl install takes two steps, and a deactivated package's commands still appear in the list.
