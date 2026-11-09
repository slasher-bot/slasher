# Which outcome of the base-and-system-projects feature comes next? — Name not in the registry, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which outcome of the base-and-system-projects feature comes next?

The options:

- **Name not in the registry** — resolve-project.sh some-unknown-name. Today it prints nothing and exits 0, so this one drives new code.
- **Two projects with one name** — Two registered checkouts share a directory name. Today it prints both paths.
- **/projects runs an instruction** — The /projects skill takes -base, -system, or a name, with an instruction, and carries it out against the resolved project. Also amends the projects rule.

The engineer's answer: **Name not in the registry**
