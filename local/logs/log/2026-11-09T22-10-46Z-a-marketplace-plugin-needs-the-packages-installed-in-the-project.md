# A marketplace plugin needs Slasher's packages installed in the project, so the plugin alone does not install Slasher

The publish-to-marketplace feature found that the plugin's hooks move to the project root and run `slasher/system/foundation/` scripts, so a project with only the marketplace plugin has hooks that fail and no rules to load. The plugin is also assembled per project today, leaving out the skills of deactivated packages, where a marketplace plugin is one fixed build. A project that keeps the curl install and also adds the marketplace plugin would carry two copies of every command and hook.

Four decisions are open: where the published plugin lives, what it does in a project with no packages installed, whether it carries every package's skills or reads the project's package set, and how it and the curl install coexist.
