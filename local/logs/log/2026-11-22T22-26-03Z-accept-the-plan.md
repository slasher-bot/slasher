# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan?
>
> 1. Start an unattended implementation for #1, "Location and participation are asked when a progression is started". Use a branch and a worktree. Write its record Active, make the item Progression, and log both. Commit them on master when you select it.
> 2. Amend the progression rule. new writes the record Open on the upstream branch, creates no branch, and asks neither question. start asks both questions, unless the work is unattended, and creates the branch.
> 3. Amend the attended-or-unattended rule, so the question is asked when the work is started.
> 4. Amend the progressions-directory rule. An Open record carries no branch, base, or working location until it is started.
> 5. Change the help and skill text for new in /feature, /experiment, /content, /progression, and /implementation.
> 6. Check each changed compressed text with fresh agents. Record the figures.
> 7. Write no test. No script changes. The status line already skips a record that names no branch.
> 8. Compile, run the automated suite, and commit on the branch.
> 9. The merge to master and the conclusion wait for you.

The options:

- **Accept** — The agent makes the decisions and generates through.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
