#!/bin/sh
# Usage:
#
#   test/automated/resolve-project/system.sh
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

config=$(mktemp -d)
project=$(mktemp -d)
trap 'rm -rf "$config" "$project"' EXIT

mkdir -p "$project/system/foundation"
cp system/foundation/resolve-project.sh "$project/system/foundation/"

control_system="$config/some-system"

cat > "$config/system-project.toml" <<CONFIG
path = "$control_system"
CONFIG

# Actuation ------------------------------------------------------------------

system=$(cd "$project" && SLASHER_SYSTEM_PROJECT="$config/system-project.toml" system/foundation/resolve-project.sh -system)

echo "System: $system"

# ----------------------------------------------------------------------------

[ "$system" = "$control_system" ] || fail "(unnamed)" "found:" "$system"

echo "0 failed, 0 aborted"
