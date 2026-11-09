# Which outcome of the base-and-system-projects feature comes next? — Missing config file, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which outcome of the base-and-system-projects feature comes next?

The options:

- **Missing config file** — resolve-project.sh -base with no slasher.toml in the parent directory, or -system with no system-project.toml. Today it prints a bare sed error or an empty path.
- **Name not in the registry** — resolve-project.sh some-unknown-name. Today it prints nothing and exits 0.
- **Two projects with one name** — Two registered checkouts share a directory name. Today it prints both paths.
- **/projects runs an instruction** — The /projects skill takes -base, -system, or a name, with an instruction, and carries it out against the resolved project. Also amends the projects rule, which today says to act on no listed project.

The engineer's answer: **Missing config file**
