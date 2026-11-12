#!/bin/sh
# Build a package's plugin for Slasher's marketplace, in plugins/<package>/.
#
#   system/foundation/build-marketplace-plugin.sh <package>
#
# Run from the repository root. The plugin is the package's skills/ and a manifest written here.
# It carries no hooks: a project gets them from the Slasher that /install puts there, and a
# second copy here would run each hook twice.
set -e

package="$1"
source="system/$package"
plugin="plugins/$package"

[ -n "$package" ] || { echo "Usage: system/foundation/build-marketplace-plugin.sh <package>" >&2; exit 1; }
[ -d "$source" ] || { echo "No package at $source" >&2; exit 1; }

rm -rf "$plugin"
mkdir -p "$plugin/.claude-plugin"

[ -d "$source/skills" ] && cp -R "$source/skills" "$plugin/skills"

cat > "$plugin/.claude-plugin/plugin.json" <<MANIFEST
{
  "name": "$package",
  "displayName": "Slasher $package",
  "description": "The commands of Slasher's $package package"
}
MANIFEST

echo "Built $plugin/"
