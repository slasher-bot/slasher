# Loop record — The /unrecorded command

`/unrecorded` starts a session in which no record is written anywhere, and `/unrecorded end` ends it. It mirrors the session half of `/private`.

**Mode:** unattended. The engineer selected it at the start, and accepted the plan.

## 1. Where the session's state is kept

- **Hinge:** whether the unrecorded session gets its own script, or the private session's script learns it.
- **Decision:** `private-session.sh` learns it, with the unrecorded state in `unrecorded-sessions/`, beside `private-sessions/`. Starting either session must end the other, and one script reading one prompt can do both without the two scripts knowing each other. Its interface and its earlier tests stay as they were.

## 2. How the log hook skips an unrecorded session

- **Hinge:** whether the agent removes the hook's log entries afterwards, as in a private session, or the hook writes none.
- **Decision:** the hook writes none. `process-question-log.sh` takes the unrecorded state directory as a second argument, and writes nothing where the event's session has a state file there. Nothing written means nothing to remove, and nothing to forget to remove.

## 3. Which records go unrecorded

- **Hinge:** the five kinds of record the item left unsettled.
- **Decision:** migration records and brainstorm collection files are not written, since a rule tells the agent to write each, which makes it a record. Package set declarations are written, since they decide which rules load. Fetched email is written, since it is data the project receives. A private record is moot, since starting the unrecorded session ends the private one.

## 4. The item's open decisions

- **Hinge:** the five decisions the item left open.
- **Decision:** each as the item recommended. The command is the session only. It sits in the PRIVATE section of the help. Starting either session ends the other. The agent asks to end the session before starting a feature or an experiment. The private session's log hook is not changed.

## Outcome

- `private-session.sh` and `process-question-log.sh` learn the unrecorded session, with seven new tests. A new on-demand foundation rule, the `/unrecorded` skill, and its lines in the PRIVATE help. The automated suite passes: 102 tests.

---

Authored by Scott Bellware on Mon Nov 16 2026 at 10:43:48 PM PT
