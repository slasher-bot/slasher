#!/bin/sh
# Build Slasher's marketplace listing, .claude-plugin/marketplace.json, naming each package given
# as a plugin under plugins/.
#
#   system/foundation/build-marketplace-listing.sh <package> ...
#
# Run from the repository root.
set -e

[ $# -gt 0 ] || { echo "Usage: system/foundation/build-marketplace-listing.sh <package> ..." >&2; exit 1; }

mkdir -p .claude-plugin

{
  cat <<'HEAD'
{
  "name": "slasher",
  "owner": {
    "name": "slasher-bot"
  },
  "plugins": [
HEAD
  separator=""
  for package in "$@"; do
    printf '%s' "$separator"
    cat <<ENTRY
    {
      "name": "$package",
      "source": "./plugins/$package",
      "description": "The commands of Slasher's $package package"
ENTRY
    printf '    }'
    separator=",
"
  done
  echo
  cat <<'TAIL'
  ]
}
TAIL
} > .claude-plugin/marketplace.json

echo "Built .claude-plugin/marketplace.json"
