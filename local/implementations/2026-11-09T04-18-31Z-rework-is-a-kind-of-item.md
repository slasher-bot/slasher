# Feature — Rework is a kind of item

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/unattended #3", where #3 is the item `2026-11-08T22-17-53Z-rework-is-a-kind-of-item`, titled *Rework is a kind of item*.

**The items rule gains a `[rework]` kind.** A rework item is work to redo something already produced that turned out wrong. It carries `[rework]`, `[work]`, and `[correction]`, and concludes as a work item does. The `/rework` alias is the item `2026-11-08T22-22-00Z-a-rework-command`, and is out of scope.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `master`, the current branch
- **Base:** `26f32872`, from `master`
- **Working location:** the current branch, chosen by the agent under `/unattended`. The change is prose in one rule and one help file.
- **Participation:** unattended, by `/unattended`.
- **Verdict:** it concludes without an engineer's verdict, chosen by the agent under `/unattended`.

## Confirmations

- **2026-11-08** — The engineer accepted the agent's plan under `/unattended`.
- **2026-11-08** — The working location is the current branch, `master`, selected by the agent under `/unattended`. The work is prose, a section of one rule and a help line, so isolation buys little.
- **2026-11-08** — Participation: Unattended, by `/unattended`.
- **2026-11-08** — The feature concludes without an engineer's verdict, selected by the agent under `/unattended`. It builds a direction the engineer stated, and has no question to forecast.

## Outcome

The items rule describes the `[rework]` kind, in its list of kinds and its work-item section, and the ITEMS help has `/item rework`. The automated suite is verified: 25 tests. The item is Realized.

---

Authored by Scott Bellware on Sun Nov 8 2026 at 8:18:31 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:19:15 PM PT
