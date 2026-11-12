#!/bin/sh
# Usage:
#
#   test/automated/build-marketplace-listing/slasher.sh
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
control_listing_text() {
  cat <<'LISTING'
{
  "name": "slasher",
  "owner": {
    "name": "slasher-bot"
  },
  "plugins": [
    {
      "name": "slasher",
      "source": "./plugins/slasher",
      "description": "Installs Slasher into a project"
    }
  ]
}
LISTING
}

# Actuation ------------------------------------------------------------------

(cd "$repository" && system/foundation/build-marketplace-listing.sh slasher) > /dev/null

# Observation ----------------------------------------------------------------

listing=$(cat "$repository/.claude-plugin/marketplace.json")

[ "$listing" = "$(control_listing_text)" ] || fail "" "found:" "$listing"

echo "0 failed, 0 aborted"
