#!/bin/sh
# One real message is sent through an account whose credential is stored in
# the login keychain.
#
# Usage:
#
#   test/interactive/smtp/send.sh <name> <address>
#
# Run from the repository root. The engineer runs it, since it sends a real
# message over the network, through the account stored under <name>, to
# <address>. Name an address the engineer reads, and look for the message
# there afterward: its subject names the time it was sent.
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

[ $# -eq 2 ] || { echo "Usage: test/interactive/smtp/send.sh <name> <address>"; exit 1; }

# Controls -------------------------------------------------------------------

name=$1
address=$2

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

control_subject="Slasher smtp test, sent $(date -u +%Y-%m-%dT%H-%M-%SZ)"

cat > "$directory/message.eml" <<MESSAGE
To: $address
Subject: $control_subject

This message was sent by the smtp package's interactive test.
MESSAGE

# Actuation ------------------------------------------------------------------

output=$(system/smtp/send.py "$name" "$directory/message.eml" 2>&1) && status=0 || status=$?

# Observation ----------------------------------------------------------------

[ "$status" -eq 0 ] || fail "Sends the message" "output:" "$output"
case "$output" in
  "Sent to $address, through "*) ;;
  *) fail "Names the recipient and the host" "output:" "$output" ;;
esac

echo "$output"
echo "Look for the subject \"$control_subject\" at $address."
echo "0 failed, 0 aborted"
