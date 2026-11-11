#!/bin/sh
# Usage:
#
#   test/automated/imap/fetch.sh
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
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project/slasher/system/imap" "$project/slasher/local"
cp system/imap/credential.sh system/imap/fetch.py "$project/slasher/system/imap/"

port=$(python3 -c 'import socket; s = socket.socket(); s.bind(("127.0.0.1", 0)); print(s.getsockname()[1]); s.close()')

control_credential="some credential"
printf '%s' "$control_credential" | IMAP_KEYCHAIN="$keychain" system/imap/credential.sh write 127.0.0.1 some-user --name work-mail

test/automated/imap/controls/server.py "$port" some-user "$control_credential" test/automated/imap/controls/message.eml &
server=$!
trap 'status=$?; kill "$server"; wait "$server" 2>/dev/null || true; security delete-keychain "$keychain"; rm -rf "$directory"; exit $status' EXIT

until python3 -c "import socket; socket.create_connection(('127.0.0.1', $port)).close()" 2>/dev/null; do :; done

export IMAP_KEYCHAIN="$keychain" IMAP_PORT="$port" IMAP_TLS=no

control_message_text="UID: 1
Date: Thu, 01 Jan 2026 00:00:00 +0000
From: someone@example.com
To: some-user@example.com
Subject: some subject

------------------------------------------------------------------------

some body"

# Actuation ------------------------------------------------------------------

(cd "$project" && slasher/system/imap/fetch.py work-mail)

# Observation ----------------------------------------------------------------

files=$(ls "$project/slasher/local/email/work-mail/INBOX")
message=$(cat "$project/slasher/local/email/work-mail/INBOX/$files")

[ "$files" = "2026-01-01T00-00-00Z-1-some-subject.txt" ] || fail "Writes the message to the inbox folder" "files:" "$files"
[ "$message" = "$control_message_text" ] || fail "Writes the message's headers and body" "message:" "$message"

echo "0 failed, 0 aborted"
