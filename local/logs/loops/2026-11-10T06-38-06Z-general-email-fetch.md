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

## Between the phases — the login keychain is covered by an interactive test

The engineer asked how to test the credential script against their own macOS keychain, then asked for an interactive test. It covers behavior that already exists, so its implementation hinge is degenerate.

### Cycle 23 — Actuation

- **Hinge:** what the test actuates against the login keychain.
- **Options:** a write then a read by name. A write then a read by host.
- **Decision / chat:** a write, then a read by name.

### Cycle 24 — Controls

- **Hinge:** how the test sets up and cleans up the login keychain item.
- **Options:** `IMAP_KEYCHAIN` unset, the made-up host `imap.test.invalid` under the reserved `.invalid` domain, and the item deleted on exit, pass or fail. Something else.
- **Decision / chat:** the made-up host, removed on exit.

### Cycle 25 — Observation

- **Hinge:** what the test checks after the read.
- **Options:** the printed credential. The printed credential, and the item's host and login shown.
- **Decision / chat:** the engineer asked for the question to be clarified, then selected the printed credential, the recommended option.

### Cycle 26 — Implementation

- **Hinge:** none, beyond confirming the test passes against the code as it is. The test is interactive, so the engineer ran it.
- **Outcome:** `test/interactive/imap/credential/login-keychain.sh`. The engineer's run ended `0 failed, 0 aborted`, and the item was removed.

## Phase: Mailbox fetch — outcome 1, the inbox is fetched into the project

The engineer settled the phase's design before the first hinge: Python on its standard library, RCC's message layout with the ISO-8601-UTC prefix, a repeat fetch skipping the UIDs in the file names, and `slasher/local/email/` or `~/.local/share/slasher/email/<project>/` as the destination.

### Cycle 27 — Actuation

- **Hinge:** how a use site fetches a mailbox into the project.
- **Options:** the credential's name and a folder. The credential's name, with INBOX by default. The host and a folder.
- **Decision / chat:** the engineer stopped the question and stated: "It should be by name, but should fetch INBOX and sent messages by default." Put again as one candidate, `system/imap/fetch.py work-mail`, it was accepted. The sent folder is found by the IMAP marker for sent mail, and written to `Sent/`.

### Cycle 28 — Observation

- **Hinge:** what the test reads after fetching the inbox.
- **Options:** the file's name. The file's contents. Both.
- **Decision / chat:** both: the one file is named `2026-01-01T00-00-00Z-1-some-subject.txt`, and holds the headers and body.

### Cycle 29 — Controls

- **Hinge:** what IMAP server the automated test fetches from.
- **Options:** a local test server, reached through `IMAP_PORT` and `IMAP_TLS=no`, which use sites leave unset. A real mailbox, in an interactive test.
- **Decision / chat:** a local test server: `test/automated/imap/controls/server.py`, holding one control message, `message.eml`, and accepting one login.

### Cycle 30 — Implementation

- **Hinge:** how `system/imap/fetch.py` comes about.
- **Options:** one batch, confidence 75%. Red, green, refactor, confidence 85%.
- **Decision / chat:** one batch.
- **Outcome:** `fetch.py <name>` reads the item's host and login from the Keychain by name and its credential through `credential.sh`, then fetches the inbox and any folder the server marks as sent mail, skipping UIDs already in the folder. The test's cleanup first ended the test with status 143, because `set -e` stopped it at the server's `wait`. The cleanup was corrected. The automated suite passes, 31 of 31.

## Phase: Mailbox fetch — outcome 2, a fetch file lists the folders and labels

The engineer asked the agent to choose the next outcome. The agent chose the fetch file, since the sent folder and the repeat fetch are already in the script, so their tests would be coverage, which is the engineer's decision.

### Cycle 31 — Actuation

- **Hinge:** how the fetch is run with a fetch file.
- **Options:** unchanged, `slasher/system/imap/fetch.py work-mail`, with the fetch file found beside the mailbox's folders. Something else.
- **Decision / chat:** unchanged.

### Cycle 32 — Observation

- **Hinge:** what the test checks after fetching with a fetch file that lists one label.
- **Options:** only the listed folder appeared. The label's message is in it. Both.
- **Decision / chat:** the engineer stopped the question twice and asked for it to be clarified twice. Put a third time in plain terms, both was selected, the recommended option.

### Cycle 33 — Controls

- **Hinge:** how the label and the fetch file are set up.
- **Options:** the test server gains `--folder`, serving `Some Label` beside an empty INBOX, and the test writes a fetch file listing `Some Label` into `some-label`. Something else.
- **Decision / chat:** the label folder and the fetch file.

### Cycle 34 — Implementation

