# Work Session — Forecasts asked for no longer, and items started directly (Fri Nov 20 2026)

The work session started after the `/content` command was merged. It removed the forecast question from the start of a progression and of a phase, published three packages and refreshed every Slasher project, recorded four work items, and ended with an item started directly taking an implementation.

This is the communicable record of the work session, a guided tour. The durable records it points to are the source of truth.

## 1. No forecast question

The engineer asked for an unattended feature for the idea `2026-11-20T19-31-16Z-remove-the-forecast-question-from-progression-start`. The first plan kept the question that `/phase new` asks. The engineer revised it to remove that question too. The feature `2026-11-20T20-37-04Z-no-forecast-question` changed the two progression rules, the unattended rule, the phase skill, and the help. A forecast is now stated only where the engineer gives one without being asked. The verdict question at the end stays, for work with a forecast.

## 2. Publish and refresh

The engineer asked for the packages to be published and the Slasher projects refreshed. `foundation`, `git`, and `prose` were published as fast-forwards. All seven registered projects were refreshed, and the reassembled plugin was committed in six of them on the engineer's selection. Nothing in the projects was pushed.

## 3. Four work items

The engineer recorded four work items: summarize messages after `imap` receives them, summarize a message after `smtp` sends it, threaded replies, and calling an item started directly an implementation. Asked to do the threaded replies item unattended, the engineer accepted a plan and then interrupted it before it started. The second wording of the implementation item was added to the first, at the engineer's selection, rather than recorded as a new item.

## 4. An item started directly

The engineer asked for the implementation item to be done unattended. The feature `2026-11-21T02-13-39Z-item-starts-an-implementation` changed the items rule, the progressions rule, and the unattended rule.

An item is **started directly** where the engineer asks to start or do it without naming a kind. It takes an **implementation**, titled `Implementation — <name>`, tagged `[implementation]`, on an `implementation/<subject>` branch. The feature itself ran as a feature, since the change was not in force when it started. Asked to conclude it, the engineer selected Completed.

## Takeaways

- A progression is asked only its working location and, where it applies, the participation. A forecast comes from the engineer unasked.
- An item started without a kind named takes an implementation. A kind named creates that kind.
- *Conclude it* names no state, so the state is put to the engineer.

## Glossary

- **started directly** — of an item, asked to be started or done without a kind named.
- **implementation** — the progression an item started directly takes.

## Where the durable records live

- The no-forecast-question feature: `local/progressions/2026-11-20T20-37-04Z-no-forecast-question.md`
- The item-starts-an-implementation feature: `local/progressions/2026-11-21T02-13-39Z-item-starts-an-implementation.md`
- The work items: `local/items/2026-11-21T01-31-32Z-summarize-messages-after-imap-receives-them.md`, `local/items/2026-11-21T01-31-58Z-summarize-a-message-after-smtp-sends-it.md`, `local/items/2026-11-21T01-46-33Z-threaded-replies.md`, and `local/items/2026-11-21T01-48-00Z-call-an-item-started-directly-an-implementation.md`

---

Authored by Scott Bellware on Fri Nov 20 2026 at 6:24:01 PM PT
