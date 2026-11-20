# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Write a test for a new script, local-directory.sh. With no local key in the project's registry entry, it prints slasher/local, or local in the authoring source.
> 2. Test that it prints the configured path, with a leading ~ read as the home directory.
> 3. Test that a configured directory that does not exist stops with an error that names the path.
> 4. Test that a worktree finds the main project's entry, so every worktree uses the one directory.
> 5. Write local-directory.sh so those tests pass.
> 6. Make load-rules.sh, session-start.sh, current-progression.sh, assemble-plugin.sh, and the branch-switch and process-question-log hooks ask local-directory.sh, each test first.
> 7. Make install.sh's migrations act on the directory local-directory.sh names.
> 8. Write a foundation rule: slasher/local/ in every rule means the directory local-directory.sh names. A record there is committed in the git repository that holds it. Where no git repository holds it, the record is not committed, and the agent says so.
> 9. Add the key to the registry's description in read-project-setting.sh and the foundation README.
> 10. Run compile.sh and the full suite.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
