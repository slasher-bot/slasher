#!/bin/sh
# Usage:
#
#   test/automated/private-session/start.sh
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

state_directory=$(mktemp -d)
trap 'rm -rf "$state_directory"' EXIT

control_session_id=some-session
control_now=1000

event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "/slasher:private session some instruction"}'

# Actuation ------------------------------------------------------------------

output=$(printf '%s' "$event" | "$script" "$state_directory" "$control_now")

# Starts the private session -------------------------------------------------

last_prompt=$(cat "$state_directory/$control_session_id")

[ "$last_prompt" = "$control_now" ] || fail "Starts the private session" "found:" "$last_prompt"

# Says nothing at the start --------------------------------------------------

[ -z "$output" ] || fail "Says nothing at the start" "found:" "$output"

echo "0 failed, 0 aborted"
