#!/bin/sh
# Print the implementation branch of the current implementation.
#
# Usage:
#
#   slasher/system/foundation/current-implementation.sh

# Locate the records, as the status line locates the system.
if [ -d slasher/local ]; then
  local=slasher/local
else
  local=local
fi

for record in "$local"/implementations/*-ACTIVE.md "$local"/implementations/*-SUSPENDED.md; do
  [ -f "$record" ] || continue
  sed -n 's/^- \*\*Implementation branch:\*\* `\(.*\)`$/\1/p' "$record"
done
