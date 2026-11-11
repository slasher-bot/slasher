#!/bin/sh
# Usage:
#
#   test/automated/assemble-plugin/command-table-startup.sh
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

# Assemble plugin
#   Command table startup

# Controls -------------------------------------------------------------------

directory=$(mktemp -d)
trap 'rm -rf "$directory"' EXIT

project="$directory/some-project"
system="$project/slasher/system"
mkdir -p "$system/foundation/plugin" "$project/slasher/local"
cp system/foundation/assemble-plugin.sh "$system/foundation/"

cat > "$system/foundation/plugin/command-table-header.md" <<'TABLE'
| Command | Description |
|---|---|
| `/slasher help` | Print the help of every Slasher command |
| `/;, /commands` | Print this table |
TABLE

cat > "$system/foundation/plugin/command-table-startup.md" <<'TABLE'
| Command | Description |
|---|---|
| `/slasher help, /help` | Print the help of every Slasher command |
TABLE

printf 'some-cart\nsome-receipt\n' > "$system/foundation/plugin/help-order"

skill() {
  mkdir -p "$system/$1/skills/$2"
  echo "some skill" > "$system/$1/skills/$2/SKILL.md"
  echo "$3" > "$system/$1/skills/$2/command-table-rows.md"
}

skill some-store some-receipt '| `/some-receipt` | Some receipt |'
skill some-store some-cart '| `/some-cart` | Some cart |'
skill some-payments some-payment '| `/some-payment` | Some payment |'

cat > "$project/slasher/local/2026-01-01T00-00-00Z-some-package-set.md" <<'DECLARATION'
- **Package set:** some
- **Packages:** foundation, some-store
- **Inactive:** some-payments
DECLARATION

control_sentence='The other commands are `/commands`, `/some-cart`, and `/some-receipt`.'

# Actuation ------------------------------------------------------------------

(cd "$project" && slasher/system/foundation/assemble-plugin.sh)

# Observation ----------------------------------------------------------------

sentence=$(grep '^The other commands are ' "$project/.claude/skills/slasher/command-table-startup.md" 2>/dev/null || true)

[ "$sentence" = "$control_sentence" ] || fail "Names every command the startup rows leave out" "sentence:" "$sentence"

echo "0 failed, 0 aborted"
