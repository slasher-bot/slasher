#!/bin/sh
# Usage:
#
#   test/automated/private-session/unrecorded-timeout.sh
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
control_now=$((control_last_prompt + 241))
printf '%s\n' "$control_last_prompt" > "$unrecorded_directory/$control_session_id"

event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "Some prompt"}'

control_timeout_instruction="The unrecorded session has had no prompt for more than 4 minutes. Before anything else, ask the engineer, through the selection interface, whether to continue the unrecorded session or end it. Where the engineer ends it, delete $unrecorded_directory/$control_session_id."

# Actuation ------------------------------------------------------------------

output=$(printf '%s' "$event" | "$script" "$private_directory" "$control_now")

# Asks whether to continue the unrecorded session or end it, after more than 4 minutes with no prompt ---

[ "$output" = "$control_timeout_instruction" ] || fail "Asks whether to continue the unrecorded session or end it, after more than 4 minutes with no prompt" "found:" "$output"

echo "0 failed, 0 aborted"
