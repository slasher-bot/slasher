# Loop record — The package scripts fetch over HTTPS by default

The implementation `2026-11-26T04-37-18Z-package-fetch-https` changes the address `update-packages.sh`, `install.sh`, and `slasher-install` fetch the packages from, where `SLASHER_ORIGIN` is not set, from `git@github.com:slasher-bot` to `https://github.com/slasher-bot`. This record holds the hinges of the three tests and the change.

**Mode:** unattended, as the engineer selected when starting the work.

## Cycle 1 — the actuation

- **Hinge:** how a test drives each script without reaching the network.
- **Decision:** each test runs the script as a project would, with `SLASHER_ORIGIN` removed from its environment, and a stand-in `git` first on its `PATH`. The stand-in records any argument naming `github.com` and refuses it, and hands every other call to the real `git`. So the script reaches the point of fetching, and nothing leaves the machine.

## Cycle 2 — the observation

- **Hinge:** what shows the default.
- **Decision:** the first GitHub address the script hands to `git` starts with `https://github.com/slasher-bot/`. Before the change each test found `git@github.com:slasher-bot/foundation.git`.

## Cycle 3 — the controls

- **Hinge:** what project each script runs in.
- **Decision:** a git repository holding a copy of `foundation` under `slasher/system/` and an `AGENTS.md` that imports `slasher/SLASHER.md`, with an empty home directory. That is the least a project holds for each script to reach its first fetch.

## Cycle 4 — the implementation

- **Hinge:** where the default lives.
- **Decision:** each script keeps its one line, `origin=${SLASHER_ORIGIN:-…}`, with the HTTPS address as the fallback. The comments above it now say the packages are public, so HTTPS needs no key, and name `SLASHER_ORIGIN=git@github.com:slasher-bot` as the way to SSH.

## Cycle 5 — the naming

- **Hinge:** where the tests sit and what they are called.
- **Decision:** `test/automated/default-origin/`, one file per script, named for it: `update-packages.sh`, `install.sh`, and `slasher-install.sh`. Each test's outcome is *Fetches over HTTPS where SLASHER_ORIGIN is not set*.

**Outcome:** the three tests failed on the SSH address before the change and pass after it.

---

Authored by Scott Bellware on Wed Nov 25 2026 at 20:40:37 PT
