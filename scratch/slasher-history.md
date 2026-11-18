# The work that changed Slasher, from July 16 to November 18, 2026

Each date lists the changes made to Slasher that day, oldest first. Where something changed back and forth, the list gives where it ended up. Recorded ideas, trial results, and bookkeeping are left out. Slasher was named Agent Norms until July 19, and Waytide until November 6, and names are as they were on each date.

**Thu Jul 16**
- Agent Norms is set up as one composite repository, from which each package is published to its own repository with `git subtree split`.
- The `foundation`, `language`, `testing`, `git`, `docs`, `code/ruby`, and `design-by-efferent` packages are created.
- Paths and references specific to the `constant` project are removed from every package.
- A README orients a new contributor.

**Fri Jul 17**
- The `language` premise says precision is not formality, and names dramatic jargon as the failure on the technical side.
- A test context encloses tests rather than nesting them.
- Rule examples use a neutral domain in place of the `constant` project.
- The contributor guide moves from the README to `CONTRIBUTING.md`.

**Sat Jul 18**
- Each package has its own install instructions and an `install-dependencies.sh`, and the composite has `install-all.sh`.
- Conventions for planning, design, and experiments are written. An experiment records its base commit and ends in a named state.
- `foundation` has `install.sh`, which writes the bootstrap `AGENTS.md` and asks before appending to an existing one.
- `language` has a plain-communication rule and a rule against unexplained abbreviations.

**Sun Jul 19**
- Agent Norms is renamed Waytide, attributed to the Eventide Project.

**Mon Jul 20**
- Commit messages make the software the subject, not the developer.

**Wed Jul 22**
- `language` and `testing` adopt the `vocabulary.md` model, and `efferent` and `actuation` move to `language`.
- A response leads with a summary, and an earlier list item is not referred to by its number.
- Branch deletion and the work session record question go through the selection UI.
- The log is consolidated only on the engineer's command.
- A session-start notice says Waytide is loaded and lists the packages.
- Every working-state artifact carries a provenance footer.

**Thu Jul 23**
- A root `CLAUDE.md` imports `AGENTS.md`, so the bootstrap loads in Claude Code.
- A harness hook and the status line print the load notice, not the agent.

**Sun Jul 26**
- A time written into a file carries seconds.
- An experiment's working location is chosen at its start.
- The session-start notice reports experiments that have not concluded.

**Mon Jul 27**
- Features are added: a feature runs on its own branch and ends in a declared state.
- Installed packages go under `waytide/system/`, and the project's own work under `waytide/local/`.
- A refresh script pulls every installed package, and a check reports direct commits to a package repository.
- The working location is *branch only* or *branch and worktree*.
- The status line shows the directory, branch, package count, and uncommitted changes.

**Tue Jul 28**
- The session-start notice asks for the `load waytide` command.
- The status line shows unpushed commits and untracked files.

**Thu Jul 30**
- A `testing` rule governs preconditions.
- A feature's normal path and its exceptional paths go in separate test files.

**Fri Jul 31**
- Citing another package's rule does not make that package a dependency.
- A context tree comes from a test run's output, never from the source.

**Sat Aug 1**
- The read instruction names the project's own local rules.
- A feature may be built on the current branch.
- The `versioning` package is added.

**Sun Aug 2**
- One trip through the loop is a cycle, and attended or unattended is chosen at the start.
- The implementation hinge offers the red/green/refactor cycle as a candidate.
- A `foundation` rule defines `local/migration/`.

**Mon Aug 3**
- `foundation` and `versioning` have vocabularies.
- The `plan` package, formerly `docs`, is folded into `foundation`.

**Tue Aug 4**
- Disclosure is the only reason to edit a historical record.
- A project does not name its downstream consumers.
- A shell script is self-executable.

**Wed Aug 5**
- The present-every-prompt rule moves to `foundation`.

**Thu Aug 6**
- The install command is `sh install-all.sh`, and it checks the repository before installing.
- Waytide is licensed under the Eventide Common Interest License.
- Every script's usage line names the command that runs it.

**Fri Aug 7**
- `install-all.sh` offers to initialize a repository instead of refusing.
- An answer is a list, prose must justify itself, and a list item states a fact.
- A tool in `foundation` reads the Slasher projects from a per-machine registry.

