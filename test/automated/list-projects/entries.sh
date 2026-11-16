#!/bin/sh
# Usage:
#
#   test/automated/list-projects/entries.sh
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

control_other_project="$registry/some-other-project"
mkdir -p "$control_other_project/slasher/system"
git init -q "$control_other_project"

cat > "$registry/projects.toml" <<REGISTRY
[[project]]
path = "$control_project"
journal = "private"

[[project]]
path = "$control_other_project"
REGISTRY

# Actuation ------------------------------------------------------------------

projects=$(SLASHER_REGISTRY="$registry/projects.toml" system/foundation/list-projects.sh)

control_projects=$(printf '%s\n%s\n' "$control_other_project" "$control_project")

[ "$projects" = "$control_projects" ] || fail "Lists each project's path" "projects:" "$projects"

echo "0 failed, 0 aborted"
