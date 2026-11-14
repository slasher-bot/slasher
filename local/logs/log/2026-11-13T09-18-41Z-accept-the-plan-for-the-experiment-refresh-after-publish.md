# Accept the plan for the experiment "Refresh after publish"? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the plan for the experiment "Refresh after publish"?
>
> 1. Examine the registry. Read ~/.config/slasher/consuming-projects.toml and system-project.toml. For each project, record its path, its installed packages, its package set, and how far its packages are behind the published ones. Change nothing.
> 2. Outstanding migrations. Read local/migration/ and the installer's move steps. For each project, list the migrations it has not had, such as Waytide renamed Slasher, the harmonized states, and observation items becoming notes. Record which a refresh carries out and which need a step of their own.
> 3. Migration order. Order the projects from the fewest outstanding migrations to the most, with the least-used project first. Put the order to you to accept.
> 4. Migrate the first. In the first project, run its migrations and refresh-packages.sh, then its session-start read and its tests. Each commit there waits for your selection. Record what went wrong and what was done by hand.
> 5. Migrate another. Choose the project that differs most from the first. Migrate it the same way, and record where it differed.
> 6. Establish a procedure. Write the steps from the two migrations as a migration record. Run it on each remaining project in order, one at a time, with your selection before each commit.
> 7. At the end, record whether a publish here can refresh the consuming projects in the same act, and what that would need.

The options:

- **Accept** — Use this plan. The experiment starts when you start it.
- **Revise** — Say what to change. The agent revises the plan and shows it again.

The engineer's answer: **Accept**
