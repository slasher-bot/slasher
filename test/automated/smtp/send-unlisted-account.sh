#!/bin/sh
# Usage:
#
#   test/automated/smtp/send-unlisted-account.sh
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
#     When the account is not listed

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

cat > "$project/slasher/local/email/slasher-email.toml" <<'TOML'
[[account]]
name = "some-other-mail"
TOML

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && slasher/system/smtp/send.py work-mail some-message.eml 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

[ "$status" -ne 0 ] || fail "Fails" "status:" "$status"
case "$output" in
  *"work-mail is not listed"*) ;;
  *) fail "Fails" "output:" "$output" ;;
esac

echo "0 failed, 0 aborted"
