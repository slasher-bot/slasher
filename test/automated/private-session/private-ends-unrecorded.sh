#!/bin/sh
# Usage:
#
#   test/automated/private-session/private-ends-unrecorded.sh
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

script=$PWD/system/foundation/private-session.sh

# Controls -------------------------------------------------------------------

state_root=$(mktemp -d)
trap 'rm -rf "$state_root"' EXIT
private_directory=$state_root/private-sessions
unrecorded_directory=$state_root/unrecorded-sessions
mkdir -p "$private_directory" "$unrecorded_directory"

control_session_id=some-session
control_now=1000
printf '%s\n' 990 > "$unrecorded_directory/$control_session_id"

event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "/private"}'

# Actuation ------------------------------------------------------------------

printf '%s' "$event" | "$script" "$private_directory" "$control_now" > /dev/null

# Ends the unrecorded session ------------------------------------------------

[ ! -e "$unrecorded_directory/$control_session_id" ] || fail "Ends the unrecorded session" "found:" "$(ls "$unrecorded_directory")"

echo "0 failed, 0 aborted"
