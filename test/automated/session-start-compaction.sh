#!/bin/sh
# Usage:
#
#   test/automated/session-start-compaction.sh
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

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
trap 'rm -rf "$project"' EXIT

mkdir -p "$project/system/foundation/source"
cp system/foundation/session-start.sh system/foundation/startup-display.sh "$project/system/foundation/"
cp system/foundation/source/the-startup-display-prints-as-the-session-starts.md "$project/system/foundation/source/"
echo some-readme > "$project/system/foundation/README.md"

control_event='{"session_id": "some-session", "hook_event_name": "SessionStart", "source": "compact"}'
control_display=$(cd "$project" && system/foundation/startup-display.sh message | sed 's/^/"/; s/$/"/' | python3 -c 'import json,sys; print(json.load(sys.stdin))')

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && echo "$control_event" | sh system/foundation/session-start.sh)
message=$(printf '%s' "$output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])')

# Omits the startup display after a compaction

case "$message" in
  *"$control_display"*) fail "Omits the startup display after a compaction" "message:" "$message" ;;
esac

echo "1 passed"
