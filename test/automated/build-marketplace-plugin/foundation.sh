#!/bin/sh
# Usage:
#
#   test/automated/build-marketplace-plugin/foundation.sh
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

repository=$(mktemp -d)
trap 'rm -rf "$repository"' EXIT

mkdir -p "$repository/system"
cp -R system/foundation "$repository/system/foundation"

# The text is read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line
# ending in a backslash to the next one there.
control_manifest_text() {
  cat <<'MANIFEST'
{
  "name": "foundation",
  "displayName": "Slasher foundation",
  "description": "The commands of Slasher's foundation package"
}
MANIFEST
}

# Actuation ------------------------------------------------------------------

(cd "$repository" && system/foundation/build-marketplace-plugin.sh foundation) > /dev/null

# Observation ----------------------------------------------------------------

manifest=$(cat "$repository/plugins/foundation/.claude-plugin/plugin.json")

[ "$manifest" = "$(control_manifest_text)" ] || fail "" "found:" "$manifest"

echo "0 failed, 0 aborted"
