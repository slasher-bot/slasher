#!/bin/sh
# Usage:
#
#   test/automated/private-session/prompt.sh
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

event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "Some prompt"}'

# Actuation ------------------------------------------------------------------

output=$(printf '%s' "$event" | "$script" "$state_directory" "$control_now")

# Records the prompt's time --------------------------------------------------

last_prompt=$(cat "$state_directory/$control_session_id")

[ "$last_prompt" = "$control_now" ] || fail "Records the prompt's time" "found:" "$last_prompt"

# Asks nothing within 4 minutes of the last prompt ---------------------------

[ -z "$output" ] || fail "Asks nothing within 4 minutes of the last prompt" "found:" "$output"

echo "0 failed, 0 aborted"
