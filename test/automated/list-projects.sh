#!/bin/sh
# Usage:
#
#   test/automated/list-projects.sh
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

control_project="$registry/projects/some-project"
mkdir -p "$control_project/slasher/system"
git init -q "$control_project"

cat > "$registry/index.toml" <<REGISTRY
included = [
  "$registry/projects",
]

[[project]]
path = "$control_project"
journal = "private"
REGISTRY

# Actuation ------------------------------------------------------------------

projects=$(SLASHER_REGISTRY="$registry/index.toml" system/foundation/list-projects.sh)

[ "$projects" = "$control_project" ] || fail "Lists the included projects" "projects:" "$projects"

echo "0 failed, 0 aborted"
