| Command | Description |
|---|---|
| `/slasher help` | Print the help of every Slasher command |
| `/commands, /;` | Print this table |
| `/recent, /?` | Brief summary of recent work, and what's next. |
| `/current, /'` | Lists the current items, then the current features and experiments. |
| `/work-status, /ws` | The status of the work under way, or of the item, feature, experiment, or content named |
| `/conclude, /cw` | Conclude the work under way, or the item, feature, experiment, or content named, in the concluding state you select |
| `/next, /proceed, /.` | Proceed to the next step in the current multi-step process or with the action that the agent is suggesting, or resume interrupted work |
| `/next?` | "What are we doing?" or "what's next?" The next step in the current multi-step process, or the step that has been interrupted. |
| `/item` | Items hold the project's thinking: ideas, plans, designs, notes, and work to be done, each with a state. |
| `/feature` | A feature builds something the project needs, on its own branch or worktree, to a declared end. Features and experiments are both kinds of progressions. |
| `/features` | Lists the current features. |
| `/experiment` | An experiment tests a question on its own branch or worktree, to a declared end. Features and experiments are both kinds of progressions. |
| `/experiments` | Lists the current experiments. |
| `/content` | Content is a piece of writing, built on its own branch or worktree to a declared end. It is a kind of progression, without the steps that serve only code. |
| `/contents` | Lists the current content. |
| `/progression, /implementation` | A progression is a bounded piece of work on its own branch or worktree, to a declared end. These commands create one with no kind, and list the current progressions of every kind: features, experiments, and those with no kind. |
| `/progressions, /implementations` | Lists the current progressions of every kind. |
| `/process` | These commands move the work under way along: take its next step, or say what was done and what's next. |
| `/log` | The log records what was decided and when, and a work session record tells the story of a stretch of work. |
| `/decision` | Log a decision, tagged [decision] |
| `/note` | Record a note |
| `/notes` | List the notes |
| `/record` | These commands print or copy the path of, print, or open the most recent principal record, open or print any record by name, and open or print the last record or text worked on. |
| `/records` | The records line ends a reply that wrote a record, with the full path of the record it is about. |
| `/journal` | The journal is the writer's own record of what they think, either stored with the project or kept in a private journal. |
| `/private` | Anything given to /private is recorded only in the private directory, outside the project's repository, and is read only on command. |
| `/unrecorded` | An unrecorded session writes no record anywhere, in the project or in the private directory. The agent still answers and prints every reply, and files that are not records still change. |
| `/brainstorm` | Brainstorming records points as they are said, freeform in no order, and organizes them when the writer is done. |
| `/test` | These commands run the project's tests, or other compliance routines, quality checks, and report on them. |
| `/push, /p` | These commands commit the work and push the current branch to its remote, and never force. |
| `/commit, /c` | Commits the work on the current branch, and pushes nothing. |
| `/commit-and-push, /cp` | Commits the work, then pushes the current branch. |
| `/projects` | Lists the Slasher projects registered on this machine. The list helps move ideas, new patterns, and corrections into other projects. |
| `/release` | Presents the candidates for a package's next version, for the engineer to choose. |
| `/package` | These commands manage the installed packages: which are active, updating them, and installing Slasher. |
| `/packages` | These commands list the installed packages, update them, and act on one package. |
| `/language` | These commands work on language: reserving a word, ETE, Slasher's implementation of STE and its extensions, and clarifying language, often the agent's. |
| `/prose` | These commands review content: walk it paragraph by paragraph, suggest numbered edits, or critique it whole. |
| `/email` | These commands fetch IMAP email into the project, send a message, and list the accounts whose credentials are kept in the macOS Keychain. |
| `/pros-and-cons, /??` | Give each option of the agent's last question with its pros and cons |
| `/ask-again, /aa` | Repeat the agent's previous multiple-choice question |
| `/estimate-confidence, /%` | The agent's confidence of proceeding unattended from where the work stands |
| `/unattended, /!` | Carry out a request on the agent's own, after a plan is accepted |
| `/shortcuts, /sc, /:` | Print the shortcuts table |
| `/load` | Loads the rules now, without waiting for the first prompt. |

Type /help for all of Slasher's help, or /<command> help for one command's.
