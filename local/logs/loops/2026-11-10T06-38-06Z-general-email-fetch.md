# Loop record — General email fetch

The feature fetches IMAP email into the project, with each credential read from the macOS Keychain. Its first phase, Keychain credentials, builds the reading and storing of a credential in a new package, `imap`. Its second phase, Mailbox fetch, fetches a mailbox with that credential.

**Mode:** attended.

## Phase: Keychain credentials — outcome 1, a stored credential is read

### Cycle 1 — Actuation

- **Hinge:** how a use site reads a credential from the Keychain.
- **Options:** `credential=$(system/imap/credential.sh read some-account)`, keyed by one name the engineer chooses. `credential=$(system/imap/credential.sh read some-host some-user)`, keyed by the IMAP server and the login.
- **Decision / chat:** the engineer first selected the account name. The next hinge was refused twice, and the engineer asked for the actuation question again, then selected the host and user.

### Cycle 2 — Observation

- **Hinge:** what the test reads about the effect of reading the credential.
- **Options:** the printed credential equals the one stored, or not accepted.
- **Decision / chat:** the printed credential, compared with `[ "$credential" = "$control_credential" ]`.

### Cycle 3 — Controls

- **Hinge:** where the credential is stored for the test.
- **Options:** a temporary keychain the test makes and deletes, named to the script by `IMAP_KEYCHAIN`, which keeps the test automated. The login keychain, which needs no setting but makes the test interactive.
- **Decision / chat:** a temporary keychain.

### Cycle 4 — Implementation

- **Hinge:** how `system/imap/credential.sh` comes about.
- **Options:** one batch, the agent generating the full implementation, rework risk 15%. Controlled and calibrated increments, red, green, refactor, rework risk 10%.
- **Decision / chat:** one batch.
- **Outcome:** `credential.sh read <host> <user>` runs `security find-generic-password -s <host> -a <user> -w`, with the keychain `IMAP_KEYCHAIN` names where it is set. The automated suite passes, 26 of 26. The test is unnamed until the feature closes.

## Phase: Keychain credentials — outcome 2, a credential is stored

The engineer selected storing a credential as the next outcome, over a missing credential failing and over ending the phase.

### Cycle 5 — Actuation

- **Hinge:** how a use site stores a credential in the Keychain.
- **Options:** `printf '%s' "$control_credential" | system/imap/credential.sh write some-host some-user`, the credential on standard input. `system/imap/credential.sh write some-host some-user "$control_credential"`, the credential as an argument, visible in the process list and shell history.
- **Decision / chat:** the credential on standard input.

### Cycle 6 — Observation

- **Hinge:** how the test reads the stored credential back.
- **Options:** with `security find-generic-password` directly, depending on nothing in the package but the write. With `credential.sh read`, stating that a written credential reads back.
- **Decision / chat:** with `credential.sh read`.

### Cycle 7 — Controls

- **Hinge:** where the credential is stored for the test.
- **Options:** a temporary keychain, exported as `IMAP_KEYCHAIN` to both actuations, or not accepted.
- **Decision / chat:** a temporary keychain.

### Cycle 8 — Implementation

- **Hinge:** how the write command comes about. The `security` command takes a credential only as an argument or a typed prompt, so the credential is briefly in the process list while it is stored.
- **Options:** one batch, rework risk 15%. Red, green, refactor, rework risk 10%.
- **Decision / chat:** the engineer first stopped the question to clarify it, then asked to proceed attended, and selected one batch.
- **Outcome:** `credential.sh write <host> <user>` reads the credential from standard input and stores it with `security add-generic-password -U`, replacing one already stored. The automated suite passes, 27 of 27.

## Phase: Keychain credentials — outcome 3, a missing credential fails

The engineer selected a missing credential failing as the next outcome, over ending the phase.

### Cycle 9 — Actuation

- **Hinge:** how the failing read is actuated.
- **Options:** the same read, `credential=$(system/imap/credential.sh read some-host some-user 2>/dev/null) && status=0 || status=$?`, with its exit status kept, or not accepted.
- **Decision / chat:** the same read.

### Cycle 10 — Observation

- **Hinge:** what the test reads about the failed read.
- **Options:** the exit status alone. The exit status and no output, so no partial value reaches the use site.
- **Decision / chat:** the exit status and no output.

### Cycle 11 — Controls

