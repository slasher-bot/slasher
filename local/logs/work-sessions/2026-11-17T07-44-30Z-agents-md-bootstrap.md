# Work Session — The bootstrap in slasher/SLASHER.md (2026-11-16)

This work session started with an explanation of the problem James Hughes reported: after an update, Slasher kept telling him his `AGENTS.md` was out of date. It became a choice between two solutions, a name for Slasher's own file, and a feature that moved the bootstrap out of `AGENTS.md`. It ended with the feature merged and the problem Resolved.

This is the communicable record of the work session, a guided tour. The item, the feature record, the loop record, the migration record, the rules, and the log entries it points to are the source of truth.

## 1. The cause

The update compared the project's `AGENTS.md` from `## Slasher` to the end of the file with the installed **bootstrap**, the text that tells the agent to read Slasher's rules. A project's own text below that heading was compared too, so the two never matched. The bootstrap has one heading and no end, so its end cannot be found once other text follows it.

## 2. Two solutions

The agent proposed markers around the section, so the update compares and rewrites only the fenced text. It also weighed moving the bootstrap into a file Slasher owns, with one line in `AGENTS.md` that imports it. The engineer asked what that line costs. Claude Code expands an `@` import, but Codex reads it as plain text, so it reads the bootstrap only if it opens the file. A search found that the AGENTS.md format defines no imports, that Gemini CLI expands them where it reads `AGENTS.md`, and that Cursor's behavior is unknown. Each explanation was recorded in the item.

## 3. The name

The engineer asked whether the file should be `slasher/AGENTS.md` or `slasher/SLASHER.md`. Codex and Cursor treat an `AGENTS.md` in a subdirectory as instructions for that directory alone, which is wrong for instructions that cover the whole project. The engineer accepted `slasher/SLASHER.md`, and then chose moving the bootstrap over the markers.

- Item: `2026-11-16T05-27-01Z-package-refresh-contests-control-of-a-projects-agents-md`, Resolved

## 4. The feature, unattended

The engineer chose a branch and worktree, unattended work, and no forecast, and accepted a ten-step plan. `install.sh` writes `slasher/SLASHER.md` and places the line. An old section that is exactly the current bootstrap becomes the line. One that differs is left alone, with how to replace it, since the project's own text may follow it. The update rewrites `slasher/SLASHER.md` and compares nothing in `AGENTS.md`. Fresh agents checked the update rule's changed compressed text, found one older gap, and the repair was re-checked.

- Feature record: `2026-11-17T07-15-50Z-agents-md-bootstrap`, Completed
- Loop record: `2026-11-17T07-25-22Z-agents-md-bootstrap`
- Migration record: `2026-11-17T07-23-48Z-the-bootstrap-moves-to-slasher-slasher-md`

## 5. The conclusion

The engineer concluded the feature Completed. It merged to `master` cleanly, the automated suite passed there with 109 tests, and the branch and worktree were deleted. The problem item is Resolved.

## Takeaways

- The bootstrap lives in `slasher/SLASHER.md`, which only Slasher writes.
- A project's `AGENTS.md` holds its own text and one line, `@slasher/SLASHER.md`, and nothing in it is compared or rewritten after install.
- An old section that differs from the bootstrap is replaced by hand once, since Slasher cannot tell its text from the project's.
- Codex reads the import line as plain text.

## Glossary

- **bootstrap**: the text that tells an agent, at the start of every session, to read Slasher's rules and follow them.
- **import line**: `@slasher/SLASHER.md`, the line in a project's `AGENTS.md` that Claude Code replaces with that file's contents.

## Where the durable records live

- Scripts: `system/foundation/install.sh` and `system/foundation/refresh-packages.sh`, with tests in `test/automated/install-agents-md/` and `test/automated/refresh-packages/`
- Rules: package-refresh-and-install-run-foundations-scripts, a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides, and the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice
- The item, feature record, loop record, and migration record named above
- Commits: `f8c0ebf3` through `0a133463` on `master`

---

Authored by Scott Bellware on Mon Nov 16 2026 at 11:44:30 PM PT
