# Item and implementation states and commands are harmonized

- **State:** Superseded
- **Tags:** [plan]

Items and implementations (features and experiments) share five states, Active, Suspended, Discontinued, Superseded, and Abandoned, and differ in how work ends and comes back. This plan brings them into line where the difference is a defect, and leaves alone what comes from the two being different things.

## Settled

- **2026-11-09** — A Suspended item can be brought back, as a Suspended implementation can.
- **2026-11-09** — The conclude commands follow the forecast, not the kind. A feature can be concluded Affirmed, Refuted, or Inconclusive, and an experiment Completed. Each command refuses a state the record's forecast does not allow.
- **2026-11-09** — `/resume` brings back an item, a feature, or an experiment. `/reopen` is removed.
- **2026-11-09** — Deferred and Discontinued both stay for items, and the difference is stated: Deferred is kept to do later, and Discontinued has no plan to do it. Both can be resumed.
- **2026-11-09** — A feature or an experiment can be superseded at any time, without first being suspended, as an item can.
- **2026-11-09** — Revises the resolution that the conclude commands follow the forecast. Whether an implementation has a forecast no longer limits its concluding states: every implementation can be concluded Completed, Affirmed, Refuted, or Inconclusive, and no command refuses one. **As the engineer stated it:** Implementations don't have to have a forecast in order for certain conclusive states to be used. That's too restrictive on the user.
- **2026-11-09** — The subcommands of items and of implementations mirror each other, and each root command acts on an item or an implementation. Where it is unclear which record is meant, the agent asks. **As the engineer stated it:** There should be a list of subcommands for items and implementations that reflect each other. And the root commands should be able to operate on an item or an implementation. If the agent is unsure which, it'll ask.
- **2026-11-09** — Items gain the Completed state. Features and experiments gain the Deferred, Obsolete, and Open states. This revises the Out of Scope entry that Open stays for items only. **As the engineer stated it:** Items gain Completed. Features and experiments gain Deferred, Obsolete, and Open.
- **2026-11-09** — Mirrored subcommands are paired by meaning. A subcommand is named for what it does, and each kind of record maps the name to its own state. Where a record has no state the name maps to, the subcommand is refused.
- **2026-11-09** — The concluding states keep their pairing. The complete subcommand makes an idea Realized, a work item Done, and a feature or an experiment Completed. **As the engineer stated it:** "Realized" was intended to be paired with ideas. That may be too elaborate though.
- **2026-11-09** — A plan concludes Realized. **As the engineer stated it:** Plans are realized.
- **2026-11-09** — A design is Recorded from the moment it is written and never changes state, as an observation is. Whether it was built is shown by the work that built it.
- **2026-11-09** — A goal and an aspiration start Recorded, and conclude Realized. **As the engineer stated it:** Goals and aspirations are recorded, and end realized.
- **2026-11-09** — Items keep the Completed state, though no kind of item yet concludes with it.
- **2026-11-09** — The realize and done subcommands stay, beside complete.
- **2026-11-09** — A problem and a mistake conclude Corrected, a new state. **As the engineer stated it:** Corrected.
- **2026-11-09** — A goal or an aspiration moves from Recorded to Realized only when the engineer says so explicitly. **As the engineer stated it:** The user says so explicitly.
- **2026-11-09** — A feature or an experiment record is written Open, and the start subcommand makes it Active. Start does not replace the new subcommand of a feature or an experiment. **As the engineer stated it:** No. /start makes them active.
- **2026-11-09** — Resume brings a feature or an experiment back to Active from Suspended, Discontinued, Deferred, or Completed. Resuming a Completed implementation continues its work on a branch.
- **2026-11-09** — The complete subcommand makes a mistake or a correction Corrected. A correction concludes Corrected, not Done. **As the engineer stated it:** The "/complete" command applied to a mistake or correction does it.
- **2026-11-09** — A problem concludes Resolved, a new state, and the complete subcommand makes it Resolved. This revises the resolution that a problem concludes Corrected. **As the engineer stated it:** A problem ends resolved.
- **2026-11-09** — Resume does not bring back a Corrected or a Resolved record.
- **2026-11-09** — Existing records are migrated to the new states, under a migration record. **As the engineer stated it:** Existing records shall be migrated.
- **2026-11-09** — A rework item concludes as a work item does, Done, though it also carries the correction tag. **As the engineer stated it:** A rework item ends as a work item does.

## Tasks

- [ ] A Suspended item can be resumed.
- [ ] Every implementation can be concluded Completed, Affirmed, Refuted, or Inconclusive, whether or not it has a forecast.
- [ ] A feature can be concluded Affirmed, Refuted, or Inconclusive, and an experiment Completed.
- [ ] Resume brings back an item, a feature, or an experiment, and the reopen command no longer exists.
- [ ] The items rule states how Deferred and Discontinued differ.
- [ ] A feature or an experiment can be superseded without first being suspended.
- [ ] An item can be Completed.
- [ ] A design is Recorded when it is written, and its state does not change.
- [ ] A goal or an aspiration is Recorded when it is written, and concludes Realized only when the engineer says so.
- [ ] A mistake concludes Corrected, and a problem concludes Resolved.
- [ ] Complete makes a mistake or a correction Corrected, and a correction no longer concludes Done.
- [ ] A rework item concludes Done.
- [ ] A feature or an experiment is written Open, and start makes it Active.
- [ ] A feature or an experiment can be Deferred, Obsolete, or Open.
- [ ] The item, feature, and experiment commands offer subcommands that mirror each other.
- [ ] Each state-change root command acts on an item, a feature, or an experiment, and asks which where the words do not say.
- [ ] The help of each affected command describes its states as they now are.
- [ ] A migration record plans the conversion of existing items and implementation records to the new states.
- [ ] Existing items and implementation records carry the new states.

## Out of Scope / Deferred

- Open stays for items only, since an item can exist before its work starts.
- Realized and Done stay for items, and Completed and the verdicts for implementations, since they say different things.
- Obsolete and Recorded stay for items only.

**Superseded by:** `2026-11-10T00-58-24Z-item-and-implementation-states-and-commands-are-harmonized-restated`, which restates the settled design.

---

Authored by Scott Bellware on Mon Nov 9 2026 at 4:13:50 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 4:58:24 PM PT
