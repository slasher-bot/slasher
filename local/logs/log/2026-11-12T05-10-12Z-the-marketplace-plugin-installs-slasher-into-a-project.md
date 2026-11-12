# The marketplace plugin installs Slasher into a project, rather than carrying the rules

**Tags:** [decision]

A plugin command runs Slasher's installer, which puts slasher/system/ into the project, asking before running git init where the project is not a repository. Selected by the engineer, on the agent's recommendation, after the marketplace trial showed the plugin's skills stop without the rule loader. Recorded in the third-party marketplace experiment.
