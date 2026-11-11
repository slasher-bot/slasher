#!/bin/sh
# Usage:
#
#   test/automated/command-table-rows.sh
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

# Command table rows

# Controls -------------------------------------------------------------------

control_domains_without_rows="phase"

# Actuation ------------------------------------------------------------------

missing=
different=
for help in system/*/skills/*/help.md; do
  skill=$(dirname "$help")
  domain=$(basename "$skill")
  case " $control_domains_without_rows " in *" $domain "*) continue ;; esac

  rows="$skill/command-table-rows.md"
  if [ ! -f "$rows" ]; then
    missing="$missing $domain"
    continue
  fi

  # The help's description is the paragraph under its heading. A row never opens with
  # "This command", so a help that does is compared with that opening dropped.
  description=$(awk 'NR == 1 { next } /^$/ { exit } { sub(/^ +/, ""); printf "%s ", $0 }' "$help" |
    sed 's/ $//; s/^This command \(.\)/\1/')
  description=$(printf '%s' "$description" | awk '{ print toupper(substr($0, 1, 1)) substr($0, 2) }')
  row=$(head -1 "$rows" | awk -F'|' '{ print $3 }' | sed 's/^ //; s/ $//')

  [ "$description" = "$row" ] || different="$different $domain"
done

# Observation ----------------------------------------------------------------

[ -z "$missing" ] || fail "Every command domain has rows" "no rows:" "$missing"
[ -z "$different" ] || fail "Each row's description is its help's" "different:" "$different"

echo "0 failed, 0 aborted"
