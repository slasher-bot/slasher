![Slasher](material/slasher-logo-wide.png)

# Human in the Loop Harness

The engineer decides. The agent generates. Humanity rules.

Where there is ambiguity, the agent gives the engineer options, including the option to take over.

## What Slasher Offers

- **Rules that direct the agent's behavior.** Rules are written in prose, one rule per file. Most are pre-loaded at the start of every session. The rest load on demand, at the moment the agent takes the act they govern, such as writing a commit message.
- **Work that records itself.** Detailed event logs recorded for every step and decision about ideas, features, experiments, designs, plans, and just about every aspect of a project.
- **Commands for the work.** Slash commands record items and decisions, start features and experiments, take the next step, and say what was recently done. `/help` lists them all.
- **A design method with the engineer in control at decision points.** Design By Efferent: the agent stops at the decisions that matter and offers options, never a single proposal.
- **Human in the loop, or fully automated.** When a feature or experiment starts, the engineer chooses how much autonomy the agent is given.
- **Project-local rules.** A project's own rules and terms sit beside Slasher's, and take precedence over them.
- **Journaling.** The engineer keeps a journal in their own words. The agent reads it at the start of a session, and writes an entry only when the engineer dictates one.
- **Domain conventions.** Packages for language, testing, git, and versioning.
- **Email.** An optional package, `imap`, fetches IMAP mail and Gmail labels into the project, with each credential kept in the macOS Keychain.
- **Machinery.** The installer, package sets, a session-start hook, a status line, and commands.

## Install Slasher

Slasher's packages are installed using `git subtree`. Each package is its own subtree, which allows the packages to be refreshed from the source.

Install all of Slasher's packages at once with:

```
curl -O https://raw.githubusercontent.com/slasher-bot/slasher/master/install
sh install
```

The `install` script installs and refreshes packages. It optionally takes a list of names that contains either the names of packages, or a named _package set_. With no arguments it installs the default set of packages.

The script fetches the packages over SSH. Where no SSH key is registered, run it as `SLASHER_ORIGIN=https://github.com/slasher-bot sh install`.

### Warning

Execute the install script using `sh`:

`sh install`

The file is committed as an executable, but `curl` transfers content and not file metadata. The copy it writes is not executable, whatever mode the original carries. Every other script here is invoked as itself, because every other script reaches a project by `git subtree`, which does preserve the mode.

## Commands

Type `/help` for the full list, or `/<command> help` for an individual command.

| Command | Description |
|---|---|
| `/slasher help` | Print the help of every Slasher command |
| `/commands, /;` | Print this table |
| `/recent, /.` | Brief summary of recent work, and what's next. |
| `/current, /'` | Lists the current items, then the current features and experiments. |
| `/next, />>` | Proceed to the next step in the current multi-step process, or resume interrupted work |
| `/next?, /?` | "What are we doing?" or "what's next?" The next step in the current multi-step process, or the step that has been interrupted. |
| `/item` | Items hold the project's thinking: ideas, plans, designs, notes, and work to be done, each with a state. |
| `/feature` | A feature builds something the project needs, on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/features` | Lists the current features. |
| `/experiment` | An experiment tests a question on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/experiments` | Lists the current experiments. |
| `/process` | These commands move the work under way along: take its next step, or say what was done and what's next. |
| `/log` | The log records what was decided and when, and a work session record tells the story of a stretch of work. |
| `/decision` | Log a decision, tagged [decision] |
| `/note` | Record a note |
| `/journal` | The journal is the writer's own record of what they think, either stored with the project or kept in a private journal. |
| `/brainstorm` | Brainstorming records points as they are said, freeform in no order, and organizes them when the writer is done. |
| `/test` | These commands run the project's tests, or other compliance routines, quality checks, and report on them. |
| `/projects` | Lists the Slasher projects registered on this machine. The list helps move ideas, new patterns, and corrections into other projects. |
| `/release` | Presents the candidates for a package's next version, for the engineer to choose. |
| `/package` | These commands manage the installed packages: which are active, refreshing them, and installing Slasher. |
| `/language` | These commands work on language: reserving a word, ETE, Slasher's implementation of STE and its extensions, and clarifying language, often the agent's. |
| `/email` | These commands fetch IMAP email into the project, and list the accounts whose credentials are kept in the macOS Keychain. |
| `/clarify, /??` | Explain the previous answer again using what the agent knows of the engineer's understanding |
| `/ask-again, /aa` | Repeat the agent's previous multiple-choice question |
| `/estimate-confidence, /#` | The agent's confidence of proceeding unattended from where the work stands |
| `/unattended, /!` | Carry out a request on the agent's own, after a plan is accepted |
| `/shortcuts, /sc` | Print the shortcuts table |
| `/load` | Loads the rules now, without waiting for the first prompt. |

## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification without permission. The license text is forthcoming and will be published in `LICENSE`.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
