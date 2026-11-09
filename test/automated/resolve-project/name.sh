#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/name.sh
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
project=$(mktemp -d)
trap 'rm -rf "$registry" "$project"' EXIT

mkdir -p "$project/system/foundation"
cp system/foundation/resolve-project.sh system/foundation/read-consuming-projects.sh "$project/system/foundation/"

control_project="$registry/projects/some-project"
mkdir -p "$control_project/slasher/system"
git init -q "$control_project"

control_other_project="$registry/projects/some-other-project"
mkdir -p "$control_other_project/slasher/system"
git init -q "$control_other_project"

cat > "$registry/consuming-projects.toml" <<REGISTRY
included = [
  "$registry/projects",
]
REGISTRY

# Actuation ------------------------------------------------------------------

resolved=$(cd "$project" && SLASHER_REGISTRY="$registry/consuming-projects.toml" system/foundation/resolve-project.sh some-project)

echo "Resolved: $resolved"

# Prints the root of the registered project with that name

[ "$resolved" = "$control_project" ] || fail "Prints the root of the registered project with that name" "found:" "$resolved"

echo "0 failed, 0 aborted"
