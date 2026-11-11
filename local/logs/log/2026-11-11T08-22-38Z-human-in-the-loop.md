# Human in the loop — Unattended, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Human in the loop
>
> - Agent's confidence: 85% (how sure the agent is about working alone.)
> - Risk of redo: 15% (how likely it is that you will have to redo work the agent does.)
> - It'll work: 95% (how sure the agent is that what it builds on its own does what it says.)
> - Your approval: 80% (how sure the agent is that it does what you would do: naming, shaping, and deciding things as you would.)
>
> Plan: in both the loader and the session-start script, a package is inactive when it is installed and not on the set record's Packages line. One new test in each script's test file: a package installed after the record is listed as deactivated. A second session-start test: a default set that leaves an installed package out tells the agent to print the set. Work on master.

The options:

- **Unattended** — The agent makes the decisions and generates through if you accept the plan it'll propose.
- **Attended (Confidence: 95%)** — You decide. The agent automates.

The engineer's answer: **Unattended**
