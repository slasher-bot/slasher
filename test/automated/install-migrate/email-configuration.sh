#!/bin/sh
# Usage:
#
#   test/automated/install-migrate/email-configuration.sh
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

# Install
#   Migrate
#     Email configuration

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT

mkdir -p "$project/slasher/system" "$project/slasher/local/email/some-mail/INBOX" "$project/slasher/local/email/some-other-mail"
cp -R system/foundation "$project/slasher/system/"
git -C "$project" init -q

cat > "$project/slasher/local/email/some-mail/slasher-email.toml" <<'TOML'
[imap]
store = "project"

[[imap.folder]]
source = "Some Label"
local = "some-label"
TOML

cat > "$project/slasher/local/email/some-other-mail/slasher-email.toml" <<'TOML'
[smtp]
host = "some-host.invalid"
TOML

control_configuration='[[account]]
name = "some-mail"

[account.imap]
store = "project"

[[account.imap.folder]]
source = "Some Label"
local = "some-label"

[[account]]
name = "some-other-mail"

[account.smtp]
host = "some-host.invalid"'

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" slasher/system/foundation/install.sh migrate < /dev/null) > /dev/null

# Observation ----------------------------------------------------------------

configuration=$(cat "$project/slasher/local/email/slasher-email.toml" 2>/dev/null || true)

[ "$configuration" = "$control_configuration" ] || fail "Folds each account's configuration into one file, an account table each" "configuration:" "$configuration"
[ ! -e "$project/slasher/local/email/some-mail/slasher-email.toml" ] || fail "Removes the account's own file"
[ ! -e "$project/slasher/local/email/some-other-mail/slasher-email.toml" ] || fail "Removes the other account's own file"
[ -d "$project/slasher/local/email/some-mail/INBOX" ] || fail "Leaves the account's fetched mail"

echo "0 failed, 0 aborted"
