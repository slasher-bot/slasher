# Loop record — A built-in slasher-home project

`resolve-project.sh -slasher-home` prints the Slasher home directory, which holds the development version of Slasher, from the path `~/.config/slasher/slasher-home.toml` declares. Where the machine declares none, it prints nothing and fails. It is the code half of the feature `2026-11-20T04-55-28Z-slasher-home-project`.

**Mode:** unattended.

## Cycle 1 — the normal path

- **Hinge, actuation:** `resolve-project.sh -slasher-home`, run from the project root, with one dash, as `-workspace` and `-system` are. The idea settled the name and the dash.
- **Hinge, observation:** the path printed on standard output, compared with the path the config file declares. The `-system` test reads the same effect the same way.
- **Hinge, controls:** a temporary `slasher-home.toml` declaring `path = "$config/some-slasher-home"`, named to the script by `SLASHER_HOME_PROJECT`, as `SLASHER_SYSTEM_PROJECT` does for `-system`. The path is unique to the run, so the test can tell it from any other.
- **Hinge, implementation:** written directly. The case mirrors `-system`, and adds an explicit check that a path was declared.
- **Hinge, naming:** *Prints the Slasher home directory slasher-home.toml names*, in the form of the `-system` test's name.
- **Outcome:** `test/automated/resolve-project/slasher-home.sh` failed before the case existed, since the name lookup took `-slasher-home` as a project's name. It passes with the case.

## Cycle 2 — the exceptional path

- **Hinge, actuation:** the same, in a separate file, since an exceptional path does not share the normal path's actuation.
- **Hinge, observation:** a non-zero exit status, and nothing on standard output. This is what "does not resolve to a project" means to the projects command, which reports the script's message and acts on nothing.
- **Hinge, controls:** `SLASHER_HOME_PROJECT` names a file that does not exist.
- **Hinge, implementation:** the case prints *No Slasher home directory is declared in <file>* to standard error and exits 1. It does so too where the file exists and declares no path, so a declaration with no path is not taken as an empty one.
- **Hinge, naming:** the condition *When slasher-home.toml is missing* encloses *Fails*.
- **Outcome:** `test/automated/resolve-project/slasher-home-without-slasher-home-toml.sh` was uncontested before the case existed, because the name lookup also failed. With the case, it fails for its own reason.


## Cycle 3 — a path under the home directory

- **Hinge, actuation:** the same as the normal path, in its own file.
- **Hinge, observation:** the printed path, compared with the control home directory joined to the rest of the declared path. The engineer asked for the value `~/projects/slasher/slasher`, and the script printed the `~` unread.
- **Hinge, controls:** a temporary directory sent to the script as `HOME`, and a declaration of `path = "~/some-slasher-home"`. The control home is unique to the run, so the test can tell it from the engineer's own.
- **Hinge, implementation:** written directly. A leading `~`, alone or before a `/`, is replaced by `$HOME`, as `projects.toml` reads it. A `~` anywhere else is left as written.
- **Hinge, naming:** *Prints the Slasher home directory, with a leading ~ read as the home directory*.
- **Outcome:** `test/automated/resolve-project/slasher-home-under-the-home-directory.sh` failed with `~/some-slasher-home` printed, and passes with the expansion.

---

Authored by Scott Bellware on Thu Nov 19 2026 at 8:56:25 PM PT
Changed by Scott Bellware on Thu Nov 19 2026 at 9:05:17 PM PT
