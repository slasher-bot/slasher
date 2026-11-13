#!/bin/sh
# Usage:
#
#   test/automated/private-session/end.sh
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
control_last_prompt=1000
control_now=$((control_last_prompt + 3))
printf '%s\n' "$control_last_prompt" > "$state_directory/$control_session_id"

event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "/slasher:private session end"}'

# Actuation ------------------------------------------------------------------

output=$(printf '%s' "$event" | "$script" "$state_directory" "$control_now")

# Ends the private session ---------------------------------------------------

[ ! -e "$state_directory/$control_session_id" ] || fail "Ends the private session" "found:" "$(ls "$state_directory")"

# Says nothing at the end ----------------------------------------------------

[ -z "$output" ] || fail "Says nothing at the end" "found:" "$output"

echo "0 failed, 0 aborted"
