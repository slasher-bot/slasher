#!/bin/sh
# Usage:
#
#   test/automated/smtp/send-host/configured.sh
#
# Run from the repository root.
set -e

fail() {
  echo "$1"
  shift
  for line in "$@"; do echo "  $line"; done
  echo "1 failed, 0 aborted"
  exit 1
}

# Smtp
#   Send
#     Host
#       Configured

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT
export IMAP_KEYCHAIN="$keychain"

project="$directory/some-project"
mkdir -p "$project/slasher/system/imap" "$project/slasher/system/smtp" "$project/slasher/local/email/work-mail"
cp system/imap/credential.sh system/imap/email_configuration.py "$project/slasher/system/imap/"
cp system/smtp/send.py "$project/slasher/system/smtp/"
cp test/automated/smtp/controls/message.eml "$project/some-message.eml"

printf '%s' "some credential" | system/imap/credential.sh write imap.some-host.invalid some-user@example.com --name work-mail

# The .invalid top-level domain never resolves, so the send names the host it
# tried and stops.
cat > "$project/slasher/local/email/slasher-email.toml" <<'TOML'
[[account]]
name = "work-mail"

[account.smtp]
host = "some-configured-host.invalid"
TOML

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && slasher/system/smtp/send.py work-mail some-message.eml 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

[ "$output" = "The SMTP host some-configured-host.invalid, port 465, could not be reached." ] || fail "Sends through the host the email configuration names" "status:" "$status" "output:" "$output"

echo "0 failed, 0 aborted"
