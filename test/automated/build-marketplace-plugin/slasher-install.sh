#!/bin/sh
# Usage:
#
#   test/automated/build-marketplace-plugin/slasher-install.sh
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

printf '#!/bin/sh\necho some installer\n' > "$repository/slasher-install"

# The text is read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line
# ending in a backslash to the next one there.
control_manifest_text() {
  cat <<'MANIFEST'
{
  "name": "slasher-install",
  "displayName": "Slasher",
  "description": "Installs Slasher into a project"
}
MANIFEST
}

[ "$(ls "$repository/system/foundation/skills" | wc -l)" -gt 1 ] || { echo "Precondition: the package has skills besides install"; echo "0 failed, 1 aborted"; exit 1; }
[ -d "$repository/system/foundation/plugin/hooks" ] || { echo "Precondition: the package has hooks"; echo "0 failed, 1 aborted"; exit 1; }

# Actuation ------------------------------------------------------------------

(cd "$repository" && system/foundation/build-marketplace-plugin.sh slasher-install) > /dev/null

# Writes a manifest naming the package ---------------------------------------

manifest=$(cat "$repository/plugins/slasher-install/.claude-plugin/plugin.json")

[ "$manifest" = "$(control_manifest_text)" ] || fail "Writes a manifest naming the package" "found:" "$manifest"

# Copies only the install skill ----------------------------------------------

skills=$(ls "$repository/plugins/slasher-install/skills")

[ "$skills" = "install" ] || fail "Copies only the install skill" "found:" "$skills"

# Carries no hooks -----------------------------------------------------------

[ ! -e "$repository/plugins/slasher-install/hooks" ] || fail "Carries no hooks" "found:" "$(ls "$repository/plugins/slasher-install/hooks")"

# Copies the installer -------------------------------------------------------

installer="$repository/plugins/slasher-install/slasher-install"

cmp -s "$repository/slasher-install" "$installer" || fail "Copies the installer" "found:" "$(ls "$repository/plugins/slasher-install")"

echo "0 failed, 0 aborted"
