#!/bin/sh
# Usage:
#
#   test/automated/private-session/unrecorded-end.sh
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
control_last_prompt=1000
control_now=$((control_last_prompt + 3))
printf '%s\n' "$control_last_prompt" > "$unrecorded_directory/$control_session_id"

event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "/unrecorded end"}'

# Actuation ------------------------------------------------------------------

output=$(printf '%s' "$event" | "$script" "$private_directory" "$control_now")

# Ends the unrecorded session ------------------------------------------------

[ ! -e "$unrecorded_directory/$control_session_id" ] || fail "Ends the unrecorded session" "found:" "$(ls "$unrecorded_directory")"

# Says nothing at the end ----------------------------------------------------

[ -z "$output" ] || fail "Says nothing at the end" "found:" "$output"

echo "0 failed, 0 aborted"
