#!/bin/sh
# Usage:
#
#   test/automated/local-directory/assemble-plugin.sh
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
parent=$(cd "$parent" && pwd -P)

project="$parent/some-project"
records="$parent/some-records"
mkdir -p "$project/slasher/system/foundation" "$records"
cp system/foundation/local-directory.sh system/foundation/read-project-setting.sh "$project/slasher/system/foundation/"

registry="$parent/projects.toml"
cat > "$registry" <<TOML
[[project]]
path = "$project"
local = "$records"
TOML
cp system/foundation/assemble-plugin.sh "$project/slasher/system/foundation/"
mkdir -p "$project/slasher/system/foundation/plugin" "$project/slasher/system/sample/skills/some-command"
echo "some manifest" > "$project/slasher/system/foundation/plugin/some-file"
echo "some skill" > "$project/slasher/system/sample/skills/some-command/SKILL.md"
cat > "$records/2026-01-01T00-00-00Z-some-package-set.md" <<'DECLARATION'
- **Package set:** default, -sample
- **Packages:** foundation
- **Inactive:** sample
DECLARATION

# Actuation ------------------------------------------------------------------

(cd "$project" && SLASHER_REGISTRY="$registry" slasher/system/foundation/assemble-plugin.sh) > /dev/null

# Where the relocated directory's package set deactivates a package

[ ! -e "$project/.claude/skills/slasher/skills/some-command" ] || fail "Leaves out the deactivated package's skill"

echo "0 failed, 0 aborted"
