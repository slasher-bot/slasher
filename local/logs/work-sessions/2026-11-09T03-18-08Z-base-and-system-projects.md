# Work Session — Base and system projects (2026-11-08)

This work session began with a feature that lets a project address its base project, the machine's system project, and any registered project, by `/projects`. It turned aside many times, to aliases, a command for the agent's confidence, a one-line notice after a compaction, a `/decision` command, and the command table. It ended with the feature Completed and merged to `master`, the item back to Open, and registries at more than one level abandoned.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the feature record `2026-11-08T03-15-40Z-base-and-system-projects`, its loop record, the item `2026-10-30T06-57-47Z-commands-can-target-the-machines-root-install-of-waytide`, the rules named below, the log, and the commits on `master`.

## 1. The feature starts

The engineer started the item as a feature, in a branch and worktree, attended, with no verdict, building only the item's settled parts. Before the loop the engineer settled the design: a project's name is its directory name, `slasher.toml` in the shared parent directory names the base project with `base-project`, `~/.config/slasher/system-project.toml` names the system project with `path`, and the system project is a full Slasher project. One script, `resolve-project.sh`, prints a target's root.

## 2. Three outcomes, attended

The **base project**, the **system project**, and a **project by name** were each built through the four hinges of an outcome: actuation, observation, controls, and implementation. Each target is resolved from the project root, and each test compares the printed path exactly. A bare argument is a name, as `/projects <name>` takes it.

## 3. Asides on master

While the feature was open, the engineer changed the system on `master`:

1. A hinge question carries no decision marker, so only the loop record holds a hinge. This is the a-hinge-question-carries-no-decision-marker rule.
2. `/>`, `/>?`, and `/<` are aliases of `/next`, `/next?`, and `/clarify`. `/estimate-confidence`, with `/#`, gives the agent's confidence of proceeding unattended.
3. At the implementation hinge, the two options carry fixed labels, and each states a **rework risk**: how likely it is that the engineer will have to redo what it produces.
4. After a compaction, the session-start hook shows one line, *Context compacted. Slasher is reloading its rules.*, in place of the startup display.
5. The full command table was rebuilt, and both tables end with a help line, now *Type /help for all of Slasher's help, or /<command> help for one command's.*

## 4. Failure cases, then unattended

Outcomes for a missing `slasher.toml` and a missing `system-project.toml` passed before any code was written, and the engineer kept both as coverage. The engineer then said *Proceed unattended*, and accepted the agent's plan. The agent built a name no registered project has, and a name two projects share, as failures. It changed `/projects` to carry out an instruction in the resolved project, under that project's own rules, with any commit there waiting for the engineer. The rule was renamed projects-lists-the-registry-and-carries-out-an-instruction-in-another-project. The tests were named at the close.

## 5. Controls name what exists

The engineer directed that `some …` names something that exists, and `some missing …` something that does not. The testing package's a-controls-string-value-starts-with-some rule took that, and the registry tests now use `some-project` and `some-missing-project`.

## 6. Interactive scenarios

The engineer set up a system project at `~/slasher-system` and ran six scenarios from the worktree: `-base` alone, `-base` with an instruction, `-system`, a project by name, an idea written into the base project, and a missing `slasher.toml`. All passed.

## 7. /decision

The engineer recorded an idea for a `/decision` command and started it on `master`. `/decision <text>` logs the text as the engineer's decision, tagged `[decision]`, and `/decision` alone logs the decision the conversation just reached. The item is Realized. `/decision` and `/observation` took rows in the full command table.

## 8. The close

The engineer abandoned registries at more than one level, as a dated resolution on the item. The feature was marked Completed and merged to `master` with no conflicts, the item returned to Open, and the worktree and the branch were removed.

## Takeaways

- `/projects -base`, `-system`, and `<name>`, with an instruction, act in another project under that project's rules.
- `resolve-project.sh` fails, and prints no path, where a configuration file is missing or a name matches no project or more than one.
- A control for something that does not exist is `some missing …`.
- After a compaction the engineer sees one line, not the startup display.
- `/decision` logs the engineer's decision with its tag.

## Glossary

- **base project** — the project in a directory beside the current one, which `slasher.toml` in their shared parent directory names.
- **system project** — the machine's one general-purpose Slasher project, which `~/.config/slasher/system-project.toml` names.
- **rework risk** — the agent's estimate of how likely it is that the engineer will have to redo what an implementation option produces.

## Where the durable records live

- Rules: projects-lists-the-registry-and-carries-out-an-instruction-in-another-project, a-hinge-question-carries-no-decision-marker, estimate-confidence-gives-the-agents-confidence-of-proceeding-unattended, a-log-entry-recording-an-engineers-decision-is-tagged-decision, a-controls-string-value-starts-with-some, the-command-domain-table-prints-when-the-rules-have-loaded, and the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice.
- Script: `system/foundation/resolve-project.sh`, with its tests in `test/automated/resolve-project/`.
- Records: the feature record `2026-11-08T03-15-40Z-base-and-system-projects-COMPLETED`, the loop record `2026-11-08T06-16-42Z-base-and-system-projects`, and the items for the base and system projects and for `/decision`.

---

Authored by Scott Bellware on Sun Nov 8 2026 at 7:18:08 PM PT
