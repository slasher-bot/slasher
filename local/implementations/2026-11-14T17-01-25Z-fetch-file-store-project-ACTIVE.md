# Feature — A fetch file takes store = "project"

**Tags:** [feature]

## Intent

**As the engineer stated it:** "/! 6", with the item chosen as `2026-11-14T16-36-12Z-a-fetch-file-takes-store-project`, which reads "\"store = project\" should be supported, even if it defaults to \"project\" when left out".

**The `imap` package's fetch file takes `store = "project"` as a named value. A fetch file with no `store` line is taken as `store = "project"`. A fetch file with any other value is refused.**

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/fetch-file-store-project`
- **Base:** `9932ddb8`, from `master`, the commit holding this record as first written
- **Working location:** branch only, chosen at the start.
- **Participation:** unattended, chosen at the start.
- **Forecast:** none. The verdict question is not asked.
- **Item:** `2026-11-14T16-36-12Z-a-fetch-file-takes-store-project`

## Confirmations

- **2026-11-14** — Participation: Unattended, selected by the engineer with `/!`. The question was not put. No figures were shown.
- **2026-11-14** — Plan: accepted by the engineer. It refuses a `store` value other than `project` or `private`, which the agent added to the item's intent.
- **2026-11-14** — Working location: branch only, selected by the agent. The change is small and touches one package, so a worktree adds nothing.
- **2026-11-14** — Forecast: no forecast, selected by the agent. The intent states the behavior, and there is nothing to compare against.

---

Authored by Scott Bellware on Sat Nov 14 2026 at 9:01:25 AM PT
Changed by Scott Bellware on Sat Nov 14 2026 at 9:05:57 AM PT
