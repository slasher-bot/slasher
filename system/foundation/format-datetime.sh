#!/bin/sh
# Usage:
#
#   slasher/system/foundation/format-datetime.sh <format> [<prefix>]
#
# Prints the moment a UTC file name prefix names, as 2026-11-22T02-01-28Z, in a named format, in
# local time. A file name that starts with the prefix is read the same way. With no prefix it prints
# the present moment.
#
# The formats are the dates-and-times-are-written-in-named-formats rule's:
#
#   iso-full              2026-11-21T18-01-28
#   iso-date-short-time   2026-11-21T18-01
#   iso-date              2026-11-21
#   date                  Sat Nov 21 2026
#   short-date            Sat Nov 21
#   date-time-text        Sat Nov 21 2026 at 18:01:28 PT
#
# A local time in an ISO format has no suffix. date-time-text ends in the zone abbreviation, which
# names the zone and not the season: PT, not PST or PDT.
set -e

format=$1
prefix=$2

case $format in
  iso-full) pattern='%Y-%m-%dT%H-%M-%S' ;;
  iso-date-short-time) pattern='%Y-%m-%dT%H-%M' ;;
  iso-date) pattern='%Y-%m-%d' ;;
  date) pattern='%a %b %-d %Y' ;;
  short-date) pattern='%a %b %-d' ;;
  date-time-text) pattern='%a %b %-d %Y at %H:%M:%S' ;;
  *)
    echo "Unknown format: $format" >&2
    echo "The formats are iso-full, iso-date-short-time, iso-date, date, short-date, and date-time-text." >&2
    exit 1
    ;;
esac

# The seconds since the epoch of the moment named. BSD date (macOS) and GNU date (Linux) take the
# moment differently.
if [ -n "$prefix" ]; then
  stamp=$(printf '%s\n' "${prefix##*/}" | sed -n 's/^\([0-9]\{4\}-[0-9][0-9]-[0-9][0-9]T[0-9][0-9]-[0-9][0-9]-[0-9][0-9]Z\).*/\1/p')
  if [ -z "$stamp" ]; then
    echo "Not a UTC file name prefix: $prefix" >&2
    exit 1
  fi
  if seconds=$(date -j -u -f '%Y-%m-%dT%H-%M-%SZ' "$stamp" +%s 2> /dev/null); then
    :
  else
    readable=$(printf '%s\n' "$stamp" | sed 's/^\(.\{10\}\)T\(..\)-\(..\)-\(..\)Z$/\1 \2:\3:\4/')
    seconds=$(date -u -d "$readable" +%s)
  fi
else
  seconds=$(date +%s)
fi

in_local_time() {
  date -r "$seconds" "+$1" 2> /dev/null || date -d "@$seconds" "+$1"
}

formatted=$(in_local_time "$pattern")

if [ "$format" = date-time-text ]; then
  zone=$(in_local_time '%Z')
  # A North American zone is named for its season, as PST and PDT. Its name drops the season.
  case $zone in
    [AEHCMP][SD]T) zone="$(printf '%s' "$zone" | cut -c1)T" ;;
  esac
  formatted="$formatted $zone"
fi

printf '%s\n' "$formatted"
