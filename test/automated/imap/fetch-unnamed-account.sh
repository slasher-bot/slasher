#!/bin/sh
# Usage:
#
#   test/automated/imap/fetch-unnamed-account.sh
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
#     Unnamed account

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project/slasher/system/imap" "$project/slasher/local"
cp system/imap/credential.sh system/imap/fetch.py "$project/slasher/system/imap/"

port=$(python3 -c 'import socket; s = socket.socket(); s.bind(("127.0.0.1", 0)); print(s.getsockname()[1]); s.close()')

control_credential="some credential"
printf '%s' "$control_credential" | IMAP_KEYCHAIN="$keychain" system/imap/credential.sh write 127.0.0.1 some-user

test/automated/imap/controls/server.py "$port" some-user "$control_credential" test/automated/imap/controls/message.eml &
server=$!
trap 'status=$?; kill "$server"; wait "$server" 2>/dev/null || true; security delete-keychain "$keychain"; rm -rf "$directory"; exit $status' EXIT

until python3 -c "import socket; socket.create_connection(('127.0.0.1', $port)).close()" 2>/dev/null; do :; done

export IMAP_KEYCHAIN="$keychain" IMAP_PORT="$port" IMAP_TLS=no

# Actuation ------------------------------------------------------------------

(cd "$project" && slasher/system/imap/fetch.py 127.0.0.1)

# Observation ----------------------------------------------------------------

files=$(ls "$project/slasher/local/email/127.0.0.1/some-user/INBOX" 2>/dev/null || true)

[ "$files" = "2026-01-01T00-00-00Z-1-some-subject.txt" ] || fail "Writes the message under the host and login" "files:" "$files"

echo "0 failed, 0 aborted"
