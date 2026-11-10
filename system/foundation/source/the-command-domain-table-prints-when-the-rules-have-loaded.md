# The command domain table prints when the rules have loaded

**When the session-start read concludes, print the startup table, the sentence below it, and the help line, word for word.** Print them in the response that carries the read, after the package set stanza where one prints, and ahead of anything else in that response. This holds for a read started by the session's first prompt, by `/load`, and by `load rules`. A read run again after a compaction prints no table, since the engineer asked for nothing.

| Command | Description |
|---|---|
| `/slasher help, /help` | Print the help of every Slasher command |
| `/;` | Print the list of Slasher commands |
| `/., /recent` | Says what was recently done, and what's next. |
| `/', /items` | Lists the current items, features, and experiments. |

The other commands are `/item`, `/items`, `/feature`, `/features`, `/experiment`, `/experiments`, `/recent`, `/process`, `/next`, `/next?`, `/clarify`, `/unattended`, `/estimate-confidence`, `/log`, `/decision`, `/observation`, `/journal`, `/brainstorm`, `/test`, `/projects`, `/release`, `/package`, `/language`, `/load`, and `/commands`.

Type /help for all of Slasher's help, or /<command> help for one command's.

**The startup table is the full table abridged.** Its four rows stand as written here, and are not copied from the full table. The `/slasher help` row also names its alias `/help`. The `/;` row reads *Print the list of Slasher commands*, since the table `/;` prints is the full table, not this one. The `/.` row names `/recent` beside it, as `/., /recent`, and takes the description `/recent` has in the help, without *This command*. When that description changes, change the startup table in the same commit. The `/'` row names `/items` beside it, as `/', /items`, and reads *Lists the current items, features, and experiments.*, a shorter form of the description `/items` has in the help. The sentence below it names, in the full table's order, every command and alias whose row the startup table leaves out, except the aliases `/>>`, `/?`, `/>`, `/??`, and `/#`. When a row is added to the full table or removed from it, change the sentence in the same commit.

**The full table is the command domain table.** `/command-table` prints it, and the startup read does not.

| Command | Description |
|---|---|
| `/slasher help` | Print the help of every Slasher command |
| `/;, /commands` | Print this table |
| `/., /recent` | Says what was recently done, and what's next. |
| `/', /items` | Lists the current items, then the current features and experiments. |
| `/>>, /next` | Proceed to the next step in the current multi-step process, or resume interrupted work |
| `/?, /next?` | The next step in the current multi-step process, or the step that has been interrupted |
| `/>, /clarify` | Explain the previous answer again using what the agent knows of the engineer's understanding |
| `/??, /#, /estimate-confidence` | The agent's confidence of proceeding unattended from where the work stands |
| `/item` | Items hold the project's thinking: ideas, plans, designs, observations, and work to be done, each with a state. |
| `/feature` | A feature builds something the project needs, on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/features` | Lists the current features. |
| `/experiment` | An experiment tests a question on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/experiments` | Lists the current experiments. |
| `/process` | These commands move the work under way along: take its next step, or say what was done and what's next. |
| `/unattended` | Carry out a request on the agent's own, after a plan is accepted |
| `/log` | The log records what was decided and when, and a work session record tells the story of a stretch of work. |
| `/decision` | Log a decision, tagged [decision] |
| `/observation` | Record an observation |
| `/journal` | The journal is the writer's own record of what they think, either stored with the project or kept in a private journal. |
| `/brainstorm` | Brainstorming records points as they are said, freeform in no order, and organizes them when the writer is done. |
| `/test` | These commands run the project's tests and report on them. |
| `/projects` | Lists the Slasher projects registered on this machine. The list helps move ideas, new patterns, and corrections into other projects. |
| `/release` | Presents the candidates for a package's next version, for the engineer to choose. |
| `/package` | These commands manage the installed packages: which are active, refreshing them, and installing Slasher. |
| `/language` | These commands work on language: reserving a word, ETE, Slasher's implementation of STE and its extensions, and clarifying language, often the agent's. |
| `/load` | Loads the rules now, without waiting for the first prompt. |

Type /help for all of Slasher's help, or /<command> help for one command's.

**Each table is followed by the help line:** *Type /help for all of Slasher's help, or /<command> help for one command's.* It stands one blank line below the startup table's sentence, and one blank line below the full table. It names `/help`, the alias of `/slasher help`, which prints the help of every Slasher command.