**Sat Aug 8**
- A branch switch is announced in a bordered block.
- The ASD-STE100 Simplified Technical English standard is added, with two of its writing rules in `language`.
- A reference to an external standard names the standard.
- STE substitutions take effect: *start* for "initiate", *effect* for "impact", *prevent* for "protect".

**Sun Aug 9**
- `foundation` has a rule for vocabulary files.
- *Engineer* replaces "developer" throughout.
- An unattended loop presents its plan before generating anything.

**Mon Aug 10**
- A project's own vocabulary is `waytide/local/vocabulary.md`.
- The rules conform to STE's sentence-length limits.

**Tue Aug 11**
- Every paragraph stays within STE's six-sentence limit.
- Waytide follows its own substitutions, such as *justified* for "earns its keep".

**Wed Aug 12**
- Waytide's version of STE is named Eventide Technical English (ETE), with five categories of its own.
- A package is published from the upstream branch.

**Thu Aug 13**
- Solubility is cognitive, and code generation is defined.
- Reserving a word follows a set sequence of steps, and the `ste/` directory is renamed `ete/`.

**Fri Aug 14**
- The `diary` package is created: each writer keeps a diary, stamped in local time to the minute.
- Project context lives in committed records, never in an agent memory store.
- *Evaluate* replaces "score", and *free-text option* replaces "escape".

**Sun Aug 16**
- Work in a downstream project is never offered, and its pending state is not reported.
- A record's state is stated on a `**State:**` line.

**Mon Aug 17**
- *Cost* replaces "price".

**Tue Aug 18**
- A commit subject stops at 50 characters, and its body wraps at 72.
- Experiments and features become one concept, the implementation.
- `diary` is renamed `journal`.
- The running records are grouped under `logs/`.
- A suspension is a log entry, not a directory.

**Thu Aug 20**
- Packages are cloned over SSH.
- The README is rewritten around what Waytide offers.

**Fri Aug 21**
- The Ruby package leaves the composite and becomes a tool-specific package.
- A package may declare its own repository.

**Sun Aug 23**
- A SHA identifies the work, not the commit.
- A printed list of records is a table with created and changed columns.
- Content work is outside Design By Efferent.
- Package sets: a set is a named list of packages, installed by name, and a project declares its active packages.
- Tool-specific packages are grouped under `ext/`.

**Mon Aug 24**
- The project's local rules and vocabulary override the packages.

**Tue Aug 25**
- Prose is not hard-wrapped, and existing records are unwrapped.
- The log never says undone work was done.
- A writer may direct a change to their own journal entry.

**Sat Oct 10**
- A high-level test context names a behavior.
- When the work and the plan disagree, the work is definitive.
- A hook prints the startup display.

**Mon Oct 12**
- Rules are compiled from source, and the session-start read uses the compiled rules.

**Wed Oct 14**
- A rule's history moves into a History section, which the compiler leaves out.
- The source is compiled before a package is published.

**Tue Oct 20**
- Test setup is no longer called "arrange".
- A test file waits for the three test hinges before it is assembled.

**Wed Oct 21**
- An experiment may run in phases.
- The compiler compiles each rule's compressed text, and the first rules are compressed.

**Thu Oct 22**
- Log entries for the engineer's decisions are tagged `[decision]`.

**Fri Oct 23**
- Compressed texts are numbered lists.
- The `testing` rules are compressed.

**Sat Oct 24**
- The rules of `design-by-efferent`, `versioning`, `language`, `journal`, and `foundation` are compressed.

**Sun Oct 25**
- A log entry is one line unless it needs a body.
- A migration record is written before the work, and updated as it goes.
- Rules in every package are renamed so their names say what they say.

**Mon Oct 26**
- The log is called the log, and `logs/` holds the contemporaneous, historical records.
- Active is the in-progress state.
- A test of behavior that already exists is coverage, not design.

**Tue Oct 27**
- Every preference the engineer expresses is asked about at once.
- A list of items has ordinals and no SHAs.
- An explanation is short and shows an example.

**Wed Oct 28**
- The compiler writes one rules file per package.
- Private journals, kept outside the repository, are added.
- Rules are split into pre-loaded rules and on-demand rules, which load on a trigger.

**Thu Oct 29**
- A hook asks for the rules to be read again after a compaction.
- A response is clarified twice before it is sent.
- The agent offers a commit when one is due. The question can be snoozed, but never on `master`.
- The `[work-item]` tag is renamed `[work]`.

**Fri Oct 30**
- A size is described as *smaller*, not "shorter".
- Every example is drawn from one ordinary project, a checkout.

