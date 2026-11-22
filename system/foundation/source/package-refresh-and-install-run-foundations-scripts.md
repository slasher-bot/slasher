# Package refresh and install run foundation's scripts

**Trigger:** When the engineer asks to refresh or install Slasher's packages, as with `/packages update`, `/package update`, or `/package install`

**`/packages update [<package>...]` refreshes the installed packages from their repositories.** It runs foundation's `update-packages.sh`, with the packages named, or with none to refresh every one. **`/package update <package>` refreshes one package the same way.** Where it names no package, it asks which, through the selection interface, from the packages installed. Where it names more than one, it is `/packages update` with those names. Write `/packages update` wherever more than one package is updated, as in instructions to users, and `/package update` only for one. It reports each package that moved and the rule files that changed in it, as the script prints them. It rewrites `slasher/SLASHER.md`, the bootstrap, from the installed foundation, and says where the project's `AGENTS.md` lacks the line `@slasher/SLASHER.md` that imports it. It then runs the migrations of the installer it just pulled, which ask nothing, and reports what they changed, left uncommitted for the engineer to commit with the update.

**A refresh runs in the project the session is in, and in no other.** Refreshing another project is the engineer's to ask for there, per the work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported rule.

**`/package install` installs Slasher into the project the session is in.** It runs foundation's `install.sh` from the project's root, and the installer asks before it changes a file the project already has. It is not run in the Slasher authoring source, whose root `AGENTS.md` it would change, and where it would write a Slasher project's bootstrap.

**Each changes what the project reads at its next session.** A refreshed or installed rule is read when the rules are next loaded, so the report says that a session restart, or a `load rules`, takes it up.

**Why:** a refresh and an install are each a script that already does the work and reports it. A command that runs the script, in the right place, and passes on its report, keeps the engineer from typing a path and keeps the agent from guessing at the work the script does.

**How to apply:** on `/packages update`, run `update-packages.sh` with the packages named, or none, and report what moved. On `/package update`, run it with the one package named. On `/package install`, run `install.sh` from the project's root, never in the authoring source. Say that the change is read at the next load of the rules. Act on no other project.

## Compressed

1. `/packages update [<package>...]` refreshes the installed packages from their repositories. Run foundation's `update-packages.sh` with the packages named, or none for every one. Report each package that moved and its changed rule files, as the script prints them. It rewrites `slasher/SLASHER.md` from the installed foundation, and says where `AGENTS.md` lacks the line `@slasher/SLASHER.md`. It runs the pulled installer's migrations, which ask nothing, reports what they changed, and leaves their changes uncommitted, for the engineer to commit with the update.
2. `/package install` installs Slasher into the project the session is in. Run foundation's `install.sh` from that project's root. The installer asks before changing a file the project already has.
3. Act only on the project the session is in. Refreshing or installing in another project is the engineer's to ask for there.
4. Never run `/package install` in the Slasher authoring source, whose root `AGENTS.md` it would change, and where it would write a Slasher project's bootstrap.
5. Say that a refreshed or installed rule is read at the next load of the rules: a session restart, or `load rules`.
6. Pass on what each script reports. Do not guess at the work it does.
7. `/package update <package>` refreshes one package the same way. With no package named, ask which, through the selection interface, from the packages installed. With more than one named, it is `/packages update` with those names.
8. Write `/packages update` wherever more than one package is updated, as in instructions to users. Write `/package update` only for one.

## Compression

- 2026-11-02, compressed: checked: 12 directives, 7 kept, 5 less precise, 0 lost, 5 repairs; re-checked: 12 directives, 11 kept, 1 less precise, 0 lost. Left less precise: running install.sh directly in the authoring source, which the repository's own AGENTS.md forbids
- 2026-11-04, revised: the typed command `load slasher` is `load rules`, a term swap the engineer settled; not re-checked
- 2026-11-16, revised: the command `/package refresh` is `/package update`, a term swap the engineer settled; not re-checked
- 2026-11-16, revised: the update rewrites `slasher/SLASHER.md` and checks `AGENTS.md` for its import line, which the engineer settled; checked: 18 directives, 17 kept, 1 less precise, 0 lost, 1 repair: pass on what each script reports and do not guess at its work; re-checked: 18 directives, 18 kept, 0 less precise, 0 lost
- 2026-11-16, revised: the update runs the pulled installer's migrations, which the engineer asked for; checked: 18 directives, 16 kept, 1 less precise, 1 lost, 2 repairs: the migrations ask nothing, and their changes are left uncommitted for the engineer; re-checked: 18 directives, 17 kept, 1 less precise, 0 lost. The source decides the less precise one kept: it forbids guessing at the script's work, as the compressed text does, and an earlier check counted it kept
- 2026-11-17, revised: `/packages update` updates many packages and `/package update` one, which the engineer settled; checked: 23 directives, 21 kept, 2 less precise, 0 lost. Left less precise: running install.sh directly in the authoring source, as before, and naming `slasher/SLASHER.md` as the bootstrap, which point 1 does not need to act
- 2026-11-17, revised: the script `refresh-packages.sh` is `update-packages.sh`, a term swap the engineer settled; not re-checked

## History

Until Tue Nov 17 2026 the script `update-packages.sh` was named `refresh-packages.sh`.

Until Tue Nov 17 2026 `/package update` updated the packages named, or every one, and `/packages update` was its alias. The engineer made `/packages update` the command for many packages, and `/package update` the command for one.

Until Mon Nov 16 2026 the update ran no migration. The installer's migrations ran only when `install.sh agents-md` was run after it.

Until Mon Nov 16 2026 the update compared the Slasher section of the project's `AGENTS.md` with the installed bootstrap, and said to regenerate it by hand where the two differed.

Until Mon Nov 16 2026 the command was `/package refresh`. The engineer renamed it `/package update`.

Until Sun Nov 15 2026 this rule said "consuming project" for a Slasher project, and named the registry `consuming-projects.toml` and its reader `read-consuming-projects.sh` where it named them.

Until Wed Nov 4 2026 the typed command was `load waytide`.

Related:

- the work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported rule — why no other project is touched
- the a-project-declares-which-installed-packages-are-active rule — `/package activate` and `/package deactivate`

---

Authored by Scott Bellware on Mon Nov 2 2026 at 21:02:21 PT
Changed by Scott Bellware on Wed Nov 4 2026 at 18:22:26 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 20:47:18 PT
Changed by Scott Bellware on Sun Nov 15 2026 at 23:44:42 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 13:08:22 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 23:21:51 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 23:53:29 PT
Changed by Scott Bellware on Tue Nov 17 2026 at 11:38:25 PT
Changed by Scott Bellware on Tue Nov 17 2026 at 11:43:35 PT
