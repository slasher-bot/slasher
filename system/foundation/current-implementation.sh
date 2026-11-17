#!/bin/sh
# Print the branch of the current implementation, or of its phase under way. Where
# more than one is current, print the one most recently acted upon.
#
# Usage:
#
#   slasher/system/foundation/current-implementation.sh

# Locate the records, where local-directory.sh says. Where it fails, as for a relocated
# directory that does not exist, nothing is current.
if [ -d slasher/system ]; then
  scripts=slasher/system/foundation
else
  scripts=system/foundation
fi
local=$("$scripts/local-directory.sh" 2>/dev/null) || exit 0

recent=
recent_time=-1

# The records in this working tree, and in every other worktree of the
# repository, so an implementation recorded only on its own branch is found.
# One directory to a line, since a path may hold a space.
directories="$local/implementations"
# A relocated directory, which local-directory.sh names by its full path, is the one every
# worktree uses, so no other worktree is read.
case $local in
  /*) worktrees= ;;
  *) worktrees=$(git worktree list --porcelain 2>/dev/null | sed -n 's/^worktree //p') ;;
esac
newline='
'
old_ifs=$IFS
IFS=$newline
for worktree in $worktrees; do
  if [ -d "$worktree/slasher/local" ]; then
    directories="$directories$newline$worktree/slasher/local/implementations"
  else
    directories="$directories$newline$worktree/local/implementations"
  fi
done

for directory in $directories; do
  IFS=$old_ifs
  for record in "$directory"/*.md; do
    [ -f "$record" ] || continue

    # The State line is the only statement of the state. An Open, Active, or Suspended
    # implementation is current.
    grep -Eq '^(- )?\*\*State:\*\* (Open|Active|Suspended)$' "$record" || continue
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
  IFS=$newline
done
IFS=$old_ifs

if [ -n "$recent" ]; then
  printf '%s\n' "$recent"
fi
