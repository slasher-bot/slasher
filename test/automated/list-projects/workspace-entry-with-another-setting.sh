#!/bin/sh
# Usage:
#
#   test/automated/list-projects/workspace-entry-with-another-setting.sh
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

scripts=$PWD/system/foundation

# Controls -------------------------------------------------------------------

parent=$(mktemp -d)
trap 'rm -rf "$parent"' EXIT

slasher_project() {
  mkdir -p "$1/slasher/system"
  git init -q "$1"
}

control_project="$parent/some-project"
slasher_project "$control_project"

control_workspace="$parent/some-workspace"
slasher_project "$control_workspace"
mkdir -p "$control_workspace/slasher/local"

cat > "$parent/slasher.toml" <<'CONFIG'
workspace-project = "some-workspace"
CONFIG

cat > "$control_workspace/slasher/local/projects.toml" <<'REGISTRY'
[[project]]
path = "some-project"
journal = "private"
REGISTRY

# Actuation ------------------------------------------------------------------

if error=$(cd "$control_project" && SLASHER_REGISTRY="$parent/some-missing-projects.toml" "$scripts/list-projects.sh" 2>&1 >/dev/null); then
  fail "When a workspace entry holds a setting other than path: Fails" "it did not fail"
fi

echo "Error: $error"

# When a workspace entry holds a setting other than path: Fails, naming its line

case $error in
  *"slasher/local/projects.toml, line 3:"*) ;;
  *) fail "When a workspace entry holds a setting other than path: Fails, naming its line" "error:" "$error" ;;
esac

echo "0 failed, 0 aborted"
