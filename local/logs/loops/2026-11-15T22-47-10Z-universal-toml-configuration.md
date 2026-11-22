# Loop record — Universal toml configuration file for both imap and smtp

One file, `slasher-email.toml`, configures both the fetch and the send of an email account. Its `[imap]` table takes the place of `fetch.toml`, and its `[smtp]` table can name the SMTP host. The plan the engineer accepted named the file and dropped any reading of `fetch.toml`.

**Mode:** unattended.

## 1. The actuation of the configured host

- **Hinge:** how a test reaches the configured SMTP host.
- **Decision:** `slasher/system/smtp/send.py work-mail some-message.eml`, run from a project whose `slasher/local/email/work-mail/slasher-email.toml` has `[smtp] host = "some-configured-host.invalid"`. The actuation is the same as the send's own. Only the file differs, so the test shows that the file alone moves the host.

## 2. The observation

- **Hinge:** which effect of the send the test reads.
- **Decision:** the message the send prints when it cannot reach the host, which names the host. A `.invalid` host never resolves, so the test needs no server, as the derived-host test already does.

## 3. The test files for the host

- **Hinge:** where the second host case goes.
- **Decision:** `send-host.sh` became `send-host/derived.sh`, beside `send-host/configured.sh`. The host has two cases now, so the feature takes the folder form, and each file names its case.

## 4. The module that reads the file

- **Hinge:** where the reading of `slasher-email.toml` lives, given that two packages read it.
- **Decision:** `email_configuration.py` in the `imap` package. `send.py` already reaches into `imap` for `credential.sh`, so a second reach adds no dependency. It is named for what it reads, not `email.py`, which would hide Python's own `email` module.

## 5. A file with no folders

- **Hinge:** what the fetch does where `slasher-email.toml` has no `[imap]` folders, as a file that only names an SMTP host does.
- **Decision:** it fetches the inbox and the sent mail, as with no file. A file written for the send must not stop the fetch. `fetch-without-imap-configuration.sh` shows it.

## 6. Bytecode

- **Hinge:** the `__pycache__` folder Python writes beside an imported module, which would appear in a consuming project's `slasher/system/imap/`.
- **Decision:** `fetch.py` and `send.py` set `sys.dont_write_bytecode` before the import, so no cache is written into an installed package.

**Outcome:** `slasher-email.toml` configures the fetch and the send. The automated suite passed: 74 test files.

---

Authored by Scott Bellware on Sun Nov 15 2026 at 14:47:10 PT
