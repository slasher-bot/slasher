# A built-in slasher-home project

**State:** Realized

**Tags:** [idea]

A slasher-home built-in project, addressable by `/project --slasher-home`. It is the directory where the development version of Slasher is held.

This directory is the Slasher home directory. It's location should be declared in the Slasher config directory.

An alternative name is `--slasher-dev`. Which of the two is not yet decided.

## Settled

- **2026-11-19** — The name is `slasher-home`, not `slasher-dev`.
- **2026-11-19** — The target takes one dash, as `-workspace` and `-system` do: `/projects -slasher-home`.
- **2026-11-19** — `/slasher-home` is the short form of `/projects -slasher-home`, as `/system` is of `/projects -system`.
- **2026-11-19** — Any Slasher project can name the target. Where the machine declares no Slasher home directory, it just does not resolve to a project.


Implemented by the feature `2026-11-20T04-55-28Z-slasher-home-project`.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 6:52:38 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 8:50:29 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 8:50:56 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 8:55:28 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 9:17:03 PM PT
