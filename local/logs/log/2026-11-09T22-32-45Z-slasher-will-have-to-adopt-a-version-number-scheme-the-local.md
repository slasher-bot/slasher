# "Slasher will have to adopt a version number scheme." The local rule on publishing from master says Slasher carries no version numbers. The installed versioning package already sets a scheme: semver, optionally led by a product generation number, with each next version put to you. How should this be recorded? — Work item, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> "Slasher will have to adopt a version number scheme." The local rule on publishing from master says Slasher carries no version numbers. The installed versioning package already sets a scheme: semver, optionally led by a product generation number, with each next version put to you. How should this be recorded?

The options:

- **Amend the local rule** — Change the publish-from-master rule so Slasher versions its plugin and packages under the versioning package's scheme, with a History line.
- **Observation** — Record it as an observation in local/items/, since the scheme and what it versions are not yet settled.
- **Work item** — Record it as a work item to adopt a version number scheme, alongside the marketplace feature.
- **Neither** — Do not record it now.

The engineer's answer: **Work item**
