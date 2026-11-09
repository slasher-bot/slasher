# Feature — A correction is also tagged [work] and [rework]

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/unattended #3", where #3 is the item `2026-11-08T22-19-25Z-a-correction-is-also-tagged-work-and-rework`, titled *A correction is also tagged [work] and [rework]*.

**A correction carries `[correction]`, `[work]`, and `[rework]` together, and concludes as a work item does.** The items rule, the `/correction` skill, and the ITEMS help change to match. No item is tagged `[correction]` today, so no record is conformed.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `master`, the current branch
- **Base:** `24fdb4ea`, from `master`
- **Working location:** the current branch, chosen by the agent under `/unattended`. The change is prose in one rule, one skill, and one help file.
- **Participation:** unattended, by `/unattended`.
- **Verdict:** it concludes without an engineer's verdict, chosen by the agent under `/unattended`.

## Confirmations

- **2026-11-08** — The engineer accepted the agent's plan under `/unattended`.
- **2026-11-08** — The working location is the current branch, `master`, selected by the agent under `/unattended`. The work is prose, so isolation buys little.
- **2026-11-08** — Participation: Unattended, by `/unattended`.
- **2026-11-08** — The feature concludes without an engineer's verdict, selected by the agent under `/unattended`. It builds a direction the engineer stated, and has no question to forecast.

## Outcome

The items rule says a correction carries `[correction]`, `[work]`, and `[rework]`, and concludes `Done`. The `/correction` skill and the ITEMS help name the three tags. The automated suite is verified: 25 tests. The item is Realized.

---

Authored by Scott Bellware on Sun Nov 8 2026 at 8:22:50 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:23:10 PM PT
