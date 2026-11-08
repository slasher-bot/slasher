#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/base.sh
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

control_base="$parent/some-base"
mkdir "$control_base"

cat > "$parent/slasher.toml" <<'CONFIG'
base-project = "some-base"
CONFIG

# Actuation ------------------------------------------------------------------

base=$(cd "$project" && system/foundation/resolve-project.sh -base)

echo "Base: $base"

# ----------------------------------------------------------------------------

[ "$base" = "$control_base" ] || fail "(unnamed)" "found:" "$base"

echo "0 failed, 0 aborted"
