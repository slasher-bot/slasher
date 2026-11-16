# Loop record — `/private` and `/private end`

A bare `/private` starts a private session, and `/private end` ends it. Feature record: `2026-11-16T22-55-23Z-private-session-commands`.

**Mode:** unattended

## 1. Actuation

- **Hinge:** how the private session script is invoked for a bare `/private` and for `/private end`.
- **Decision:** the existing invocation, a UserPromptSubmit event on standard input, with the prompt `/private` or `/private end`. The script's interface does not change, only the prompts it recognizes.

## 2. Observation

- **Hinge:** what the tests read.
- **Decision:** the session's state file, written by `/private` and removed by `/private end`, and that the script prints nothing, as the `start.sh` and `end.sh` tests read it.

## 3. Controls

- **Hinge:** what the tests build.
- **Decision:** the controls of `start.sh` and `end.sh`, with the prompt changed to `/private` and `/private end`. The bare-start test failed before the change, since a bare `/private` wrote no state file.

## 4. Implementation

- **Hinge:** how the change comes about.
- **Decision:** directly. The prompt's trailing spaces are dropped, and the bare forms are matched exactly, so `/private item …` and `/private end-of-day …` start nothing.
- **Outcome:** the automated suite passed: 80 test files.

## 5. Naming

- **Hinge:** the tests' names.
- **Decision:** `bare-start.sh` and `bare-end.sh`, beside `start.sh` and `end.sh`, with their outcomes named as those tests name them: *Starts the private session*, *Ends the private session*.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 2:57:25 PM PT
