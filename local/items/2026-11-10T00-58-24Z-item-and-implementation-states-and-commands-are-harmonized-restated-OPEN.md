# Item and implementation states and commands are harmonized, restated

- **State:** Open
- **Tags:** [plan]

Items and implementations (features and experiments) take one set of states and one set of commands. Each command acts on an item, a feature, or an experiment, and maps its name to the state that kind of record takes. This plan restates the settled design of `2026-11-10T00-13-50Z-item-and-implementation-states-and-commands-are-harmonized`, which it supersedes and which keeps the record of how each decision was reached.

## How each kind of record starts and ends

| Kind | Starts | Concludes when the work succeeds |
|---|---|---|
| Idea, improvement, plan | Open | Realized |
| Goal, aspiration | Recorded | Realized, only when the engineer says so |
| Work item, rework | Open | Done |
| Correction, mistake | Open | Corrected |
| Problem | Open | Resolved |
| Design | Recorded | does not change state |
| Observation | Recorded | does not change state |
| Feature, experiment | Open | Completed, Affirmed, Refuted, or Inconclusive, whether or not it has a forecast |

Items also take Completed, though no kind of item concludes with it yet.

## States every record that changes state takes

Active, Suspended, Discontinued, Deferred, Obsolete, Superseded, and Abandoned. Deferred is kept to do later, and Discontinued has no plan to do it. A feature or an experiment can be superseded at any time, without first being suspended.

## Commands

The item, feature, and experiment commands offer the same subcommands, paired by meaning. Each state-change root command acts on an item, a feature, or an experiment, and asks which where the words do not say. A subcommand whose name maps to no state the record takes is refused.

- **new** writes the record. A feature or an experiment is written Open.
- **start** makes a record Active from Open.
- **complete** concludes a record with the state its kind takes, as the table above gives.
- **realize** makes an item Realized, and **done** makes a work item Done. Both stay beside complete.
- **affirm**, **refute**, and **inconclusive** conclude a feature or an experiment.
- **defer**, **suspend**, **discontinue**, **obsolete**, **supersede**, and **abandon** each give their state.
- **resume** brings an item back from Suspended, Discontinued, Deferred, Realized, or Done, and a feature or an experiment back to Active from Suspended, Discontinued, Deferred, or Completed. It does not bring back a Corrected or a Resolved record. The reopen command is removed.

## Migration

Existing items and implementation records are converted to these states, under a migration record.

## Tasks

- [ ] Every kind of record starts and concludes as the table gives.
- [ ] Every record that changes state takes the shared states, and the items rule states how Deferred and Discontinued differ.
- [ ] A feature or an experiment can be superseded without first being suspended.
- [ ] The item, feature, and experiment commands offer subcommands paired by meaning, and refuse one that maps to no state.
- [ ] Each state-change root command acts on an item, a feature, or an experiment, and asks which where the words do not say.
- [ ] Resume brings records back from the states given, and the reopen command no longer exists.
- [ ] The help of each affected command describes its states as they now are.
- [ ] A migration record plans the conversion of existing items and implementation records.
- [ ] Existing items and implementation records carry the new states.

## Out of Scope / Deferred

- The conclusion of an item with the Completed state, until a kind of item is given it.

---

Authored by Scott Bellware on Mon Nov 9 2026 at 4:58:24 PM PT
