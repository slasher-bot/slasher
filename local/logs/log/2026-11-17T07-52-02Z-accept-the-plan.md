# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write tests first for a new installer mode, install.sh migrate, one for each outcome below.
> 2. It renames records and runs the other record migrations, as install.sh agents-md does.
> 3. It replaces a Waytide section, or a Slasher section that is exactly the current bootstrap, with the import line.
> 4. It asks nothing. It leaves an AGENTS.md with no Slasher section unchanged, and creates no AGENTS.md, CLAUDE.md, or settings file.
> 5. It prints only what it changed, and succeeds where nothing changed.
> 6. Write a test that /package update runs that mode after the pull, so a suffixed record is renamed by the update.
> 7. Make refresh-packages.sh run the pulled installer's migrate mode after the pull, only where that installer has the mode.
> 8. Change the update rule, its help, and the README to say that the update runs the migrations.
> 9. Run compile.sh and the full suite.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