**Each row is one command domain, except the `/slasher help`, `/unattended`, `/items`, `/features`, `/experiments`, `/recent`, `/next`, `/next?`, `/clarify`, `/estimate-confidence`, `/decision`, `/observation`, and `/commands` rows.** A command domain is a group of root commands that share one heading, one description, and one help command in the Slasher help. The row names the domain's help command, and its description is the one under that heading. The help command is the command `/<command> help` runs on to print the domain's help. For a domain with no root command of its own name, it is the skill named for the domain, as `/process` for PROCESS and `/language` for LANGUAGE. `/items`, `/recent`, `/next`, `/next?`, `/unattended`, and `/estimate-confidence` are root commands of the PROCESS domain, `/clarify` of the LANGUAGE domain, and `/decision` of the LOG domain. Each has a row of its own. `/unattended` stands below the `/process` row, and `/decision` below the `/log` row. The rows of the commands with shortcut aliases stand at the top, as the paragraph on shortcut aliases sets out. `/features` is a root command of the FEATURES domain, and `/experiments` of the EXPERIMENTS domain. `/features` has a row below the `/feature` row, and `/experiments` below the `/experiment` row. `/observation`, an alias of `/item observation` in the ITEM domain, has a row below the `/decision` row. Write each row as it stands here. A description may open with *These commands*, as the help does. No description opens with *This command*. Print no other root command, alias, or subcommand in the table. `/observation` and `/commands` are the only aliases with rows of their own. `/help` and `/command-table` itself have none.

**After the startup table, its sentence, and the help line, run `/items 10`.** In the same response, below them, print the ten most recently created current items and the current implementations, as the `/items` command prints them. Head the items *10 most recent items*. Where the project has no items directory, print nothing in place of it. A read run again after a compaction runs no `/items 10`, for the same reason it prints no table.

**A shortcut alias shares its command's row, ahead of the command.** `/'` is an alias of `/items`, `/.` of `/recent`, `/>>` of `/next`, `/?` of `/next?`, `/>` of `/clarify`, `/??` and `/#` of `/estimate-confidence`, and `/;` of `/command-table`. Their rows stand directly below the `/slasher help` row, where the alias rows stood, in this order: `/;, /commands`, `/., /recent`, `/', /items`, `/>>, /next`, `/?, /next?`, `/>, /clarify`, and `/??, /#, /estimate-confidence`. Where a command has two shortcut aliases, the newer stands first.

**The PHASE domain has no row.** `/slasher help` still gives its help, and so does `/phase help`.

**The first row names `/slasher help`, which prints the help of every Slasher command.** It names no command domain.

**`/command-table` prints the full table.** It prints the full table and the help line below it, word for word, and nothing else: no startup table, no sentence, no `/items 10`, and no package set stanza. The engineer asks for it to see the commands again during a session. `/command-table` belongs to no command domain, and has no row. `/commands` and `/;` are aliases of `/command-table`, and the help header names them. `/;` and `/commands` share the second row.

**The agent prints the table, not the harness.** The harness renders its display as plain text, and the table needs markdown. That is the reason the package set stanza is the agent's too.

**Keep the table in line with the help.** When a domain's heading, its help command, or its description changes in the help text, change this table in the same commit.

**Why:** the engineer sees the commands at the moment they can start using them. The startup table is small, so the start of a session fits on the screen. Its sentence still names every command, `/;` prints the full table, and `/slasher help` gives the detail. The full table gives one line for each domain but PHASE, and lines for `/next`, `/next?`, `/clarify`, and their aliases, so it shows the whole set at a glance. The current items and implementations show the engineer where the work stands before they make the first request.

**How to apply:** at the end of the session-start read, print the startup table and its sentence as they stand here, once, run `/items 10` below them, and then turn to the engineer's request or wait for one.

## History

Until Mon Nov 9 2026 `/<` was the alias of `/clarify`. The engineer replaced it with `/>`.

Until Mon Nov 9 2026, for part of that day, `/>` was the alias of `/next` again. The engineer replaced it with `/>>`.

Until Mon Nov 9 2026, for part of that day, `/???` was the alias of `/command-table`. The engineer changed it to `/;`.

Until Mon Nov 9 2026, for part of that day, `/>>` was the alias of `/next`, and `/>` an alias of `/next?` beside `/?`. The engineer changed `/>>` to `/>`, so `/>` takes the next step and `/?` alone names it.

Until Mon Nov 9 2026 `/?` was the alias of `/command-table`, and `/next?` and `/estimate-confidence` had one shortcut alias each, `/>` and `/#`. The engineer settled `/???` for the table, `/?` for what's next, and `/??` for the estimate, and kept `/>` and `/#` beside them.

