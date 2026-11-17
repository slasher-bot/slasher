#!/bin/sh
# Usage:
#
#   test/automated/local-directory/process-question-log-hook.sh
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

parent=$(mktemp -d)
trap 'rm -rf "$parent"' EXIT
parent=$(cd "$parent" && pwd -P)

project="$parent/some-project"
records="$parent/some-records"
mkdir -p "$project/slasher/system/foundation" "$records"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/slasher/system/foundation/"

registry="$parent/projects.toml"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$records"
TOML
mkdir -p "$records/logs/log"
cat > "$project/slasher/system/foundation/process-question-log.sh" <<'SCRIPT'
#!/bin/sh
echo "$1" > "$(dirname "$0")/some-received-directory"
SCRIPT
chmod +x "$project/slasher/system/foundation/process-question-log.sh"

# Actuation ------------------------------------------------------------------

CLAUDE_PROJECT_DIR="$project" SLASHER_REGISTRY="$registry" system/foundation/plugin/hooks/process-question-log < /dev/null

# Where the project's local directory is relocated

received=$(cat "$project/slasher/system/foundation/some-received-directory" 2>/dev/null || true)

[ "$received" = "$records/logs/log" ] || fail "Writes to the relocated log" "received: $received"

echo "0 failed, 0 aborted"
