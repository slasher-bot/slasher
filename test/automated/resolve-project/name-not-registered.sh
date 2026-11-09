#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/name-not-registered.sh
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

cat > "$registry/consuming-projects.toml" <<REGISTRY
included = [
  "$registry/projects",
]
REGISTRY

# Actuation ------------------------------------------------------------------

resolved=$(cd "$project" && SLASHER_REGISTRY="$registry/consuming-projects.toml" system/foundation/resolve-project.sh some-unregistered-checkout 2>/dev/null) && status=0 || status=$?

# ----------------------------------------------------------------------------

[ "$status" -ne 0 ] || fail "(unnamed)" "status:" "$status"
[ -z "$resolved" ] || fail "(unnamed)" "output:" "$resolved"

echo "0 failed, 0 aborted"
