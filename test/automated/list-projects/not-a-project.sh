#!/bin/sh
# Usage:
#
#   test/automated/list-projects/not-a-project.sh
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

registry=$(mktemp -d)
trap 'rm -rf "$registry"' EXIT

control_project="$registry/some-project"
mkdir -p "$control_project/slasher/system"
git init -q "$control_project"

control_folder="$registry/some-folder"
mkdir -p "$control_folder"

cat > "$registry/projects.toml" <<REGISTRY
[[project]]
path = "$control_folder"

[[project]]
path = "$control_project"
REGISTRY

# Actuation ------------------------------------------------------------------

projects=$(SLASHER_REGISTRY="$registry/projects.toml" system/foundation/list-projects.sh 2> "$registry/errors") && status=0 || status=$?
errors=$(cat "$registry/errors")

# Where an entry's path is not a Slasher project

[ "$status" -eq 0 ] || fail "Succeeds" "status: $status"
[ "$projects" = "$control_project" ] || fail "Lists the other project" "projects:" "$projects"
printf '%s\n' "$errors" | grep -qF "$control_folder" || fail "Reports the path" "errors:" "$errors"

echo "0 failed, 0 aborted"
