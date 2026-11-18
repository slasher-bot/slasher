#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/workspace.sh
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

project="$parent/some-project"
mkdir -p "$project/system/foundation"
cp system/foundation/resolve-project.sh "$project/system/foundation/"

control_workspace="$parent/some-workspace"
mkdir "$control_workspace"

cat > "$parent/slasher.toml" <<'CONFIG'
workspace-project = "some-workspace"
CONFIG

# Actuation ------------------------------------------------------------------

workspace=$(cd "$project" && system/foundation/resolve-project.sh -workspace)

echo "Workspace: $workspace"

# Prints the root of the workspace project slasher.toml names

[ "$workspace" = "$control_workspace" ] || fail "Prints the root of the workspace project slasher.toml names" "found:" "$workspace"

echo "0 failed, 0 aborted"
