#!/bin/sh
# Usage:
#
#   test/automated/imap/fetch-to-relocated-local-directory.sh
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

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
directory=$(cd "$directory" && pwd -P)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT

project="$directory/some-project"
records="$directory/some records"
mkdir -p "$project/slasher/system/imap" "$project/slasher/system/foundation" "$project/slasher/local" "$records"
cp system/imap/credential.sh system/imap/email_configuration.py system/imap/fetch.py "$project/slasher/system/imap/"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/slasher/system/foundation/"

registry="$directory/projects.toml"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$records"
TOML

port=$(python3 -c 'import socket; s = socket.socket(); s.bind(("127.0.0.1", 0)); print(s.getsockname()[1]); s.close()')

control_credential="some credential"
printf '%s' "$control_credential" | IMAP_KEYCHAIN="$keychain" system/imap/credential.sh write 127.0.0.1 some-user --name work-mail

test/automated/imap/controls/server.py "$port" some-user "$control_credential" test/automated/imap/controls/message.eml &
server=$!
trap 'status=$?; kill "$server"; wait "$server" 2>/dev/null || true; security delete-keychain "$keychain"; rm -rf "$directory"; exit $status' EXIT

until python3 -c "import socket; socket.create_connection(('127.0.0.1', $port)).close()" 2>/dev/null; do :; done

export IMAP_KEYCHAIN="$keychain" IMAP_PORT="$port" IMAP_TLS=no SLASHER_REGISTRY="$registry"

mkdir -p "$records/email/work-mail"
cat > "$records/email/work-mail/slasher-email.toml" <<'TOML'
[imap]
store = "project"

[[imap.folder]]
source = "inbox"
local = "INBOX"
TOML

# Actuation ------------------------------------------------------------------

(cd "$project" && slasher/system/imap/fetch.py work-mail)

# Observation ----------------------------------------------------------------

files=$(ls "$records/email/work-mail/INBOX" 2>/dev/null || true)

[ "$files" = "2026-01-01T00-00-00Z-1-some-subject.txt" ] || fail "Writes the message to the relocated local directory" "files:" "$files"

echo "0 failed, 0 aborted"
