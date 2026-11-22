# Dated artifacts are prefixed with an ISO 8601 UTC datetime, and system rules are not

**Trigger:** When creating and naming a new file under slasher/local/ or a new rule file in a package

The datetime prefix marks a **dated artifact** — something a project accrues over time, ordered by when it was made. These take it:

- The **working-state** directories: the contemporaneous, historical records under `logs/` — the log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/` — and the work-artifact directories `items/`, `progressions/`, and `migration/`.
- A Slasher project's **own local rules** — the rules that project adds to its `slasher/local/rules/`. A local rule is a dated decision in that project's history.

The prefix is an **ISO 8601 datetime normalized to UTC**, followed by a dash-separated, lower-case name and `.md`.

**Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`. The date and time are joined by `T`, and the trailing `Z` marks UTC. The time's colons are written as dashes for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`. The prefix is the iso-full format in UTC, under the dates-and-times-are-written-in-named-formats rule. The name is dash-separated and lower-case.

**The name carries no state.** An item's or a progression record's name is the prefix and a dash-separated, lower-case name, with nothing after it. See the a-records-file-name-carries-no-state rule.

**System rules do not take the prefix.** A rule in a distributed package (`foundation`, `language`, `testing`, …) is named by a dash-separated, lower-case name alone — `write-subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`. A system rule is a curated, durable convention identified by *what it says*, not by when it was written. A datetime on it is noise and buries the rule's name.

That is the distinction between the two kinds of rule: a **system rule** ships in a package and is timeless, so no prefix. A project's **own local rule** is a dated entry in that project's record, so it takes the prefix, like the project's log and items.

**Package structural files** — `README.md` (its introduction), `vocabulary.md` (its terminology reference), and `install-dependencies.sh` (its dependency installer) — take no prefix either. They are named by what they are.

**A project's own `slasher/local/vocabulary.md` takes no prefix, for the same reason.** It is a structural file rather than a dated entry: it accretes terms over the project's life and is named by what it is. That is what separates it from a local rule, which is a dated decision and takes the prefix. See the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule.

**Why:** the dated artifacts are a chronological record. So one consistent, UTC-normalized, lexically-sortable prefix orders them regardless of directory. It preserves within-day ordering, and avoids timezone drift between machines. System rules are not a chronology. They are the current, durable set of conventions, so each is named for what it says.

**How to apply:** prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime. Prefix every local rule a project adds the same way. Name a system package's rules, and its structural files, by a dash-separated, lower-case name — no prefix. Give a project's own `slasher/local/vocabulary.md` no prefix either.

## Compressed

## What takes the prefix
1. A dated artifact takes the datetime prefix. A dated artifact is something a project accrues over time, ordered by when it was made.
2. The contemporaneous, historical records under `logs/` take it: the log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/`.
3. The work-artifact directories `items/`, `progressions/`, and `migration/` take it.
4. A Slasher project's own local rules, the ones it adds to its `slasher/local/rules/`, take it. A local rule is a dated decision in that project's history.
5. Prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime.
6. Prefix every local rule a project adds the same way.

## Format
1. The prefix is an ISO 8601 datetime normalized to UTC. A dash-separated, lower-case name and `.md` follow it.
2. **Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`. The prefix is the iso-full format in UTC, under the dates-and-times-are-written-in-named-formats rule.
3. Join the date and time with `T`. The trailing `Z` marks UTC.
4. Write the time's colons as dashes, for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`.
5. The name is dash-separated and lower-case.
6. The name carries no state.
7. The a-records-file-name-carries-no-state rule says so.

## What takes no prefix
1. System rules do not take the prefix.
2. Name a rule in a distributed package (`foundation`, `language`, `testing`, …) by a dash-separated, lower-case name alone. An example is `write-subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`.
3. A package's structural files take no prefix. These are `README.md`, `vocabulary.md`, and `install-dependencies.sh`, each named by what it is.
4. A project's own `slasher/local/vocabulary.md` takes no prefix.

## Compression

- 2026-10-24, compressed: compression 0.30, change 0.60, solubility 48 → 79, clarity 0.44 → 0.83, 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 79 → 79, clarity 0.83 → 0.83; checked: 10 directives, 10 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 14 directives, 13 kept, 0 less precise, 1 lost, 1 repair
- 2026-11-16, revised: the name carries no state, so the state suffix is no longer an exception to the lower case, which the engineer settled; checked: 11 directives, 11 kept, 0 less precise, 0 lost
- 2026-11-20, revised: progression replaces implementation in the record sense, a term swap the engineer settled; not re-checked
- 2026-11-22, revised: dates and times take the named formats, a record's title carries no date, and a journal entry carries no datetime line; checked: 16 directives, 16 kept, 0 less precise, 0 lost

## History

Until Sun Nov 22 2026 this rule named no format for the prefix. It is the iso-full format in UTC, which the dates-and-times-are-written-in-named-formats rule names.

Until Fri Nov 20 2026 this rule said implementation where it now says progression, in the sense of a feature or an experiment and its record. The progression-replaces-implementation work item settled the change.

Until Mon Nov 16 2026 a record carrying a `**State:**` line ended its name with that state word in upper case, after a dash, the one exception to the lower case.

Until Sun Nov 15 2026 this rule said "consuming project" for a Slasher project, and named the registry `consuming-projects.toml` and its reader `read-consuming-projects.sh` where it named them.

Until Sun Oct 25 2026 this rule was named file-names-use-iso8601-utc-prefix and titled "Dated artifacts in `waytide/` take an ISO 8601 UTC datetime prefix. System rules do not".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Until Mon Oct 26 2026 this rule was named dated-artifacts-take-an-iso-8601-utc-datetime-prefix-and-system-rules-do-not and titled "Dated artifacts take an ISO 8601 UTC datetime prefix, and system rules do not".

---

Authored by Scott Bellware on Wed Jul 1 2026 at 1 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 14:07:00 PT
Changed by Scott Bellware on Mon Jul 27 2026 at 14:30:44 PT
Changed by Scott Bellware on Sat Aug 1 2026 at 16:34:12 PT
Changed by Scott Bellware on Thu Aug 6 2026 at 00:21:42 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 13:24:07 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 18:14:48 PT
Changed by Scott Bellware on Mon Aug 10 2026 at 23:41:53 PT
Changed by Scott Bellware on Tue Aug 11 2026 at 02:41:09 PT
Changed by Scott Bellware on Sun Aug 16 2026 at 02:54:58 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 09:24:07 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 16:22:08 PT
Changed by Scott Bellware on Tue Aug 18 2026 at 16:41:26 PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:23:55 PT
Changed by Scott Bellware on Wed Oct 21 2026 at 09:37:27 PT
Changed by Scott Bellware on Sat Oct 24 2026 at 15:50:22 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:14:54 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:21:48 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:23:36 PT
Changed by Scott Bellware on Sun Oct 25 2026 at 16:24:14 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 14:42:32 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 15:12:23 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 17:52:41 PT
Changed by Scott Bellware on Tue Oct 27 2026 at 14:29:24 PT
Changed by Scott Bellware on Mon Oct 26 2026 at 14:41:43 PT
Changed by Scott Bellware on Thu Nov 5 2026 at 21:09:28 PT
Changed by Scott Bellware on Fri Nov 6 2026 at 20:47:18 PT
Changed by Scott Bellware on Sun Nov 15 2026 at 23:44:42 PT
Changed by Scott Bellware on Mon Nov 16 2026 at 18:36:15 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 00:22:14 PT
Changed by Scott Bellware on Sun Nov 22 2026 at 13:01:15 PT
