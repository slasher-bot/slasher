#!/bin/sh
# Print the implementation branch of the current implementation.
#
# Usage:
#
#   slasher/system/foundation/current-implementation.sh

for record in local/implementations/*-ACTIVE.md local/implementations/*-SUSPENDED.md; do
  [ -f "$record" ] || continue
  sed -n 's/^- \*\*Implementation branch:\*\* `\(.*\)`$/\1/p' "$record"
done
