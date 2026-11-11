#!/bin/sh
# Usage:
#
#   test/automated/imap/list.sh
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

# Imap
#   List

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT
export IMAP_KEYCHAIN="$keychain"

printf '%s' "some credential" | system/imap/credential.sh write 127.0.0.1 some-user --name some-mail
printf '%s' "some other credential" | system/imap/credential.sh write localhost some-other-user --name some-other-mail
security add-generic-password -s some-application -a some-account -w "some password" "$keychain"

tab=$(printf '\t')
control_accounts="some-mail${tab}127.0.0.1${tab}some-user
some-other-mail${tab}localhost${tab}some-other-user"

# Actuation ------------------------------------------------------------------

accounts=$(system/imap/list.py)

# Observation ----------------------------------------------------------------

[ "$accounts" = "$control_accounts" ] || fail "Lists each IMAP account by name, host, and login" "accounts:" "$accounts"

echo "0 failed, 0 aborted"
