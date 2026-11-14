# What does the experiment for "Update consuming projects, as well as the repository" test? — Refresh after publish, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> What does the experiment for "Update consuming projects, as well as the repository" test?

The options:

- **Refresh after publish** — Can a publish here also refresh the packages in each consuming project on this machine, through the projects registry, in the same act?
- **A command to update them** — Can a command, such as /projects refresh, refresh the packages in every registered consuming project and commit the refresh in each, on the engineer's request?
- **Lift the downstream rule** — Should the rule that the agent never offers or reports downstream work be relaxed, so updating the consuming projects is part of finishing a package change?

The engineer's answer: **Refresh after publish**
