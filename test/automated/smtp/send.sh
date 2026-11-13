#!/bin/sh
# Usage:
#
#   test/automated/smtp/send.sh
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

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
keychain="$directory/some.keychain"
security create-keychain -p some-keychain-password "$keychain"
trap 'security delete-keychain "$keychain"; rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project/slasher/system/imap" "$project/slasher/system/smtp"
cp system/imap/credential.sh "$project/slasher/system/imap/"
cp system/smtp/send.py "$project/slasher/system/smtp/"
cp test/automated/smtp/controls/message.eml "$project/some-message.eml"

received="$directory/received"
mkdir "$received"

port=$(python3 -c 'import socket; s = socket.socket(); s.bind(("127.0.0.1", 0)); print(s.getsockname()[1]); s.close()')

control_credential="some credential"
printf '%s' "$control_credential" | IMAP_KEYCHAIN="$keychain" system/imap/credential.sh write 127.0.0.1 some-user@example.com --name work-mail

test/automated/smtp/controls/server.py "$port" some-user@example.com "$control_credential" "$received" &
server=$!
trap 'status=$?; kill "$server"; wait "$server" 2>/dev/null || true; security delete-keychain "$keychain"; rm -rf "$directory"; exit $status' EXIT

until python3 -c "import socket; socket.create_connection(('127.0.0.1', $port)).close()" 2>/dev/null; do :; done

export IMAP_KEYCHAIN="$keychain" SMTP_PORT="$port" SMTP_TLS=no

control_recipients="someone@example.com
someone-else@example.com
some-hidden-recipient@example.com"

# Actuation ------------------------------------------------------------------

(cd "$project" && slasher/system/smtp/send.py work-mail some-message.eml) >/dev/null

# Observation ----------------------------------------------------------------

sender=$(cat "$received/sender")
recipients=$(cat "$received/recipients")
from=$(sed -n 's/^From: //p' "$received/message.eml" | tr -d '\r')
bcc=$(grep -c '^Bcc:' "$received/message.eml" || true)
body=$(tr -d '\r' < "$received/message.eml" | sed '1,/^$/d')

[ "$sender" = "some-user@example.com" ] || fail "Sends from the account's login" "sender:" "$sender"
[ "$recipients" = "$control_recipients" ] || fail "Sends to every To, Cc, and Bcc recipient" "recipients:" "$recipients"
[ "$from" = "some-user@example.com" ] || fail "Adds a From header with the login" "from:" "$from"
[ "$bcc" = 0 ] || fail "Leaves the Bcc header out of the message" "Bcc headers:" "$bcc"
[ "$body" = "some body" ] || fail "Sends the body without the separator line" "body:" "$body"

echo "0 failed, 0 aborted"
