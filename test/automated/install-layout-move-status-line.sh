#!/bin/sh
# Usage:
#
#   test/automated/install-layout-move-status-line.sh
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

project=$(mktemp -d)
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT
installer="$(pwd)/system/foundation/install.sh"

mkdir -p "$project/waytide/system/foundation" "$project/.claude"
cp -R system/foundation/plugin "$project/waytide/system/foundation/"

cat > "$project/.claude/settings.json" <<'JSON'
{
  "statusLine": {
    "type": "command",
    "command": "waytide/system/foundation/statusline.sh"
  }
}
JSON

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && HOME="$home" sh "$installer" agents-md)

# Reports the status line's old path, and the path to change it to -----------

printf '%s' "$output" | grep -qF 'waytide/system/foundation/statusline.sh' &&
  printf '%s' "$output" | grep -qF 'slasher/system/foundation/statusline.sh' ||
  fail "Reports the status line's old path, and the path to change it to" "found:" "$output"

echo "0 failed, 0 aborted"
