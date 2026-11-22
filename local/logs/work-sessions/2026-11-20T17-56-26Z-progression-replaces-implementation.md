# Work Session — Progression replaces implementation

The work session started with a question about how Slasher writes content on a branch, when an article is neither a feature nor an experiment. It settled a design for content, found that *implementation* no longer named what features, experiments, and content share, and searched for a better word until the engineer chose **progression**. It then amended the migration rule so a migration may conform historical records, and ended with the rename built unattended and Completed on `master`.

This is the communicable record of the work session, a guided tour. The durable records it points to are the source of truth.

## 1. Content gets its own kind

The engineer asked what Slasher needs to write content, such as an article for a publication, on a branch. The answer became the work item `2026-11-20T06-40-24Z-content-items`, and its decisions were settled one at a time: the kind is **content** and the command is `/content`; the steps that serve only code are left out of every content piece, because it is content; content states no forecast; no phases are fixed, and the writer decides them; a prose review is optional, the writer is asked which type when it is time, and the merge ordinarily waits until each suggestion is settled; `/features` and `/experiments` stay, and content is listed by `/contents` and `/content list`; and the commit-message rule's subject widens from the software to the thing that changed. The engineer also judged that content need not be only text, which supports *content* over *writing*, and left the `prose` package separate from `content`.

## 2. A name for what the three kinds share

The engineer doubted that *implementation* still held once content was addressed. An implementation puts a design into effect, which fits a feature, fits an experiment less well, and fits an article poorly. The three kinds share a branch, a record carried to a declared end, and a merge or none. Candidates were weighed against the rule that a name must be understood without a taught mapping: *development* (tied to software, and a news sense), *product* (names the output, and clashes with the `versioning` vocabulary), *increment* (already the word for a delivered slice), *evolution* (a figure). *Progression* was chosen: one unit of forward work, countable, and not a figure. The decision is the work item `2026-11-20T07-31-09Z-progression-replaces-implementation`.

## 3. The rename's scope

The work item settled the rest: the directory becomes `progressions/`; the item state Implementation becomes Progression; `install.sh` makes the change in each Slasher project; it renames the branch line, an item's Implementation line, and the paths; record file names are renamed; historical records are corrected too; only the record sense changes, and the implementation hinge keeps its name; rule names take the word by substitution; a progression's file is a **progression record**; record titles such as `Feature —` stay; journal entries are left as written; the `foundation` vocabulary defines the terms; and the rename comes before content, which waits for it.

## 4. A migration may conform historical records

Correcting historical records ran against the disclosure-is-the-one-reason-to-edit-a-historical-record rule. The engineer chose not to amend it: *migrations are permitted to make changes to historical information in order to conform it to new contracts*. The migration rule was amended to say so, and then to say that it takes precedence over the disclosure rule within a migration. Its compressed text was checked four times, then once more, until every directive was kept.

## 5. The rename, built unattended

The feature `2026-11-20T08-18-26Z-progression-replaces-implementation` ran in a worktree, with the migration record `2026-11-20T08-18-26Z-implementation-becomes-progression` written on `master` first. `install.sh` gained `migrate_progressions`, which acts only on forms whose sense is the record, since a script cannot tell the two senses apart in a sentence. The status line script became `current-progression.sh`. Agents conformed the rules and then this repository's records, judging each occurrence's sense. The mechanical pass also rewrote the records that discuss the rename itself, and those were restored and left out. The loop record is `2026-11-20T08-32-16Z-progression-replaces-implementation`.

## Takeaways

- A name for a kind of work should fit every kind of work it covers, not the first one.
- A rename across records needs a judgment of each occurrence's sense, and a script can make only the changes whose sense is certain.
- Within a migration, conforming historical records is permitted, and the migration rule says so.

## Glossary

- **progression** — a bounded piece of work on its own branch, carried to a declared end: a feature, an experiment, and in time a piece of content.
- **progression record** — the file in `local/progressions/` that carries a progression from its creation to its declared end.
- **content** — the kind of progression whose product is prose, pages, or other media rather than code.
- **the record sense and the code sense** — *implementation* as the record of a feature or an experiment, which became *progression*, and *implementation* as the code that satisfies a test, which keeps its word.

## Where the durable records live

- The work items: `local/items/2026-11-20T06-40-24Z-content-items.md` and `local/items/2026-11-20T07-31-09Z-progression-replaces-implementation.md`
- The idea: `local/items/2026-11-20T04-43-41Z-progressions-are-created-and-started-directly.md`
- The feature: `local/progressions/2026-11-20T08-18-26Z-progression-replaces-implementation.md`
- The migration record: `local/migration/2026-11-20T08-18-26Z-implementation-becomes-progression.md`
- The loop record: `local/logs/loops/2026-11-20T08-32-16Z-progression-replaces-implementation.md`
- The rules: the the-migration-directory-holds-the-plans-for-moving-or-restructuring-content rule, the the-progressions-directory-holds-one-record-per-progression rule, and the a-progression-runs-on-a-branch-to-a-declared-end rule
- The code: `system/foundation/install.sh` and `system/foundation/current-progression.sh`, with the tests under `test/automated/install-progressions/`

---

Authored by Scott Bellware on Fri Nov 20 2026 at 09:56:26 PT
