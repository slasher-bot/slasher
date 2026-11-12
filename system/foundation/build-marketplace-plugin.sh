#!/bin/sh
# Build a package's plugin for Slasher's marketplace, in plugins/<package>/.
#
#   system/foundation/build-marketplace-plugin.sh <package>
#
# Run from the repository root. The plugin is the package's install skill, where it has one,
# and a manifest written here. It carries no other command and no hooks: a project gets them
# from the Slasher that /install puts there, and a second copy here would show each command
# twice and run each hook twice.
set -e

package="$1"
source="system/$package"
plugin="plugins/$package"

[ -n "$package" ] || { echo "Usage: system/foundation/build-marketplace-plugin.sh <package>" >&2; exit 1; }
[ -d "$source" ] || { echo "No package at $source" >&2; exit 1; }

rm -rf "$plugin"
mkdir -p "$plugin/.claude-plugin"

if [ -d "$source/skills/install" ]; then
  mkdir -p "$plugin/skills"
  cp -R "$source/skills/install" "$plugin/skills/install"
fi

cat > "$plugin/.claude-plugin/plugin.json" <<MANIFEST
{
  "name": "$package",
  "displayName": "Slasher $package",
  "description": "The commands of Slasher's $package package"
}
MANIFEST

echo "Built $plugin/"
