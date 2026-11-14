#!/bin/sh
# Usage:
#
#   test/automated/session-start-started-with-load.sh
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

mkdir -p "$project/system/foundation/source" "$project/bin"
cp system/foundation/session-start.sh system/foundation/startup-display.sh system/foundation/started-with-load.sh "$project/system/foundation/"
cp system/foundation/source/the-startup-display-prints-as-the-session-starts.md "$project/system/foundation/source/"
echo some-readme > "$project/system/foundation/README.md"

# A stand-in for Claude Code. The session-start script runs under it, as it runs under the
# harness, so the stand-in's command line is the one the script reads.
cat > "$project/bin/claude" <<'CLAUDE'
#!/bin/sh
cd "$(dirname "$0")/.." && sh system/foundation/session-start.sh < /dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])'
CLAUDE
chmod +x "$project/bin/claude"

control_load_line="Slasher's rules will load on the first prompt, or enter: /load"

# Actuation ------------------------------------------------------------------

message=$("$project/bin/claude" --some-option /load)

# Leaves out the load line where Claude Code was started with /load --------------

case "$message" in
  *"$control_load_line"*) fail "Leaves out the load line where Claude Code was started with /load" "message:" "$message" ;;
esac

# Ends with the install line where Claude Code was started with /load -------------

case "$message" in
  *"Slasher installed at system/ — 1 package: foundation") ;;
  *) fail "Ends with the install line where Claude Code was started with /load" "message:" "$message" ;;
esac

# Leaves out the load line where Claude Code was started with /slasher:load --------

slasher_load_message=$("$project/bin/claude" /slasher:load)

case "$slasher_load_message" in
  *"$control_load_line"*) fail "Leaves out the load line where Claude Code was started with /slasher:load" "message:" "$slasher_load_message" ;;
esac

# Leaves out the load line where Claude Code was started with load rules ----------

load_rules_message=$("$project/bin/claude" "load rules")

case "$load_rules_message" in
  *"$control_load_line"*) fail "Leaves out the load line where Claude Code was started with load rules" "message:" "$load_rules_message" ;;
esac

# Prints the load line where Claude Code was started with /load help --------------

help_message=$("$project/bin/claude" "/load help")

case "$help_message" in
  *"$control_load_line") ;;
  *) fail "Prints the load line where Claude Code was started with /load help" "message:" "$help_message" ;;
esac

# Prints the load line where Claude Code was started with some other prompt -------

other_message=$("$project/bin/claude" "some prompt")

case "$other_message" in
  *"$control_load_line") ;;
  *) fail "Prints the load line where Claude Code was started with some other prompt" "message:" "$other_message" ;;
esac

# Prints the load line where Claude Code was started with no prompt ---------------

bare_message=$("$project/bin/claude")

case "$bare_message" in
  *"$control_load_line") ;;
  *) fail "Prints the load line where Claude Code was started with no prompt" "message:" "$bare_message" ;;
esac

echo "7 passed"
