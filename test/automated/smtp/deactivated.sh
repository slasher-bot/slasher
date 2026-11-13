#!/bin/sh
# Usage:
#
#   test/automated/smtp/deactivated.sh
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

# Smtp
#   Deactivated

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

project="$directory/some-project"
mkdir -p "$project/slasher/system" "$project/slasher/local"
cp -R system/foundation "$project/slasher/system/"
cp -R system/imap system/smtp "$project/slasher/system/"

cat > "$project/slasher/local/2026-01-01T00-00-00Z-default-smtp-package-set.md" <<'DECLARATION'
- **Package set:** default, -imap, -smtp
- **Packages:** foundation
- **Inactive:** imap, smtp
DECLARATION

# Actuation ------------------------------------------------------------------

(cd "$project" && slasher/system/foundation/assemble-plugin.sh)

# Observation ----------------------------------------------------------------

plugin="$project/.claude/skills/slasher"

[ ! -e "$plugin/skills/smtp" ] || fail "Leaves out the /smtp command" "skills:" "$(ls "$plugin/skills")"
! grep -qF '| `/smtp` |' "$plugin/command-table.md" || fail "Leaves out the /smtp row" "table:" "$(cat "$plugin/command-table.md")"

echo "0 failed, 0 aborted"
