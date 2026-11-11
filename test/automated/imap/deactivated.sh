#!/bin/sh
# Usage:
#
#   test/automated/imap/deactivated.sh
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

# Imap
#   Deactivated

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project/slasher/system" "$project/slasher/local"
cp -R system/foundation "$project/slasher/system/"
cp -R system/imap "$project/slasher/system/"

cat > "$project/slasher/local/2026-01-01T00-00-00Z-default-imap-package-set.md" <<'DECLARATION'
- **Package set:** default, -imap
- **Packages:** foundation
- **Inactive:** imap
DECLARATION

# Actuation ------------------------------------------------------------------

(cd "$project" && slasher/system/foundation/assemble-plugin.sh)

# Observation ----------------------------------------------------------------

plugin="$project/.claude/skills/slasher"

[ ! -e "$plugin/skills/email" ] || fail "Leaves out the /email command" "skills:" "$(ls "$plugin/skills")"
! grep -qF '| `/email` |' "$plugin/command-table.md" || fail "Leaves out the /email row" "table:" "$(cat "$plugin/command-table.md")"

echo "0 failed, 0 aborted"