- **Hinge:** how reading the fetch file comes about.
- **Options:** one batch, confidence 85%. Red, green, refactor, confidence 90%.
- **Decision / chat:** one batch.
- **Outcome:** where the mailbox's folder holds a `fetch.toml`, its folders replace the inbox and sent defaults. A source of `inbox` or `sent` is the server's own, and any other is fetched as a folder of that name. Every folder is selected by its quoted name. The automated suite passes, 32 of 32.

## Phase: Mailbox fetch — outcome 3, a private mailbox goes to the private store

### Cycle 35 — Actuation

- **Hinge:** how the fetch is run for a private mailbox.
- **Options:** unchanged, with the fetch file looked for in the project and then in the private store. Something else.
- **Decision / chat:** unchanged.

### Cycle 36 — Observation

- **Hinge:** what the test checks after fetching a private mailbox.
- **Options:** the message is in the private store and the project has no email folder. The message is in the private store.
- **Decision / chat:** in the private store, not the project, the recommended option.

### Cycle 37 — Controls

- **Hinge:** how the test gives the fetch a private store without writing to the engineer's own.
- **Options:** `XDG_DATA_HOME`. `HOME`.
- **Decision / chat:** the engineer stopped the question and asked how other tests did it. The installer's tests run the installer with `HOME` set to a temporary folder, and nothing in the project uses `XDG_DATA_HOME`. Put again, `HOME`, as the other tests do, was selected, the recommended option. Only the fetch is run with it.

### Cycle 38 — Implementation

- **Hinge:** how the private store comes about.
- **Options:** one batch, confidence 85%. Red, green, refactor, confidence 90%.
- **Decision / chat:** one batch.
- **Outcome:** the fetch looks for the fetch file in the project, then under `$HOME/.local/share/slasher/email/<project>/<name>/`, the project being the project folder's name. One that says `store = "private"` has the messages written there. The automated suite passes, 33 of 33.

## Phase: Mailbox fetch — coverage of the sent folder and the repeat fetch

The engineer chose to cover both behaviors already in the script before ending the phase. As coverage, each implementation hinge is degenerate: the test is run against the code as it is.

### Cycle 39 — Sent folder: actuation

- **Hinge:** how the sent-folder test runs the fetch.
- **Options:** unchanged, with no fetch file. Something else.
- **Decision / chat:** unchanged.

### Cycle 40 — Sent folder: controls

- **Hinge:** how the test server presents a sent folder.
- **Options:** a folder marked as sent mail and named `[Gmail]/Sent Mail`, which shows the marker is used rather than the name. A marked folder named `Sent`.
- **Decision / chat:** the engineer stopped the question and asked it again, then asked for it to be clarified. After the clarification, which recommended the Gmail name, the engineer selected `Sent`. The test server gained `--sent`.

### Cycle 41 — Sent folder: observation

- **Hinge:** what the test checks.
- **Options:** the message in `Sent/`. Something else.
- **Decision / chat:** the message in `Sent/`.

### Cycle 42 — Sent folder: implementation

- **Hinge:** degenerate. The test passed against the code as it is.
- **Outcome:** `test/automated/imap/fetch-sent.sh`. The automated suite passes, 34 of 34.

### Cycle 43 — Repeat fetch: actuation

- **Hinge:** how the test recreates the earlier fetch.
- **Options:** a placeholder file in the folder, then one fetch. Two fetches.
- **Decision / chat:** the engineer stopped the question three times and asked for it to be clarified twice. Then the engineer directed that a selection the engineer escapes is not put again on the agent's own, and the selection rule was amended. Asked again on request, the placeholder file was selected, the recommended option.

### Cycle 44 — Repeat fetch: observation

- **Hinge:** what the test checks after the one fetch.
- **Options:** the folder still holds the one file, and the file still holds the placeholder. The file still holds the placeholder.
- **Decision / chat:** one file, unchanged, the recommended option.

### Cycle 45 — Repeat fetch: controls

- **Hinge:** the placeholder file.
- **Options:** `2026-01-01T00-00-00Z-1-some-subject.txt` holding `some placeholder`, written before the fetch. Something else.
- **Decision / chat:** the placeholder file.

### Cycle 46 — Repeat fetch: implementation

- **Hinge:** degenerate. The test passed against the code as it is.
- **Outcome:** `test/automated/imap/fetch-again.sh`. The automated suite passes, 35 of 35.

---

Authored by Scott Bellware on Mon Nov 9 2026 at 10:38:06 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:12:42 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:15:11 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:23:55 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:00:42 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:02:44 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:12:40 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:58:55 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 12:26:55 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 12:56:48 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 6:35:14 PM PT
