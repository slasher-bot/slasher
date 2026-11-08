#!/bin/sh
# Usage:
#
#   slasher/system/foundation/resolve-project.sh -base
#
# Run from the root of a Slasher project. Prints the root of the
# project's base project: the directory beside it that slasher.toml,
# in their shared parent directory, names.

set -e

case $1 in
  -base)
    parent=$(dirname "$PWD")

    name=$(
      sed -n 's/^[[:space:]]*base-project[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
        "$parent/slasher.toml"
    )

    printf '%s\n' "$parent/$name"
    ;;
esac