Until Mon Nov 9 2026 `/>` was the alias of `/next`, and `/>?` the alias of `/next?`. The engineer settled that `/>>` is the alias of `/next`, and `/>` the alias of `/next?`.

On Mon Nov 9 2026 the `/', /items` row stood for a time below the `/item` row, until the engineer restored it below the `/., /recent` row.

Until Mon Nov 9 2026, for part of that day, the `/', /items` row stood at the top of the full table, below the `/., /recent` row. The engineer moved it below the `/item` row.

Until Mon Nov 9 2026 the full table's `/.`, `/'`, `/features`, `/experiments`, `/projects`, `/release`, and `/load` descriptions opened with *This command*, as the help's do. The engineer removed it.

Until Mon Nov 9 2026, for part of that day, the rows that merged a shortcut alias stood where their commands' rows had stood, and `/?, /commands` was the last row. The engineer moved them to the top, where the alias rows had stood.

Until Mon Nov 9 2026 the full table gave `/?`, `/.`, `/>`, `/<`, and `/#` rows of their own, below the `/slasher help` row, and named `/'` and `/>?` in no row. The `/.` row read *An alias of /items*, though `/.` is an alias of `/recent`. The engineer merged each shortcut alias into its command's row.

Until Sun Nov 8 2026 the startup table's sentence also named `/>`, `/<`, and `/#`, ahead of `/item`.

Until Sun Nov 8 2026 the `/items` row stood below the `/experiment` row.

Until Sun Nov 8 2026 the full table had no `/observation` row.

Until Sun Nov 8 2026 the full table had no `/decision` row.

Until Sun Nov 8 2026 the help line read *Type /help for Slasher's full help, or <command> help for help for a particular command.*

Until Sun Nov 8 2026 the help line read *Type /help for more*.

Until Sun Nov 8 2026 the help line read *For more help, type /help*.

Until Sun Nov 8 2026 no help line followed either table.

Until Sun Nov 8 2026 the `/next?` row read *The next step in the current multi-step process*.

Until Sun Nov 8 2026 the `/next` row read *Proceed to the next step in the current multi-step process*.

Until Sun Nov 8 2026 the table had no `/#` or `/estimate-confidence` row.

Until Sun Nov 8 2026 the `/clarify` row stood below the `/language` row. The engineer moved it above the `/unattended` row.

Until Sun Nov 8 2026 the full table's last row named `/command-table`. The engineer replaced it with its alias `/commands`.

Until Sun Nov 8 2026 the `/unattended` row stood below the `/<` row, above `/item`. The engineer moved it beneath the PROCESS rows.

Until Sun Nov 8 2026 the `/>` row stood below the `/next` row, and the `/<` row below the `/clarify` row. The engineer moved both beneath the `/.` row.

Until Sun Nov 8 2026 the full table had fourteen rows, from `/slasher help, /help` to `/test`, and no row for the PROCESS, PROJECTS, RELEASE, PACKAGES, LANGUAGE, and LOAD domains. The engineer restored the rows the table had before the Sat Nov 7 2026 revision, as written, and added rows for `/next`, `/>`, `/next?`, `/clarify`, and `/<`.

Until Sun Nov 8 2026 the startup table's sentence named `/unattended`, `/item`, `/items`, `/feature`, `/experiment`, `/recent`, `/log`, `/journal`, `/brainstorm`, and `/test`, and the startup table kept the full table's first four rows.

Until Sat Nov 7 2026 the startup table's `/'` row named only `/'`.

Until Sat Nov 7 2026 the startup table's `/.` row named only `/.`.

Until Sat Nov 7 2026 the startup table's `/'` row took the `/items` row's description, *Lists the current items, then the current features and experiments.*

Until Sat Nov 7 2026 the startup table's `/?` row read *Print this table*, as the full table's does.

Until Sat Nov 7 2026 the startup table's `/.` and `/'` rows read *An alias of /recent* and *An alias of /items*, as the full table's do. The engineer gave them the descriptions of `/recent` and `/items`.

Until Sat Nov 7 2026 the session-start read printed the full table. The engineer abridged it to its first four rows, followed by a sentence naming the other commands.

Until Sat Nov 7 2026 the first row named only `/slasher help`. The engineer added its alias `/help` to the row.

Later on Sat Nov 7 2026 the engineer swapped `/.` and `/'` back, so `/.` is again an alias of `/recent` and `/'` of `/items`.

