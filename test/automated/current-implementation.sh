#!/bin/sh
# Usage:
#
#   test/automated/current-implementation.sh
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

project=$(mktemp -d)
trap 'rm -rf "$project"' EXIT
mkdir -p "$project/system/foundation" "$project/local/implementations"
cp system/foundation/current-implementation.sh "$project/system/foundation/"

control_branch="feature/some-subject"

cat > "$project/local/implementations/2026-01-01T00-00-00Z-some-subject-ACTIVE.md" <<RECORD
# Feature — Some intent

- **State:** Active
- **Implementation branch:** \`$control_branch\`
RECORD

# Actuation ------------------------------------------------------------------

implementation=$(cd "$project" && system/foundation/current-implementation.sh)

# ----------------------------------------------------------------------------

[ "$implementation" = "$control_branch" ] || fail "(unnamed)" "found:" "$implementation"

echo "0 failed, 0 aborted"
