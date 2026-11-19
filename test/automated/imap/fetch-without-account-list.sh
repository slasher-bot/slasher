#!/bin/sh
# Usage:
#
#   test/automated/imap/fetch-without-account-list.sh
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
#   Fetch
#     When the project lists no account

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project/slasher/system/imap" "$project/slasher/local"
cp system/imap/credential.sh system/imap/email_configuration.py system/imap/fetch.py "$project/slasher/system/imap/"

port=$(python3 -c 'import socket; s = socket.socket(); s.bind(("127.0.0.1", 0)); print(s.getsockname()[1]); s.close()')

printf '%s' "some credential" | IMAP_KEYCHAIN="$keychain" system/imap/credential.sh write 127.0.0.1 some-user --name some-mail
printf '%s' "some other credential" | IMAP_KEYCHAIN="$keychain" system/imap/credential.sh write localhost some-other-user --name some-other-mail

test/automated/imap/controls/server.py "$port" --login some-user "some credential" --login some-other-user "some other credential" test/automated/imap/controls/message.eml &
server=$!
trap 'status=$?; kill "$server"; wait "$server" 2>/dev/null || true; security delete-keychain "$keychain"; rm -rf "$directory"; exit $status' EXIT

until python3 -c "import socket; socket.create_connection(('127.0.0.1', $port)).close()" 2>/dev/null; do :; done

export IMAP_KEYCHAIN="$keychain" IMAP_PORT="$port" IMAP_TLS=no

# Actuation ------------------------------------------------------------------

status=0
error=$(cd "$project" && slasher/system/imap/fetch.py 2>&1 >/dev/null) || status=$?

# Observation ----------------------------------------------------------------

[ "$status" -ne 0 ] || fail "Fails" "status:" "$status"
case "$error" in
  *"lists no email account"*) ;;
  *) fail "Fails" "error:" "$error" ;;
esac
[ ! -e "$project/slasher/local/email" ] || fail "Fails" "fetched:" "$(ls -R "$project/slasher/local/email")"

echo "0 failed, 0 aborted"
