#!/bin/sh
# Print the branch of the current implementation, or of its phase under way. Where
# more than one is current, print the one most recently acted upon.
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

for record in "$local"/implementations/*-OPEN.md "$local"/implementations/*-ACTIVE.md "$local"/implementations/*-SUSPENDED.md; do
  [ -f "$record" ] || continue
  branch=$(sed -n 's/^- \*\*Implementation branch:\*\* `\(.*\)`$/\1/p' "$record")
  [ -n "$branch" ] || continue

  # The implementation's branch and its phases' branches. The one with the
  # latest commit is where it was last acted upon.
  latest=$(git for-each-ref --sort=-committerdate \
    --format='%(committerdate:unix) %(refname:short)' \
    "refs/heads/$branch" "refs/heads/$branch.*" 2>/dev/null | head -1)

  time=${latest%% *}
  time=${time:-0}
  shown=${latest#* }
  shown=${shown:-$branch}

  if [ "$time" -gt "$recent_time" ]; then
    recent=$shown
    recent_time=$time
  fi
done

if [ -n "$recent" ]; then
  printf '%s\n' "$recent"
fi