**Mon Nov 2**
- Item commands take plan, design, aspiration, and goal.
- A rule governs how a command is typed.
- Phases print on request, each with its own verdict.

**Tue Nov 3**
- Every command in the help has a rule.
- `/log` and `/load` are skills.
- The Claude Code plugin is named `slasher`.

**Wed Nov 4**
- The Slasher plugin's hook now carries the start of each session.
- The startup display has two parts: a loading line, then the figure.
- The command `load rules` asks for the rules to be loaded.
- New commands: `/item`, `/feature`, `/experiment`, and a work-status command.

**Thu Nov 5**
- More commands become skills: `/phase`, `/next` and `/next?`, `/journal`, `/test`, `/projects`, `/release`, `/package`, `/package-set`, `/reserve`, `/expand`, `/clarify`, and `/load`.
- `/slasher help` prints the full help.
- Rules whose trigger is a specific act load only when that act comes up.

**Fri Nov 6**
- The attended-or-unattended question shows the agent's confidence and the risk of redoing work, and recommends Attended when confidence is low.
- Unattended work shows its plan and waits for the engineer to accept it.
- A hook logs each process question with its answer.
- The command table prints once the rules load.
- Waytide is renamed Slasher, and the GitHub organization is `slasher-bot`. The installer moves an old `waytide/` directory to `slasher/`.
- A hook announces when the working tree switches branch.

**Sat Nov 7**
- A bare `/slasher` offers topics to learn about.
- New commands: `/unattended`, `/recent`, `/items`, `/help`, `/improvement`, and `/correction`.
- The status line's second line shows the branch, the current implementation, and the phase under way.
- The startup command table is cut to four rows.

**Sun Nov 8**
- `/projects` carries out an instruction in another project.
- New commands: `/estimate-confidence` and `/decision`.
- `/next` resumes interrupted work.
- A phase's commits are squashed when its implementation concludes, and the verdict question is asked at the end.
- `/features` and `/experiments` list the current records.

**Mon Nov 9**
- Items and implementations share one set of states, including Discontinued.
- A bare `/log` logs the work under way.
- The status line reads the records in every worktree.

**Tue Nov 10**
- The `imap` package fetches email into the project, with credentials in the Keychain, through `/email`.
- `/shortcuts` prints the table of shortcuts.
- An escaped selection is not asked again unasked.
- Design By Efferent applies less strictly to Slasher's own code.

**Wed Nov 11**
- `/ask-again`, `/aa`, puts the last question again.
- A remark worth keeping is a note, recorded with `/note`.
- `/brief` answers in brief.
- `/install` installs Slasher where it isn't installed.

**Thu Nov 12**
- The marketplace plugin `slasher-install` carries the installer and `/install`.
- `/private` keeps documents and whole sessions out of the repository.
- `/push`, `/p`, is a new command.

**Fri Nov 13**
- The `smtp` package sends email.
- `/packages` lists the installed packages and acts on one of them.
- A reply that writes a record ends with the record's path.

**Sat Nov 14**
- Fetched email can be stored in the project.
- Implementations are started and concluded, and Completed replaces Done.
- `/record`, `/records`, and `/open` act on records.

**Sun Nov 15**
- The `prose` package, with `/review` and `/print-and-review`.
- `/commit-and-push`, `/cp`, is a new command.
- When a question has code examples, they show in the chat before the selection.
- Installing over an existing `AGENTS.md` asks first.
- The project registry is `projects.toml`, and "Slasher project" replaces "consuming project".

**Mon Nov 16**
- `/package refresh` is renamed `/package update`.
- `/item status`, `/feature status`, `/experiment status`, and `/status` are new.
- `/pros-and-cons` replaced the commands for "I don't know" and for asking to clarify.
- `prose` has `/edit`.
- Record file names no longer carry their state.
- A project's local directory can be moved through its registry entry.
- `/unrecorded` starts a session that writes no record.
- Slasher's instructions to the agent move into `slasher/SLASHER.md`.
- `/package update` runs the new installer's migrations.

**Tue Nov 17**
- `/packages update` updates many packages, and `/package update` updates one.
- `refresh-packages.sh` is renamed `update-packages.sh`.
- `/unrecorded <instruction>` and `/private <instruction>` end their session once the instruction is done.

**Wed Nov 18**
- `/system` is a new command, for the machine's system project.
- `/brainstorm <text>` records one line as a brainstorm.