- **Hinge:** what the temporary keychain holds when the read fails.
- **Options:** nothing. A credential for the same host and another user, so the read must match the user as well.
- **Decision / chat:** nothing.

### Cycle 12 — Implementation

- **Hinge:** none. The test passed with no new code, since `security` exits 44 when no item matches and the script stops on it.
- **Decision / chat:** the engineer kept the test as coverage, not as a design step.
- **Outcome:** `test/automated/imap/credential/read-without-stored-credential.sh`, with the condition *When no credential is stored* and the test named *Fails*. The automated suite passes, 28 of 28.

## Phase: Keychain credentials — outcome 4, a credential is read by its name

The engineer asked that a credential also have a name. Asked how the name relates to the host and user, the engineer stopped the question and stated: "A use site can refer to an account by name or host. A credential may not have a name."

### Cycle 13 — Actuation

- **Hinge:** how a use site gives a credential its name and reads it by name or by host.
- **Options:** the name optional on the write, and the read by name or by host and user. The name optional on the write, and the read by name or by host alone, the host then holding one credential.
- **Decision / chat:** by name, or by host alone: `credential.sh write some-host some-user --name some-name`, `credential.sh read --name some-name`, and `credential.sh read some-host`. The read by host alone changes the first outcome's test, and is its own outcome.

### Cycle 14 — Observation

- **Hinge:** what the test reads about reading by name.
- **Options:** the printed credential equals the one written under that name, or not accepted.
- **Decision / chat:** the printed credential.

### Cycle 15 — Controls

- **Hinge:** how the named credential is stored before the read.
- **Options:** with `credential.sh write --name`. With `security add-generic-password -l some-name`, testing the read apart from the write.
- **Decision / chat:** with the `security` command. The write's `--name` option is left to its own outcome.

### Cycle 16 — Implementation

- **Hinge:** how the read by name comes about.
- **Options:** one batch, rework risk 15%. Red, green, refactor, rework risk 10%.
- **Decision / chat:** one batch.
- **Outcome:** `credential.sh read --name <name>` looks the item up by its Keychain label. The automated suite passes, 29 of 29.

## Phase: Keychain credentials — outcome 5, a credential is written with a name

The engineer asked for the next step to be clarified, then selected writing with a name, the recommended outcome, over reading by host alone. The actuation was settled in cycle 13.

### Cycle 17 — Observation

- **Hinge:** how the test reads the named credential back.
- **Options:** with `credential.sh read --name`. With `security find-generic-password -l`, depending on nothing in the package but the write.
- **Decision / chat:** with `credential.sh read --name`.

### Cycle 18 — Controls

- **Hinge:** where the credential is written for the test.
- **Options:** a temporary keychain, as the other credential tests use, or not accepted.
- **Decision / chat:** a temporary keychain.

### Cycle 19 — Implementation

- **Hinge:** how the write's `--name` option comes about.
- **Options:** one batch, confidence 85%. Red, green, refactor, confidence 90%.
- **Decision / chat:** one batch.
- **Outcome:** `credential.sh write <host> <user> --name <name>` gives the item the name as its Keychain label. The automated suite passes, 30 of 30.

## Phase: Keychain credentials — outcome 6, a credential is read by its host alone

The engineer took the next step with `/>>`. The actuation, `credential.sh read some-host`, was settled in cycle 13, in place of the read by host and user. The read test, the write test, and the missing-credential test read by host alone from here.

### Cycle 20 — Observation

- **Hinge:** what the test reads about reading by host alone.
- **Options:** the printed credential equals the one stored for that host, or not accepted.
- **Decision / chat:** the printed credential.

### Cycle 21 — Controls

- **Hinge:** what the read test stores.
- **Options:** the read test's temporary keychain and item for some-host and some-user, as it has them, or not accepted.
- **Decision / chat:** as the read test has them.

### Cycle 22 — Implementation

- **Hinge:** how the read by host alone comes about. Where a host holds more than one credential, `security` returns the first it finds.
- **Options:** one batch, confidence 85%. Red, green, refactor, confidence 90%.
- **Decision / chat:** one batch.
- **Outcome:** `credential.sh read <host>` looks the item up by its host alone, and the read by host and user is gone. The automated suite passes, 30 of 30.

---

Authored by Scott Bellware on Mon Nov 9 2026 at 10:38:06 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:12:42 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:15:11 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:23:55 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:00:42 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:02:44 AM PT
