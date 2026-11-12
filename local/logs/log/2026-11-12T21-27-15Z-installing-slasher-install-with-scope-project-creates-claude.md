# Installing slasher-install with --scope project creates .claude/settings.json, so the installer skips the status line. How should /install get the status line in? — /install adds the key (Recommended), selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Installing slasher-install with --scope project creates .claude/settings.json, so the installer skips the status line. How should /install get the status line in?

The options:

- **/install adds the key (Recommended)** — After the installer runs, the /install command adds the statusLine key to .claude/settings.json where it has none. The agent edits the file, so it can't be corrupted, and the installer's rule against editing an existing file stays as it is.
- **The installer merges the key** — slasher-install adds statusLine to an existing .claude/settings.json that has no statusLine. This works for curl installs too, but a shell edit of JSON can corrupt the file.
- **Install at user scope** — The instructions say to install slasher-install with --scope user, so no project settings file exists before the installer runs. Nothing in the code changes.
- **Something else — say what to change** — A different approach.

The engineer's answer: **/install adds the key (Recommended)**
