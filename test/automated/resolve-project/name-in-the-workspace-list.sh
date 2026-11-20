#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/name-in-the-workspace-list.sh
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

control_workspace_member="$parent/some-workspace-member"
slasher_project "$control_workspace_member"

cat > "$parent/slasher.toml" <<'CONFIG'
workspace-project = "some-workspace"
CONFIG

cat > "$control_workspace/slasher/local/projects.toml" <<'REGISTRY'
[[project]]
path = "some-workspace-member"
REGISTRY

# Actuation ------------------------------------------------------------------

resolved=$(cd "$control_project" && SLASHER_REGISTRY="$parent/some-missing-projects.toml" "$scripts/resolve-project.sh" some-workspace-member)

echo "Resolved: $resolved"

# Prints the root of a project that only the workspace list names

[ "$resolved" = "$control_workspace_member" ] || fail "Prints the root of a project that only the workspace list names" "found:" "$resolved"

echo "0 failed, 0 aborted"
