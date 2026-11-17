# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write tests first for install.sh agents-md, one for each outcome below.
> 2. It writes slasher/SLASHER.md whole from the bootstrap, on every run.
> 3. A project with no AGENTS.md gets one holding the line @slasher/SLASHER.md. One that has the line is left unchanged.
> 4. Where AGENTS.md runs from ## Slasher to its end with exactly the current bootstrap, that span becomes the line. The text above it stays.
> 5. Where the old section differs from the bootstrap, AGENTS.md is left unchanged. The installer says to delete the section and add the line, since it cannot tell Slasher's text from the project's.
> 6. An AGENTS.md with no Slasher section gets the line appended, with the same consent as today: --append-agents-md, a question at a terminal, or a loud failure.
> 7. A Waytide section becomes the line.
> 8. /package update rewrites slasher/SLASHER.md after the pull, and says where AGENTS.md lacks the line. It compares nothing in AGENTS.md.
> 9. Change the rules, the install skills, the README, and the curl installer to match, and write a migration record for Slasher projects.
> 10. Run compile.sh and the full suite.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
