![Slasher](material/slasher-logo-wide.png)

# Human in the Loop Harness

The engineer decides. The agent generates. Humanity rules.

Where there is ambiguity, the agent gives the engineer options, including the option to take over.

## What Slasher Offers

- **Rules that direct the agent's behavior.** Rules are written in prose, one rule per file. Most are pre-loaded at the start of every session. The rest load on demand, at the moment the agent takes the act they govern, such as writing a commit message.
- **Work that records itself.** Decisions, plans, features, and experiments are recorded in the project's `slasher/` directory and committed with the code.
- **A design method with the engineer in control at decision points.** Design By Efferent: the agent stops at the decisions that matter and offers options, never a single proposal.
- **Human in the loop, or fully automated.** When a feature or experiment starts, the engineer chooses how much autonomy the agent is given.
- **Project-local rules.** A project's own rules and terms sit beside Slasher's, and take precedence over them.
- **Journaling.** The engineer keeps a journal in their own words. The agent reads it at the start of a session, and writes an entry only when the engineer dictates one.
- **Domain conventions.** Packages for language, testing, git, and versioning.
- **Machinery.** The installer, package sets, a session-start hook, a status line, and commands.

## Install Slasher

Slasher's packages are installed using `git subtree`. Each package is its own subtree, which allows the packages to be refreshed from the source.

Install all of Slasher's packages at once with:

```
curl -O https://raw.githubusercontent.com/slasher-bot/slasher/master/install
sh install
```

The `install` script installs and refreshes packages. It optionally takes a list of names that contains either the names of packages, or a named _package set_. With no arguments it installs the default set of packages.

### Warning

Execute the install script using `sh`:

`sh install`

The script fetches the packages over SSH. Where no SSH key is registered, run it as `SLASHER_ORIGIN=https://github.com/slasher-bot sh install`.

The file is committed as an executable, but `curl` transfers content and not file metadata. The copy it writes is not executable, whatever mode the original carries. Every other script here is invoked as itself, because every other script reaches a project by `git subtree`, which does preserve the mode.

### Package sets

A **package set** is a named list of packages, so a configuration that is wanted more than once is asked for by name rather than assembled again. Two exist:

- **`default`** — `foundation`, `language`, `testing`, `git`, `versioning`, `design-by-efferent`, `journal`. Everything except the tool-specific packages. This is what no arguments installs.
- **`content`** — `foundation`, `language`, `git`, `versioning`, `journal`. For a project whose product is prose or pages: articles, lessons, slide decks, a site. It leaves out `design-by-efferent`, whose five hinges are a design method for a unit of code, and `testing` with it.

```
sh install                 # the default set
sh install content         # a package set
sh install foundation git  # packages by name
sh install content journal # a set and a package together
```

A set's members are installed as ordinary packages. Nothing records which set asked for them, and a project that installed `content` is indistinguishable afterward from one that named those five packages itself.

## Commands

Type `/help` for the full list, or `/<command> help` for an individual command.

| Command | Description |
|---|---|
| `/slasher help` | Print the help of every Slasher command |
| `/?` | What are we doing? |
| `/.` | An alias of /items |
| `/>` | An alias of /next |
| `/<` | An alias of /clarify |
| `/#` | An alias of /estimate-confidence |
| `/item` | Items hold the project's thinking: ideas, plans, designs, observations, and work to be done, each with a state. |
| `/items` | This command lists the current items, then the current features and experiments. |
| `/feature` | A feature builds something the project needs, on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/features` | This command lists the current features. |
| `/experiment` | An experiment tests a question on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/experiments` | This command lists the current experiments. |
| `/recent` | This command says what was recently done, and what's next. |
| `/process` | These commands move the work under way along: take its next step, or say what was done and what's next. |
| `/next` | Proceed to the next step in the current multi-step process, or resume interrupted work |
| `/next?` | The next step in the current multi-step process, or the step that has been interrupted |
| `/clarify` | Explain the previous answer again using what the agent knows of the engineer's understanding |
| `/unattended` | Carry out a request on the agent's own, after a plan is accepted |
| `/estimate-confidence` | The agent's confidence of proceeding unattended from where the work stands |
| `/log` | The log records what was decided and when, and a work session record tells the story of a stretch of work. |
| `/decision` | Log a decision, tagged [decision] |
| `/observation` | Record an observation |
| `/journal` | The journal is the writer's own record of what they think, either stored with the project or kept in a private journal. |
| `/brainstorm` | Brainstorming records points as they are said, freeform in no order, and organizes them when the writer is done. |
| `/test` | These commands run the project's tests and report on them. |
| `/projects` | This command lists the Slasher projects registered on this machine. The list helps move ideas, new patterns, and corrections into other projects. |
| `/release` | This command presents the candidates for a package's next version, for the engineer to choose. |
| `/package` | These commands manage the installed packages: which are active, refreshing them, and installing Slasher. |
| `/language` | These commands work on language: reserving a word, ETE, Slasher's implementation of STE and its extensions, and clarifying language, often the agent's. |
| `/load` | This command loads the rules now, without waiting for the first prompt. |
| `/commands` | Print this table |

## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification without permission. The license text is forthcoming and will be published in `LICENSE`.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
