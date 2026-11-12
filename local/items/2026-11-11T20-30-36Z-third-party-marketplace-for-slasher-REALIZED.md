# Third-party marketplace for Slasher

- **State:** Realized
- **Tags:** [idea]
- **Implementation:** the experiment `2026-11-11T20-33-36Z-third-party-marketplace`

**Slasher is distributed through a third-party marketplace of its own.** A third-party marketplace is one Anthropic does not run: a git repository holding a `.claude-plugin/marketplace.json` that lists the plugin, which a user adds with `/plugin marketplace add`.

**As the engineer stated it:** Third-party marketplace for Slasher

## What the Claude Code documentation says, as of 2026-11-11

The agent read the current Claude Code documentation on plugins and marketplaces. What the documentation states is kept apart from what was inferred.

### Only Anthropic's own marketplaces

- `claude-plugins-official` takes no submissions through the directory portal. Partners ask an Anthropic contact.
- Anthropic's directory on claude.ai is a separate catalog. A submission needs a paid claude.ai plan and a GitHub repository, and it is reviewed. The portal applies directory rules the CLI does not check, and the documentation does not list them.
- The community marketplace, `claude-community`, holds third-party plugins submitted to Anthropic.
- Some marketplace names are accepted only from repositories under `github.com/anthropics/`: among them `claude-plugins-official`, `anthropic-plugins`, `agent-skills`, `claude-community`, `claude-plugins-community`, and `healthcare`. From any other source, Claude Code refuses the name with *Marketplace is registered from an untrusted source*.
- Anthropic does not review third-party marketplaces.

### Every plugin, whatever the marketplace

- **The plugin's name:** non-empty, with no spaces, `@`, `:`, path separators, control characters, or bidirectional characters, and dash-separated, lower-case by convention. `claude plugin validate` errors on a name starting `claude-`, `anthropic-`, `anthropics-`, or `cc-plugin-`, on the names `claude`, `anthropic`, `anthropics`, `claude-code`, and `claude-mods`, and on `official` beside `claude` or `anthropic`. Claude Code still loads such a plugin. `slasher` meets none of these.
- **A skill's name:** zero-width, control, private-use, unassigned, and bidirectional characters, unusual blanks, and `<` and `>` are refused, and in a plugin's skill directory they become hyphens. The documentation does not mention `?`, `'`, or `;`. The skill directory `synced` is reserved.
- **Hooks:** a plugin's `hooks/hooks.json` merges with the user's and the project's hooks while the plugin is enabled, with a limit of 1,024 hooks to a source. A PostToolUse hook cannot block a tool call, since the tool has already run. A plugin's hooks, MCP servers, and `bin/` run with the user's privileges, outside the sandbox. No marketplace restricts a plugin's hooks.
- **Layout:** a component path starts with `./` and stays inside the plugin's root, and only `plugin.json` sits in `.claude-plugin/`. `claude plugin validate --strict` is the local check.

### An organization's managed settings

- `strictKnownMarketplaces` allows only the marketplace sources it lists, and an empty list blocks every source, Anthropic's included. `blockedMarketplaces` blocks the sources it lists.
- `disableSideloadFlags` refuses `--plugin-dir`, `--plugin-url`, and `CLAUDE_CODE_PLUGIN_DIRS`.
- `strictPluginOnlyCustomization` blocks skills, agents, hooks, and MCP servers from user and project sources.
- `allowManagedHooksOnly` blocks every hook but the managed ones, a plugin's included.
- `pluginTrustMessage` adds the organization's text to the trust warning.
- Where a policy blocks a marketplace, adding it fails with *blocked by enterprise policy*.

### What a user does to install from a third-party marketplace

- Add the marketplace with `/plugin marketplace add <owner>/<repo>`, then install with `/plugin install <plugin>@<marketplace>`.
- Before the install, `/plugin` shows a *Will install* list, and the documentation asks the user to read the plugin's `hooks/hooks.json`, `.mcp.json`, and `bin/`.
- A trust warning precedes the install: Anthropic does not control what a plugin includes and cannot verify it.
- Installing a plugin enables it, unless it sets `defaultEnabled: false`.
- Auto-update is off by default for a third-party marketplace.
- A private marketplace needs git credentials on the user's machine, since the clone runs without a prompt.

### Inferred, not stated

- The marketplace's own name must not be one of the reserved names.
- The skills `?`, `'`, and `;` are not covered by the documentation. They have worked in use in this project's own sessions.
- The official directory's rules for hooks are not documented, and they reach a plugin only where it is submitted.

### Sources

- https://code.claude.com/docs/en/plugins/security.md
- https://code.claude.com/docs/en/plugins/org.md
- https://code.claude.com/docs/en/plugins/publish.md
- https://code.claude.com/docs/en/plugins/anthropic-marketplaces.md
- https://code.claude.com/docs/en/plugins/manifest-reference.md
- https://code.claude.com/docs/en/plugins/install.md
- https://code.claude.com/docs/en/skills.md
- https://code.claude.com/docs/en/hooks.md

---

Authored by Scott Bellware on Wed Nov 11 2026 at 12:30:36 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:31:20 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:33:36 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:45:02 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 2:39:12 PM PT
