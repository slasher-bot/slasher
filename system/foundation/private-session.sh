#!/bin/sh
# Usage:
#
#   private-session.sh <state-directory> <now>
#
# Reads a UserPromptSubmit event on standard input. A bare /private, or /private session, with or
# without the /slasher: prefix, starts a private session by writing the session's state file,
# named for the session, in <state-directory>. /private end, or /private session end, removes it.
#
# A bare /unrecorded, or /unrecorded with an instruction, starts an unrecorded session the same
# way, with its state file in the unrecorded-sessions directory beside <state-directory>.
# /unrecorded end removes it. Starting either session ends the other.
#
# The state file holds the time of the session's last prompt, in seconds since the epoch. Each
# prompt in a private session writes <now> there. Where more than 4 minutes passed since the last
# prompt, it prints the instruction to ask the engineer whether to continue the private session
# or end it.
#
# The plugin's hooks/private-session runs this. See the
# anything-given-to-private-is-recorded-only-in-the-private-directory rule.

state_directory=${1:?usage: private-session.sh <state-directory> <now>}
now=${2:?usage: private-session.sh <state-directory> <now>}

read_event() {
  python3 -c 'import json, sys
event = json.load(sys.stdin)
print(event.get("session_id", ""))
print(event.get("prompt", "").replace("\n", " "))'
}

{ read -r session_id; read -r prompt; } <<EVENT
$(read_event)
EVENT

[ -n "$session_id" ] || exit 0

# An unrecorded session's state sits beside the private session's, in unrecorded-sessions/. Only
# one of the two holds at a time, so starting either ends the other, and records only go one way.
private=$state_directory/$session_id
unrecorded_directory=$(dirname "$state_directory")/unrecorded-sessions
unrecorded=$unrecorded_directory/$session_id

# Trailing spaces are dropped, so "/private " reads as a bare /private.
prompt=$(printf '%s' "$prompt" | sed 's/[[:space:]]*$//')

case $prompt in
  "/private end"|"/slasher:private end"|"/private session end"*|"/slasher:private session end"*)
    rm -f "$private"
    exit 0 ;;
  "/private"|"/slasher:private"|"/private session"*|"/slasher:private session"*)
    mkdir -p "$state_directory"
    printf '%s\n' "$now" > "$private"
    rm -f "$unrecorded"
    exit 0 ;;
  "/unrecorded end"|"/slasher:unrecorded end")
    rm -f "$unrecorded"
    exit 0 ;;
  "/unrecorded"|"/slasher:unrecorded"|"/unrecorded "*|"/slasher:unrecorded "*)
    mkdir -p "$unrecorded_directory"
    printf '%s\n' "$now" > "$unrecorded"
    rm -f "$private"
    exit 0 ;;
esac

if [ -f "$private" ]; then
  state=$private
  kind=private
elif [ -f "$unrecorded" ]; then
  state=$unrecorded
  kind=unrecorded
else
  exit 0
fi

last_prompt=$(cat "$state")
printf '%s\n' "$now" > "$state"

if [ $((now - last_prompt)) -gt 240 ]; then
  echo "The $kind session has had no prompt for more than 4 minutes. Before anything else, ask the engineer, through the selection interface, whether to continue the $kind session or end it. Where the engineer ends it, delete $state."
fi