On Sat Nov 7 2026 `/.` was for a time an alias of `/items` and `/'` an alias of `/recent`, after the engineer swapped them.

Until Sat Nov 7 2026 the `/test` row read *Run the project's tests and report on them.*

Until Sat Nov 7 2026 the `/items` row stood below the `/experiment` row, above `/recent`.

Until Sat Nov 7 2026 the `/items`, `/recent`, and `/test` rows opened with *This command* or *These commands*, as the help does.

Until Sat Nov 7 2026 the PROJECTS, RELEASE, and PACKAGES domains had the `/projects`, `/release`, and `/package` rows, below the `/test` row.

Until Sat Nov 7 2026 the LANGUAGE domain had a `/language` row, below the `/package` row.

Until Sat Nov 7 2026 the LOAD domain had a `/load` row, the last in the table.

Until Sat Nov 7 2026 the PROCESS domain had a `/process` row, below the `/recent` row.

Until Sat Nov 7 2026 `/command-table` had the last row of the table. The engineer removed it, and `/?` has the row that prints the table.

Until Sat Nov 7 2026 the `/unattended` row ended *after a plan is accepted*.

Until Sat Nov 7 2026 the table had no `/'` row.

Until Sat Nov 7 2026 `/.` was an alias of `/items`, and its row said so. The engineer made it an alias of `/recent`.

Until Sat Nov 7 2026 `/?` answered *What are we doing?*, and its row said so. The engineer made it an alias of `/command-table`.

Until Sat Nov 7 2026 the table had no `/.` row, and named no alias.

Until Sat Nov 7 2026 the `/?` row stood below the `/recent` row, and `/unattended` stood second.

Until Sat Nov 7 2026 the table had no `/?` row.

Until Sat Nov 7 2026 the `/recent` row named `/brief`.

Until Sat Nov 7 2026 the table had no `/unattended` row, and `/item` stood second.

Until Sat Nov 7 2026 the rows of `/items` and `/brief` named `/report` and `/report brief`, and the read ran `/report 10`.

Until Sat Nov 7 2026 a bare `/slasher` printed the table. It now offers topics to learn about, under the a-bare-slasher-offers-topics-to-learn-about rule, and selecting *Commands* there prints the table.

Until Fri Nov 6 2026 the table had a `/phase` row, below the `/experiment` row.

Until Fri Nov 6 2026 the table opened with the `/item` row, and no row named `/slasher help`.

Until Fri Nov 6 2026 the rows of `/report` and `/report brief` named `/current` and `/work-status`, and the read ran `/current 10`.

Until Fri Nov 6 2026 the read ran `/current 5`, and printed the five most recently created current items.

Until Fri Nov 6 2026 the items printed after the table took no heading of their own.

Until Fri Nov 6 2026 a bare `/slasher` printed nothing, and the table printed only when the rules loaded.

Until Fri Nov 6 2026 the `/process` row named only `/process`. For a time on that day it also named `/current` and `/work-status`, before each took a row of its own. Those rows stood below the `/process` row before they moved above it.

Until Fri Nov 6 2026 only a bare `/slasher` printed the table during a session. `/command-table` did not exist. When it was first added, it had no row in the table.

Until Fri Nov 6 2026 `/command-table` had no alias. The engineer then made `/commands` its alias.

Related:

- the the-startup-display-prints-as-the-session-starts rule — the display the harness prints ahead of the read
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — what the agent prints at the start, and what it does not
- the the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin whose help the table follows
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — what `/items 10` prints

---

Authored by Scott Bellware on Fri Nov 6 2026 at 9:34:21 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:49:50 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:37:03 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:29:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:32:53 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:36:16 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:52:38 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:55:31 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:56:59 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:58:45 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:02:30 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:03:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:00:59 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:08:55 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:35:54 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:36:20 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:00:17 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:04:28 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:17:53 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:27:22 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:34:55 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:42:33 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:43:22 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:46:44 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:48:15 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:46:02 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:47:52 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:22:34 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:30:01 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:33:05 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:34:20 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:36:02 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:38:03 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:41:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 1:49:57 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 1:57:29 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 1:59:32 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:00:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:01:25 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:30:59 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:33:46 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:34:17 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 5:31:46 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 5:34:48 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 6:58:17 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 7:01:58 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 7:04:23 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 7:07:26 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:30:26 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 10:26:09 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 10:53:56 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 12:48:53 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 12:52:41 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 1:02:10 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 1:05:30 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 1:09:02 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:36:17 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:41:08 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:42:14 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:44:49 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:46:25 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:47:11 PM PT
