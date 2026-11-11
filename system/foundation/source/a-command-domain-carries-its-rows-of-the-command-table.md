# A command domain carries its rows of the command table

**Trigger:** When writing or changing a Slasher command, its help, or a shortcut alias

**A command domain's rows live beside its skill, in `command-table-rows.md`.** A command domain is a group of root commands that share one heading, one description, and one help command in the Slasher help. Its row names the domain's help command, and its description is the one under that heading. A domain with no root command of its own name has a skill named for the domain, as `/process` for PROCESS and `/language` for LANGUAGE, and its rows live beside that skill. A package carries the rows of the domains it holds, as `imap` carries `/email`'s.

**One row to a domain, and a few root commands have rows of their own.** `/features` has a row below `/feature`, `/experiments` below `/experiment`, `/decision` below `/log`, and `/observation` below `/decision`, each in its domain's rows file. `/sc, /shortcuts` and `/load` have rows of their own, beside their skills. The PHASE domain has no row. Write no other root command, alias, or subcommand into a row.

**A description may open with *These commands*, as the help does.** No description opens with *This command*. Keep each row in line with the help: when a domain's heading, its help command, or its description changes in the help, change its row in the same commit.

**The table's top rows are foundation's.** `plugin/command-table-header.md` holds the heading and the rows that open the table: `/slasher help`, then each command with a shortcut alias, the alias first, as `/., /recent`. Their order is `/;, /commands`, `/., /recent`, `/', /current`, `/>>, /next`, `/?, /next?`, `/??, /clarify`, `/#, /estimate-confidence`, `/!, /unattended`, and `/.., /ask-again`.

**The help's order is the table's order.** `plugin/help-order` lists the domains in the order the help and the table both follow. A domain it does not list follows, in name order. Add a new domain to it where its row belongs.

**A shortcut alias changes three files together.** Change its row in `command-table-header.md`, its row in `plugin/shortcuts.md`, and `plugin/command-table-startup.md` where it names the alias, in the same commit.

**The startup table's four rows stand in `plugin/command-table-startup.md`.** A row names the command first and its shortcut alias after it, as `/recent, /.`, which is the reverse of the full table. The `/slasher help` row also names `/help`. The `/commands, /;` row reads *Print the list of Slasher commands*. The `/recent, /.` row takes `/recent`'s description from the help. The `/current, /'` row reads *Lists the current items, features, and experiments.* The plugin build writes the sentence below them, naming every other command, so the sentence is never written by hand.

**Each table is followed by the help line:** *Type /help for all of Slasher's help, or /<command> help for one command's.* The plugin build adds it.

**Why:** a package that is not installed should add no row, and a row kept beside its command changes with it. The order and the wording stay consistent because one rule states them, read when a command is written, not at every session start.

**How to apply:** when you write or change a command, its help, or a shortcut alias, change its row in its domain's `command-table-rows.md`, or foundation's plugin files for the top rows and the shortcuts, and run `./compile.sh` so the plugin's tables are rebuilt.

Related:

- the the-command-domain-table-prints-when-the-rules-have-loaded rule — the startup table, printed at the end of the session-start read
- the the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin the tables are built into

---

Authored by Scott Bellware on Tue Nov 10 2026 at 9:49:16 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:45:30 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:04:38 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:06:56 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:30:49 AM PT
