# Work Session — Progressions are created and started directly (Fri Nov 20 2026)

The work session started after the progression rename, with the packages published and every Slasher project on this machine updated and migrated. It took up the idea that a progression can be created without being a feature or an experiment, settled its commands through two revisions of the plan, and ended with the feature Completed on `master`.

This is the communicable record of the work session, a guided tour. The durable records it points to are the source of truth.

## 1. The rename reaches the projects

The engineer asked for the packages to be published, then for the Slasher projects to be updated and migrated. Five packages were published from `master`, each as a fast-forward. In each project, `update-packages.sh` pulled the packages and ran the installer's migrations. In the three projects that held `implementations/`, the migration moved it to `progressions/` and conformed their records. The migration record `2026-11-20T08-18-26Z-implementation-becomes-progression` carries these as its third and fourth increments.

## 2. Content, explained and judged

The engineer asked whether the work item `2026-11-20T06-40-24Z-content-items` was ready to be built. Three gaps were named: when the review happens, the record title and branch name, and the subcommands `/content` takes. Its wait on the rename is over, and its Waits for line still names it.

## 3. A progression with no kind

The engineer asked for an unattended feature for the idea `2026-11-20T04-43-41Z-progressions-are-created-and-started-directly`. The plan was revised twice. The first revision asked for `/implementation` and `/implementations` as aliases. Asked whether *evolution* in that instruction meant the command, the engineer selected `/progression` and `/progressions`, with `/implementation` and `/implementations` as their aliases. The second revision asked that `/implementation` title its record `Implementation — <name>`, tagged `[implementation]`.

A **progression with no kind** is one created directly, titled `Progression — <name>` or `Implementation — <name>`, on a `progression/` or `implementation/` branch. Its lifecycle is a feature's.

## 4. The build

The feature `2026-11-20T18-24-24Z-direct-progressions` added the four skills, their help, and their rows of the command table, and named the new records in four rules. No code changed. The compressed texts of three rules were checked, and five repairs closed what this change and earlier revisions had left. The engineer then asked that `/current` print *No current progression (feature, experiment, article)* where nothing is current, and it does.

## Takeaways

- A word in an instruction that the settled vocabulary does not hold is asked about before it is built.
- A progression need not have a kind, and `/current` and `/progressions` list it beside features and experiments.

## Glossary

- **progression with no kind** — a progression created with `/progression` or `/implementation`, titled by the command that created it.
- **/progressions** — the list of current progressions of every kind, with `/implementations` as its alias.

## Where the durable records live

- The idea: `local/items/2026-11-20T04-43-41Z-progressions-are-created-and-started-directly.md`
- The feature: `local/progressions/2026-11-20T18-24-24Z-direct-progressions.md`
- The migration record: `local/migration/2026-11-20T08-18-26Z-implementation-becomes-progression.md`
- The skills: `system/foundation/skills/progression/`, `progressions/`, `implementation/`, and `implementations/`
- The rules: the the-progressions-directory-holds-one-record-per-progression rule, the a-progression-runs-on-a-branch-to-a-declared-end rule, the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule, and the a-command-domain-carries-its-rows-of-the-command-table rule

---

Authored by Scott Bellware on Fri Nov 20 2026 at 10:45:21 AM PT
