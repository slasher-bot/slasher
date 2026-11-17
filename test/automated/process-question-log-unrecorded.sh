#!/bin/sh
# Usage:
#
#   test/automated/process-question-log-unrecorded.sh
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

script=$PWD/system/foundation/process-question-log.sh

# Controls -------------------------------------------------------------------

control_directory=$(mktemp -d)
trap 'rm -rf "$control_directory"' EXIT

unrecorded_log=$control_directory/unrecorded-log
recorded_log=$control_directory/recorded-log
unrecorded_sessions=$control_directory/unrecorded-sessions
mkdir "$unrecorded_log" "$recorded_log" "$unrecorded_sessions"
echo 1000 > "$unrecorded_sessions/some-unrecorded-session"

control_question='{"question": "Some question?", "header": "Some header", "multiSelect": false, "options": [{"label": "Some option", "description": "Some description."}]}'

control_event() {
  cat <<EVENT
{"session_id": "$1", "hook_event_name": "PostToolUse", "tool_name": "AskUserQuestion",
 "tool_input": {"questions": [$control_question], "metadata": {"source": "decision"}},
 "tool_response": {"questions": [$control_question], "answers": {"Some question?": "Some option"}, "annotations": {}}}
EVENT
}

# Actuation ------------------------------------------------------------------

control_event some-unrecorded-session | "$script" "$unrecorded_log" "$unrecorded_sessions"
control_event some-recorded-session | "$script" "$recorded_log" "$unrecorded_sessions"

# Writes no log entry in an unrecorded session -------------------------------

count=$(ls "$unrecorded_log" | wc -l | tr -d ' ')
[ "$count" = 0 ] || fail "Writes no log entry in an unrecorded session" "found:" "$(ls "$unrecorded_log")"

# Writes the log entry in a session that is not unrecorded -------------------

count=$(ls "$recorded_log" | wc -l | tr -d ' ')
[ "$count" = 1 ] || fail "Writes the log entry in a session that is not unrecorded" "found $count entries:" "$(ls "$recorded_log")"

echo "0 failed, 0 aborted"
