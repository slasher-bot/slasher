#!/bin/sh
# Print the implementation branch of the current implementation. Where more than
# one is current, print the one most recently acted upon.
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

recent=
recent_time=-1

for record in "$local"/implementations/*-ACTIVE.md "$local"/implementations/*-SUSPENDED.md; do
  [ -f "$record" ] || continue
  branch=$(sed -n 's/^- \*\*Implementation branch:\*\* `\(.*\)`$/\1/p' "$record")
  [ -n "$branch" ] || continue

  # Its branch's latest commit is when the implementation was last acted upon.
  time=$(git log -1 --format=%ct "$branch" -- 2>/dev/null)
  time=${time:-0}

  if [ "$time" -gt "$recent_time" ]; then
    recent=$branch
    recent_time=$time
  fi
done

if [ -n "$recent" ]; then
  printf '%s\n' "$recent"
fi
