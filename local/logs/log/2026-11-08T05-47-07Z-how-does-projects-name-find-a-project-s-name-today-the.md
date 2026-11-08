# How does /projects <name> find a project's name? Today the registry lists paths, such as "~/works", and walks them for projects. It records no names. — Directory name, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> How does /projects <name> find a project's name? Today the registry lists paths, such as "~/works", and walks them for projects. It records no names.

The options:

- **Directory name** — The name is the project's directory name, such as 'checkout' for ~/works/checkout. If two projects have the same directory name, the script stops and lists both paths.
- **Path below the included root** — The name is the path below the included directory, such as 'works/checkout'. Unique by construction, but longer to type.
- **Names declared in the registry** — The registry gains a section that maps a name to a path. Only projects with a declared name can be addressed by name.

The engineer's answer: **Directory name**
