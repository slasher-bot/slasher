#!/bin/sh
# Usage:
#
#   test/automated/private-session/unrecorded-start.sh
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

event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "/unrecorded"}'

# Actuation ------------------------------------------------------------------

output=$(printf '%s' "$event" | "$script" "$private_directory" "$control_now")

# Starts the unrecorded session ----------------------------------------------

last_prompt=$(cat "$unrecorded_directory/$control_session_id" 2>/dev/null || true)

[ "$last_prompt" = "$control_now" ] || fail "Starts the unrecorded session" "found:" "$last_prompt"

# Says nothing at the start --------------------------------------------------

[ -z "$output" ] || fail "Says nothing at the start" "found:" "$output"

echo "0 failed, 0 aborted"
