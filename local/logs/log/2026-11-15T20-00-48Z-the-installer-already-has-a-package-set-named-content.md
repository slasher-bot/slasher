# The installer already has a package set named "content" (foundation, language, git, versioning, journal). A package also named "content" could not be installed by name, because `slasher-install content` resolves to the set. How is the clash settled? — Rename the package, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The installer already has a package set named "content" (foundation, language, git, versioning, journal). A package also named "content" could not be installed by name, because `slasher-install content` resolves to the set. How is the clash settled?

The options:

- **Set includes the package** — The package keeps the name content, and the content set gains it as a member. `slasher-install content` installs the set, and with it the package. The default set does not include it.
- **Rename the package** — The package takes another name, such as editing or prose, and the content set may include it. Item 3's name for it changes.
- **Rename the set** — The package is content, and the set is renamed, such as to content-project. Existing projects that declared the content set would need a new declaration.

The engineer's answer: **Rename the package**
