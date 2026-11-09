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

control_checkout="$registry/projects/some-checkout"
mkdir -p "$control_checkout/slasher/system"
git init -q "$control_checkout"

control_other_checkout="$registry/projects/some-other-checkout"
mkdir -p "$control_other_checkout/slasher/system"
git init -q "$control_other_checkout"

cat > "$registry/consuming-projects.toml" <<REGISTRY
included = [
  "$registry/projects",
]
REGISTRY

# Actuation ------------------------------------------------------------------

resolved=$(cd "$project" && SLASHER_REGISTRY="$registry/consuming-projects.toml" system/foundation/resolve-project.sh some-checkout)

echo "Resolved: $resolved"

# Prints the root of the registered project with that name

[ "$resolved" = "$control_checkout" ] || fail "Prints the root of the registered project with that name" "found:" "$resolved"

echo "0 failed, 0 aborted"
