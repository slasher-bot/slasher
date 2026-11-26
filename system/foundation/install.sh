#!/bin/sh
# Install (or refresh) the foundation package AND activate the system.
# Foundation is standalone, but it owns the bootstrap: this script places the
# project-root AGENTS.md that makes slasher/system/, slasher/local/rules/, and
# slasher/local/vocabulary.md get read at session start,
# a CLAUDE.md that imports it (Claude Code reads CLAUDE.md, not AGENTS.md), the Slasher plugin
# in .claude/skills/slasher/, whose SessionStart hook prints the startup display and the
# session-start notice, and a .claude/settings.json whose status line keeps the system on screen.
# Run from the root of the Slasher project. This script lives inside the package it
# installs, so once foundation is present it is invoked by its path from that root — not
# as `./install.sh`, which would name a file in the project root that is not there.
#
# Usage:
#
#   slasher/system/foundation/install.sh
#     Install or refresh foundation, then place the bootstrap files.
#
#   slasher/system/foundation/install.sh agents-md
#     Place the bootstrap files only, foundation already being installed. The composite
#     install-all.sh uses this, so the bootstrap logic lives in one place rather than two.
#
#   slasher/system/foundation/install.sh [agents-md] --append-agents-md
#     As above, and where the project already has an AGENTS.md without the import line,
#     append the line to it without asking.
#
#   slasher/system/foundation/install.sh migrate
#     Run the migrations only: the record migrations, and the replacement of an AGENTS.md
#     section that is Slasher's alone with the import line. Asks nothing, places nothing a
#     project has not got, and prints only what it changed. update-packages.sh runs it after
#     a pull, with the installer it just pulled.
#
#   slasher/system/foundation/install.sh bootstrap
#     Print the bootstrap and exit, placing nothing. update-packages.sh writes it to
#     slasher/SLASHER.md, so the text has one source here.
set -e

# The origin foundation is fetched from. The packages are public, so HTTPS
# fetches them with no key. Override it to work over SSH:
#
#   SLASHER_ORIGIN=git@github.com:slasher-bot ./install.sh
#
origin=${SLASHER_ORIGIN:-https://github.com/slasher-bot}

prefix="slasher/system/foundation"
repo="$origin/foundation.git"

# The directory this script runs from. migrate_layout updates it when it moves the directory.
here=$(dirname "$0")

# The bootstrap, written whole to slasher/SLASHER.md, which the project-root AGENTS.md imports.
#
# It does not name the planning directory, and that is deliberate. It named none while the
# planning directories depended on a project's mode, and the mode mechanism was decommissioned
# on 2026-08-18. One directory replaces it, and the convention naming it is not yet written, so
# there is still nothing here for the bootstrap to assert.
#
# The list is illustrative rather than exhaustive, and its claim is that these
# are working state rather than rules,
# which survives without naming every one. Do not add the planning directories back.
bootstrap() {
  cat <<'EOF'
## Slasher

This project's Slasher system and working conventions live under `slasher/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `slasher/system/` and
`slasher/local/rules/`, except each package's `source/` directory and `README.md`,
and `slasher/local/vocabulary.md`, and follow them.**

`slasher/system/` holds the installed system packages —
`slasher/system/foundation/`, `slasher/system/language/`, and so on, including
each package's `vocabulary.md` glossary where it has one (its terms are binding and
can't be applied unread; not every package has one, and its absence is not a
defect). `slasher/local/rules/` holds this project's own local rules, and
`slasher/local/vocabulary.md` holds the terms and substitutions this project settles
for itself, which decide over every package's. That file may not exist, which is
ordinary and not a defect.
Read `slasher/system/foundation/` first; it defines the system. The rules
override default behavior where they conflict; explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in the Slasher plugin, `.claude/skills/slasher/`, runs
`slasher/system/foundation/session-start.sh`, which reads the package directories
actually present and emits the `Slasher installed at … — N packages: …` notice, followed
by a line telling the engineer the rules load on the first prompt, or to type `/load` — the
command that asks for the read instruction the hook carries to be acted on now;
a status line keeps the system's presence on screen for the rest of the session, beside
the working directory, branch, and any uncommitted, untracked, or unpushed work.

`slasher/` holds exactly two directories, splitting what came from outside from what
is this project's own. `slasher/system/` is installed and never edited in place.
`slasher/local/` is everything this project writes: `rules/` and `vocabulary.md`
alongside the working state — `logs/` (holding `log/`, `loops/`, and
`work-sessions/`), `items/`, `progressions/`, and `migration/` — each worked with as
its convention describes, and only `rules/` and `vocabulary.md` read as binding at
session start.
EOF
}

# The line in the project-root AGENTS.md that imports Slasher's own file. The bootstrap lives in
# slasher/SLASHER.md, which only Slasher writes, so the project's AGENTS.md holds nothing of
# Slasher's but this line, and nothing in it is compared or rewritten after install.
import_line='@slasher/SLASHER.md'

# Write the bootstrap to slasher/SLASHER.md, whole, on every run. The file is Slasher's alone.
place_slasher_md() {
  mkdir -p slasher
  written=$(mktemp)
  bootstrap > "$written"
  if [ -f slasher/SLASHER.md ] && cmp -s "$written" slasher/SLASHER.md; then
    rm -f "$written"
    echo "slasher/SLASHER.md matches the bootstrap — left unchanged."
  else
    mv "$written" slasher/SLASHER.md
    echo "Wrote the Slasher bootstrap to slasher/SLASHER.md."
  fi
}

# Ensure the project-root AGENTS.md holds the line that imports slasher/SLASHER.md. Creates it
# when absent. Where it holds a Slasher section from before the bootstrap moved, replaces the
# section with the line only where the section is exactly the bootstrap, since otherwise the
# project's own text may follow it and cannot be told apart. Where it holds no Slasher section,
# asks before appending the line, never silently. Does nothing when the line is there.
place_agents_md() {
  # An AGENTS.md written before Waytide was renamed Slasher carries a section naming
  # waytide/system/, which runs from its heading to the end of the file. That span is replaced
  # with the line, and the text above it is kept.
  if [ -f AGENTS.md ] && grep -q 'waytide/system/' AGENTS.md &&
     grep -q '^## Waytide$' AGENTS.md; then
    replaced=$(mktemp)
    sed '/^## Waytide$/,$d' AGENTS.md > "$replaced"
    printf '%s\n' "$import_line" >> "$replaced"
    mv "$replaced" AGENTS.md
    echo "Replaced AGENTS.md's Waytide section with $import_line."
  fi

  if [ -f AGENTS.md ] && grep -qx "$import_line" AGENTS.md; then
    [ "$migrate_only" = yes ] || echo "AGENTS.md already imports slasher/SLASHER.md — left unchanged."
  elif [ ! -f AGENTS.md ] && [ "$migrate_only" = yes ]; then
    # A migration changes what is there. Creating AGENTS.md is the install's to do.
    :
  elif [ ! -f AGENTS.md ]; then
    # No root AGENTS.md yet — creating one takes nothing away, so do it directly.
    printf '%s\n' "$import_line" > AGENTS.md
    echo "Created AGENTS.md with $import_line."
  elif grep -q '^## Slasher$' AGENTS.md; then
    # The Slasher section of an AGENTS.md written before the bootstrap moved runs from its
    # heading to the end of the file. Where that span is exactly the bootstrap, it is Slasher's
    # alone, and becomes the line. Where it differs, the project's own text may follow the
    # bootstrap, so nothing is changed.
    current=$(mktemp)
    carried=$(mktemp)
    bootstrap > "$current"
    sed -n '/^## Slasher$/,$p' AGENTS.md > "$carried"
    if cmp -s "$current" "$carried"; then
      replaced=$(mktemp)
      sed '/^## Slasher$/,$d' AGENTS.md > "$replaced"
      printf '%s\n' "$import_line" >> "$replaced"
      mv "$replaced" AGENTS.md
      echo "Replaced AGENTS.md's Slasher section with $import_line. The bootstrap is in slasher/SLASHER.md."
    else
      echo "AGENTS.md holds a Slasher section that differs from the bootstrap, so it was NOT modified."
      echo "Slasher's text cannot be told apart from text of your own that may follow it."
      echo "The bootstrap is now in slasher/SLASHER.md. Delete AGENTS.md's Slasher section, from"
      echo "its '## Slasher' heading to the end of Slasher's text, and put this line in its place:"
      echo
      echo "    $import_line"
    fi
    rm -f "$current" "$carried"
  elif [ "$migrate_only" = yes ]; then
    # An AGENTS.md you maintain, with no Slasher section. Adding the line needs your consent,
    # which a migration does not ask for. update-packages.sh says the line is missing.
    :
  elif [ "$append_agents_md" = yes ]; then
    # An AGENTS.md you maintain already exists, and the answer to append was given in
    # advance, with --append-agents-md, so nothing is asked.
    printf '\n%s\n' "$import_line" >> AGENTS.md
    echo "Appended $import_line to AGENTS.md, as --append-agents-md asked."
  else
    # An AGENTS.md you maintain already exists. Explain the effect, show the exact
    # line, and ask before touching it — never append silently.
    echo "You already have an AGENTS.md at the project root."
    echo
    echo "Appending one line, $import_line, imports Slasher's bootstrap, which tells"
    echo "the agent, at the start of every session, to read every rule file under slasher/system/"
    echo "and slasher/local/rules/ (except each package's source/ directory and README.md),"
    echo "and slasher/local/vocabulary.md, and follow"
    echo "it. Those rules then OVERRIDE the agent's default behavior where they conflict"
    echo "(your explicit instructions still win). Your existing AGENTS.md content is left"
    echo "exactly as it is; the line is added at the end, after a blank line, and Slasher"
    echo "never changes AGENTS.md again. The bootstrap itself is in slasher/SLASHER.md."
    echo
    if [ ! -t 0 ]; then
      echo "Not running interactively, so AGENTS.md was NOT modified."
      agents_md_unanswered=yes
      return 0
    fi
    printf 'Append the line to your AGENTS.md now? [y/N] '
    read -r answer
    case "$answer" in
      [Yy] | [Yy][Ee][Ss])
        printf '\n%s\n' "$import_line" >> AGENTS.md
        echo "Appended $import_line to AGENTS.md."
        ;;
      *)
        echo "Left AGENTS.md unchanged. Add the line $import_line to it to activate the system."
        ;;
    esac
  fi
}

# Ensure a project-root CLAUDE.md imports AGENTS.md. Claude Code loads CLAUDE.md,
# not AGENTS.md, so without this the bootstrap never reaches a Claude Code session
# and the system does not load. A one-line `@AGENTS.md` import bridges the two
# without duplicating the bootstrap. Same care as place_agents_md: creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when the import is already there. Idempotent.
place_claude_md() {
  if [ -f CLAUDE.md ] && grep -q '@AGENTS.md' CLAUDE.md; then
    echo "CLAUDE.md already imports AGENTS.md — left unchanged."
  elif [ ! -f CLAUDE.md ]; then
    # No root CLAUDE.md yet — creating one takes nothing away, so do it directly.
    printf '@AGENTS.md\n' > CLAUDE.md
    echo "Created CLAUDE.md importing AGENTS.md (Claude Code reads CLAUDE.md, not AGENTS.md)."
  else
    # A CLAUDE.md you maintain already exists. Explain the effect and ask before
    # touching it — never append silently.
    echo "You already have a CLAUDE.md at the project root."
    echo
    echo "Claude Code reads CLAUDE.md, not AGENTS.md. For the Slasher bootstrap in AGENTS.md"
    echo "to load at session start under Claude Code, CLAUDE.md needs to import it with a line"
    echo "reading: @AGENTS.md. Your existing CLAUDE.md content is left exactly as it is; the"
    echo "import is added at the end, after a blank line."
    echo
    if [ ! -t 0 ]; then
      echo "Not running interactively, so CLAUDE.md was NOT modified."
      echo "Re-run this in a terminal to be prompted, or add a line reading '@AGENTS.md' to CLAUDE.md yourself."
      return 0
    fi
    printf 'Append "@AGENTS.md" to your CLAUDE.md now? [y/N] '
    read -r answer
    case "$answer" in
      [Yy] | [Yy][Ee][Ss])
        printf '\n@AGENTS.md\n' >> CLAUDE.md
        echo "Appended '@AGENTS.md' to CLAUDE.md."
        ;;
      *)
        echo "Left CLAUDE.md unchanged. Add a line reading '@AGENTS.md' to it to load the system under Claude Code."
        ;;
    esac
  fi
}

# The .claude/settings.json content Slasher needs: the status line. The session-start notice and
# the startup display are the plugin's hooks, and a plugin cannot set the main status line, so
# this one key stays here.
settings_json() {
  cat <<'EOF'
{
  "statusLine": {
    "type": "command",
    "command": "slasher/system/foundation/statusline.sh"
  }
}
EOF
}

# Warn when git is configured to ignore .claude/settings.json or the plugin. The notice and the
# status line are meant to travel with the project, and they only do that if both are committed
# — so an ignored file works for whoever ran the install and reaches nobody else. Projects
# commonly ignore the whole .claude/ directory, in which case the install would otherwise report
# success while the notice silently stays on one machine. A file that is already committed is
# unaffected by an ignore rule, so a tracked file draws no warning. Outside a git repository,
# check-ignore fails and nothing is printed.
warn_ignored_claude_files() {
  ignored=
  for path in .claude/settings.json .claude/skills/slasher/.claude-plugin/plugin.json; do
    git check-ignore -q "$path" 2>/dev/null || continue
    git ls-files --error-unmatch "$path" >/dev/null 2>&1 && continue
    ignored=yes
  done

  [ -n "$ignored" ] || return 0

  echo
  echo "WARNING: git is set to ignore .claude/settings.json or .claude/skills/slasher/."
  echo
  echo "The files are in place and work for you, but git will not commit them, so the"
  echo "notice and the status line will not reach anyone else who checks this project out."
  echo
  echo "If your .gitignore excludes the whole .claude/ directory, a negation alone will"
  echo "not rescue the files — git cannot re-include anything inside an excluded"
  echo "directory. Replace the '.claude/' line with these three:"
  echo
  echo "    .claude/*"
  echo "    !.claude/settings.json"
  echo "    !.claude/skills/"
  echo
  echo "Or leave the ignore rule alone and commit the files explicitly:"
  echo
  echo "    git add -f .claude/settings.json .claude/skills/slasher"
}

# Ensure .claude/settings.json carries the status line. Unlike AGENTS.md and CLAUDE.md, this file
# cannot be safely appended to — merging JSON needs a JSON tool that may not be installed, and a
# corrupted settings.json silently disables every setting in it. So an existing file is never
# modified: the exact block, or the keys to remove, is printed for the engineer. Note that
# adopting the status line replaces whatever status line they had configured. Idempotent.
place_settings_json() {
  if [ -f .claude/settings.json ] && grep -q 'foundation/session-start.sh\|foundation/startup-display.sh' .claude/settings.json; then
    # Wired before the plugin carried the hooks. Both now run the session-start scripts, so the
    # notice and the read instruction print twice until these keys go. The file is still not
    # modified, for the reason given above.
    echo ".claude/settings.json still runs the Slasher session-start notice or startup display."
    echo
    echo "The Slasher plugin, in .claude/skills/slasher/, now runs both, so with these entries in"
    echo "place the notice prints twice. Remove from the 'hooks' object of your file yourself the"
    echo "'SessionStart' entry that runs slasher/system/foundation/session-start.sh and the"
    echo "'UserPromptSubmit' entry that runs slasher/system/foundation/startup-display.sh. Keep"
    echo "'statusLine'. Remove 'hooks' itself if nothing is left in it."
  elif [ -f .claude/settings.json ] && grep -q 'waytide/system/foundation/statusline.sh' .claude/settings.json; then
    # Wired before Waytide was renamed Slasher. The script moved with waytide/, so the status
    # line runs nothing until the command names the new path.
    echo ".claude/settings.json runs the status line from waytide/system/foundation/statusline.sh,"
    echo "which moved with waytide/. Change that command yourself to"
    echo "slasher/system/foundation/statusline.sh."
  elif [ -f .claude/settings.json ] && grep -q 'foundation/statusline.sh' .claude/settings.json; then
    echo ".claude/settings.json already runs the Slasher status line — left unchanged."
  elif [ ! -f .claude/settings.json ]; then
    # No settings file yet — creating one takes nothing away, so do it directly.
    mkdir -p .claude
    settings_json > .claude/settings.json
    echo "Created .claude/settings.json with the Slasher status line."
    echo "Commit it so the status line travels to everyone who checks the project out."
  else
    echo "You already have a .claude/settings.json."
    echo
    echo "It is not modified here: JSON cannot be safely appended to, and a malformed"
    echo "settings.json silently disables every setting in it. Merge this key into your file"
    echo "yourself. 'statusLine' keeps Slasher's presence on screen. Note that setting it"
    echo "REPLACES any status line you have already configured; leave it out if you would"
    echo "rather keep yours."
    echo
    echo "----------------------------------------------------------------------"
    settings_json
    echo "----------------------------------------------------------------------"
  fi
}

# Assemble the plugin, which carries the skills and the session-start hooks. The script beside
# this one does it, so compile.sh can run the same assembly in the authoring source.
place_plugin() {
  sh "$here/assemble-plugin.sh"
}

# Move a project's waytide/ to slasher/. The system was named Waytide until 2026-11-06, and the
# directory was named for it. A rule change names the new directory but cannot move a project's
# own files, so the installer does it.
#
# It runs before everything else the installer does: a full install would otherwise add a second
# copy of every package under slasher/system/, and every other move below reads slasher/local/.
#
# The same narrow semantics as the moves below: it moves only when waytide/ is present and
# slasher/ absent, and anything else is reported and left alone.
#
# In a git repository the move is committed, because each package's subtree history is keyed by
# its prefix, and migrate_packages adds the packages again under the new one, which needs the move
# in history first. So a tree with uncommitted changes to tracked files is refused. git mv moves
# the tracked files and carries an untracked one along without staging it. Outside a repository,
# and for a waytide/ git does not track, a plain mv.
# Change the project's .gitignore lines that name waytide/ to name slasher/, as part of the move.
# A line that ignores a path under waytide/ stops matching once the folder moves, so what it kept
# out of the repository, such as a journal kept in a repository of its own, would be taken in by
# the next broad add. A leading ! or / is kept. Plain text, so unlike settings.json it is edited.
migrate_gitignore() {
  [ -f .gitignore ] || return 0
  grep -q '^!\{0,1\}/\{0,1\}waytide/' .gitignore || return 0
  sed 's|^\(!\{0,1\}/\{0,1\}\)waytide/|\1slasher/|' .gitignore > .gitignore.tmp
  mv .gitignore.tmp .gitignore
  echo "Changed .gitignore's waytide/ lines to slasher/."
}

migrate_layout() {
  [ -d waytide ] || return 0

  if [ -e slasher ]; then
    echo "Both waytide/ and slasher/ are present — neither is touched."
    echo "waytide/ is the old name. Move its contents into slasher/ and remove it."
    return 0
  fi

  if git rev-parse --is-inside-work-tree > /dev/null 2>&1 &&
     [ -n "$(git ls-files waytide | head -1)" ]; then
    if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
      echo "waytide/ is not moved: the working tree has uncommitted changes to tracked files."
      echo "Commit or stash them, and run the installer again."
      exit 1
    fi
    git mv waytide slasher
    migrate_gitignore
    [ -f .gitignore ] && git add .gitignore
    git commit -q -m "waytide/ is moved to slasher/"
    echo "Moved waytide/ to slasher/, and committed the move — Waytide is renamed Slasher."
  else
    mv waytide slasher
    migrate_gitignore
    echo "Moved waytide/ to slasher/ — Waytide is renamed Slasher."
    echo "Commit the move."
  fi

  # The installer may have been run as waytide/system/foundation/install.sh, so the folder it
  # runs from has just moved.
  case "$here" in
    waytide/*) here="slasher/${here#waytide/}" ;;
    ./waytide/*) here="./slasher/${here#./waytide/}" ;;
  esac
}

# Add each package again under slasher/system/, where it was only ever added under
# waytide/system/. git subtree finds a package's last pull by the prefix its squash commits name,
# so after the move a pull under the new prefix fails with "was never added". Removing the package
# and adding it again writes a squash commit for the new prefix. A package's repository is found
# as update-packages.sh finds it: the README's **Repository:** line, or the path with each
# slash as a dash. Each removal is committed, and the add commits itself.
migrate_packages() {
  [ -d slasher/system ] || return 0
  git rev-parse --is-inside-work-tree > /dev/null 2>&1 || return 0

  packages=$(
    cd slasher/system &&
      find . -mindepth 2 -maxdepth 3 -name README.md |
        sed 's|^\./||; s|/README\.md$||' |
        sort
  )

  for package in $packages; do
    if [ -n "$(git log -1 --format=%H --grep="^git-subtree-dir: slasher/system/$package\$")" ]; then
      continue
    fi
    if [ -z "$(git log -1 --format=%H --grep="^git-subtree-dir: waytide/system/$package\$")" ]; then
      continue
    fi

    repository=$(
      sed -n 's|^[[:space:]]*\*\*Repository:\*\*[[:space:]]*\([A-Za-z0-9._-]*\).*|\1|p' \
        "slasher/system/$package/README.md" 2>/dev/null |
        head -1
    )
    [ -n "$repository" ] || repository=$(printf '%s' "$package" | tr '/' '-')

    # A .DS_Store is ignored, so git rm leaves it, and the folder with it, and git subtree add
    # then refuses a prefix that exists. Finder writes it, and it holds nothing of the package's.
    find "slasher/system/$package" -name .DS_Store -delete
    git rm -r -q "slasher/system/$package"
    git commit -q -m "$package is removed, to be added again under slasher/system/"
    if [ -e "slasher/system/$package" ]; then
      echo "slasher/system/$package still holds files git does not track:"
      find "slasher/system/$package" -type f
      echo "Move or remove them, and run the installer again."
      exit 1
    fi
    git subtree add -q --prefix "slasher/system/$package" "$origin/$repository.git" master --squash
    echo "Added $package again under slasher/system/, so a refresh finds it."
  done
}

# Move this machine's waytide folders to the slasher names: the configuration under ~/.config,
# which holds the project registry and the writer's name, and the data under ~/.local/share,
# which holds the private journals. The folders were named for Waytide until 2026-11-06.
#
# The same narrow semantics as the project's move: each folder moves only where the old one is
# present and the new one absent, and anything else is reported and left alone. The folders are
# outside the repository, so nothing is left to commit.
migrate_machine() {
  config_home=$HOME/.config
  data_home=$HOME/.local/share

  for base in "$config_home" "$data_home"; do
    old_dir="$base/waytide"
    new_dir="$base/slasher"

    [ -d "$old_dir" ] || continue

    if [ -e "$new_dir" ]; then
      echo "Both $old_dir/ and $new_dir/ are present — neither is touched."
      echo "$old_dir/ is the old name. Move its contents into $new_dir/ and remove it."
      continue
    fi

    mv "$old_dir" "$new_dir"
    echo "Moved $old_dir/ to $new_dir/ — Waytide is renamed Slasher."
  done
}

# Rename a project's slasher/local/sessions/ to slasher/local/work-sessions/. The
# directory carried the bare name sessions/ until 2026-07-30, when it was renamed for
# what a session is here — a work session. A rule change names the new directory but
# cannot move a project's own files, so the installer does it.
#
# This is the ONLY place the installer touches slasher/local/, a project's own working
# state, and it stays narrow accordingly: it moves only when the old directory is
# present and the new one is absent, so there is exactly one reading of what should
# happen. Anything else is reported and left alone — an installer guessing at a merge
# of two directories of records is worse than a engineer doing it deliberately. The
# move is a plain mv rather than git mv, which would fail on records that were never
# committed; git detects the rename when the engineer commits it.
migrate_work_sessions() {
  old_dir="$own/sessions"
  new_dir="$own/work-sessions"

  if [ ! -d "$old_dir" ]; then
    return 0
  fi

  if [ -d "$new_dir" ]; then
    echo "Both $own/sessions/ and $own/work-sessions/ are present — neither is touched."
    echo "$own/sessions/ is the old name. Move its records into work-sessions/ and remove it."
    return 0
  fi

  mv "$old_dir" "$new_dir"
  echo "Renamed $own/sessions/ to $own/work-sessions/."
  echo "Commit the rename."
}

# Move a project's contemporaneous, historical records under slasher/local/logs/. The log, the loop
# records, and the work session records sat directly under slasher/local/ until
# 2026-08-18, beside the directories that state what is currently true. The
# the-logs-directory-holds-the-contemporaneous-historical-records rule groups them, and a rule cannot move a project's own files.
#
# This runs after migrate_work_sessions, so a project still holding the pre-2026-07-30
# name reaches slasher/local/logs/work-sessions/ in two steps rather than needing a
# third case here.
#
# It keeps the same narrow semantics: each directory moves only when the old location is
# present and the new one is absent. Anything else is reported and left alone. Plain mv
# rather than git mv, for records that were never committed.
migrate_logs() {
  for name in log loops work-sessions; do
    old_dir="$own/$name"
    new_dir="$own/logs/$name"

    [ -d "$old_dir" ] || continue

    if [ -d "$new_dir" ]; then
      echo "Both $old_dir/ and $new_dir/ are present — neither is touched."
      echo "$old_dir/ is the old location. Move its records into $new_dir/ and remove it."
      continue
    fi

    mkdir -p "$own/logs"
    mv "$old_dir" "$new_dir"
    echo "Moved $old_dir/ to $new_dir/ — the contemporaneous, historical records are grouped under logs/."
    echo "Commit the move."
  done
}

# Rename a project's slasher/local/ideas/ to slasher/local/items/. The record kind was
# called an idea until 2026-10-21, and the directory was named for it. A rule change names
# the new directory but cannot move a project's own files, so the installer does it.
#
# The same narrow semantics as the migrations above: it moves only when the old directory
# is present and the new one absent, and anything else is reported and left alone. Plain mv
# rather than git mv, for records that were never committed. Each moved record that carries
# no tag is then tagged [idea].
migrate_items() {
  old_dir="$own/ideas"
  new_dir="$own/items"

  [ -d "$old_dir" ] || return 0

  if [ -d "$new_dir" ]; then
    echo "Both $old_dir/ and $new_dir/ are present — neither is touched."
    echo "$old_dir/ is the old name. Move its records into $new_dir/ and remove it."
    return 0
  fi

  mv "$old_dir" "$new_dir"

  # An item that carries no tag takes [idea], per the the-items-directory-holds-one-file-per-item: a Tags line is added under
  # its State line. A record that already has a Tags line is untouched.
  for record in "$new_dir"/*.md; do
    [ -f "$record" ] || continue
    awk '
      /\*\*Tags:\*\*/ { tagged = 1 }
      { line[NR] = $0 }
      /\*\*State:\*\*/ && !state { state = NR }
      END {
        for (i = 1; i <= NR; i++) {
          print line[i]
          if (i == state && !tagged) print "- **Tags:** [idea]"
        }
      }
    ' "$record" > "$record.tmp" && mv "$record.tmp" "$record"
  done

  echo "Moved $old_dir/ to $new_dir/ — the record kind is now called an item."
  echo "Commit the move."
}

# Carry a project's observations from the state Stated to Recorded. An observation's one state
# was Stated until 2026-10-28, and its filename ended -STATED. A rule change names the new word
# but cannot rename a project's own files, so the installer does it.
#
# The same narrow semantics as the migrations above: each observation moves only when its new
# name is absent, and a clash is reported and left alone. Plain mv rather than git mv, for
# records that were never committed. This runs after migrate_items, so an observation still in
# slasher/local/ideas/ is moved into items/ first.
migrate_observation_state() {
  items_dir="$own/items"

  [ -d "$items_dir" ] || return 0

  migrated=0
  for stated in "$items_dir"/*-STATED.md; do
    [ -f "$stated" ] || continue
    recorded="${stated%-STATED.md}-RECORDED.md"

    if [ -e "$recorded" ]; then
      echo "Both $stated and $recorded are present — neither is touched."
      echo "The -STATED file is the old name. Reconcile the two and remove it."
      continue
    fi

    sed 's/^\(- \)\{0,1\}\*\*State:\*\* Stated$/\1**State:** Recorded/' "$stated" > "$recorded"
    rm "$stated"
    migrated=$((migrated + 1))
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Renamed $migrated observation(s) from -STATED to -RECORDED — an observation's state is now Recorded."
    echo "Commit the rename."
  fi
}

# Retag a project's observation items as notes. An item tagged [observation] became a
# note on 2026-11-11, and a rule change cannot retag a project's own files, so the
# installer does it. Only the Tags line changes, and the filename keeps -RECORDED.
migrate_note_tag() {
  items_dir="$own/items"

  [ -d "$items_dir" ] || return 0

  migrated=0
  for item in "$items_dir"/*.md; do
    [ -f "$item" ] || continue
    grep -q '^\(- \)\{0,1\}\*\*Tags:\*\*.*\[observation\]' "$item" || continue

    sed '/^\(- \)\{0,1\}\*\*Tags:\*\*/s/\[observation\]/[note]/' "$item" > "$item.tmp"
    mv "$item.tmp" "$item"
    migrated=$((migrated + 1))
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Retagged $migrated item(s) from [observation] to [note] — an observation item is now a note."
    echo "Commit the change."
  fi
}

# Retag a project's work items [work]. A piece of work to be done was tagged [work-item] until
# 2026-10-29, and the engineer settled then that the installer converts a project's items. Only the
# Tags line changes. The same narrow semantics as migrate_note_tag.
migrate_work_tag() {
  items_dir="$own/items"
  [ -d "$items_dir" ] || return 0

  migrated=0
  for item in "$items_dir"/*.md; do
    [ -f "$item" ] || continue
    grep -q '^\(- \)\{0,1\}\*\*Tags:\*\*.*\[work-item\]' "$item" || continue
    sed '/^\(- \)\{0,1\}\*\*Tags:\*\*/s/\[work-item\]/[work]/' "$item" > "$item.tmp"
    mv "$item.tmp" "$item"
    migrated=$((migrated + 1))
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Retagged $migrated item(s) from [work-item] to [work]."
    echo "Commit the change."
  fi
}

# Make a project's Open notes Recorded. A note's one state is Recorded, but an observation could
# be Open before observations became notes on 2026-11-11, and migrate_note_tag retags it without
# touching its state. So an item tagged [note] whose file ends -OPEN is renamed -RECORDED, and its
# State line changes with it. The same narrow semantics as migrate_observation_state.
migrate_note_state() {
  items_dir="$own/items"
  [ -d "$items_dir" ] || return 0

  migrated=0
  for open in "$items_dir"/*-OPEN.md; do
    [ -f "$open" ] || continue
    grep -q '^\(- \)\{0,1\}\*\*Tags:\*\*.*\[note\]' "$open" || continue
    recorded="${open%-OPEN.md}-RECORDED.md"
    if [ -e "$recorded" ]; then
      echo "Both $open and $recorded are present — neither is touched."
      continue
    fi
    sed 's/^\(\(- \)\{0,1\}\*\*State:\*\*\) Open$/\1 Recorded/' "$open" > "$recorded"
    rm "$open"
    migrated=$((migrated + 1))
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Made $migrated note(s) Recorded — a note's one state."
    echo "Commit the change."
  fi
}

# Make a project's Done items Completed. A work item and a rework item concluded Done until
# 2026-11-14, when Completed, the word a feature and an experiment conclude with, took its place.
# So an item whose file ends -DONE is renamed -COMPLETED, and its State line changes with it. The
# same narrow semantics as migrate_note_state.
migrate_work_state() {
  items_dir="$own/items"
  [ -d "$items_dir" ] || return 0

  migrated=0
  for done in "$items_dir"/*-DONE.md; do
    [ -f "$done" ] || continue
    completed="${done%-DONE.md}-COMPLETED.md"
    if [ -e "$completed" ]; then
      echo "Both $done and $completed are present — neither is touched."
      continue
    fi
    sed 's/^\(\(- \)\{0,1\}\*\*State:\*\*\) Done$/\1 Completed/' "$done" > "$completed"
    rm "$done"
    migrated=$((migrated + 1))
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Made $migrated item(s) Completed — a work item's concluding state, which was Done."
    echo "Commit the change."
  fi
}

# Take the state out of a project's record file names. An item's or an implementation record's
# file name ended with its state in upper case, as -OPEN or -COMPLETED, until 2026-11-16, so a
# state change renamed the file and broke every link to it. The State line is the only statement
# of the state, and a rule change cannot rename a project's own files, so the installer does it.
# A name is lower-case, so a last segment in upper case is the state.
#
# The same narrow semantics as the migrations above: a record moves only when its new name is
# absent, and a clash is reported and left alone. Its content does not change. This runs after
# them, since each of them finds a record by its suffix.
migrate_record_names() {
  migrated=0
  for directory in "$own/items" "$own/implementations" "$own/progressions"; do
    [ -d "$directory" ] || continue
    for suffixed in "$directory"/*-*.md; do
      [ -f "$suffixed" ] || continue
      name=$(printf '%s\n' "$suffixed" | sed -n 's/-[A-Z][A-Z]*\.md$/.md/p')
      [ -n "$name" ] || continue
      # Two names that differ only in their state would take one name. Neither is moved.
      stem=${name%.md}
      siblings=0
      for sibling in "$stem"-*.md; do
        case ${sibling#"$stem"-} in
          *[!A-Z]*.md|.md) ;;
          *) siblings=$((siblings + 1)) ;;
        esac
      done
      if [ "$siblings" -gt 1 ]; then
        echo "More than one $stem-<STATE>.md is present — none is touched."
        echo "Reconcile them, and keep one."
        continue
      fi
      if [ -e "$name" ]; then
        echo "Both $suffixed and $name are present — neither is touched."
        echo "The name ending in a state is the old name. Reconcile the two and remove it."
        continue
      fi
      mv "$suffixed" "$name"
      migrated=$((migrated + 1))
    done
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Renamed $migrated record(s) without the state at the end of the name — the State line alone holds it."
    echo "Commit the rename."
  fi
}

# Carry a project's records to the named datetime formats. The dates-and-times-are-written-in-named-
# formats rule settled on 2026-11-22 that a record's title carries no date, that a journal entry
# carries no datetime line under its title, and that a footer line is 24-hour. A rule change cannot
# reach a project's own records, so the installer does, and within a migration the migration rule
# permits it to conform historical records.
#
# It drops the date from a work session record's title, as `(Sat Nov 21 2026 18:01)`,
# `(Sat Nov 21 2026)`, or `(2026-07-26)`, and keeps the word Session where an old title has it. It
# drops the datetime line under a journal entry's title, as `Sat Nov 21 2026 at 18:01`, with the
# blank line after it. It converts a footer line in the 12-hour form with seconds, as
# `5:52:41 PM PT`, to 24-hour, as `17:52:41 PT`, in every record. A footer line that stops at the
# hour has no minutes or seconds to convert, and is left as written. Nothing else in a record
# changes, and a journal file name is not renamed.
migrate_datetimes() {
  [ -d "$own" ] || return 0
  changed=$(mktemp)

  sessions="$own/logs/work-sessions"
  if [ -d "$sessions" ]; then
    for record in "$sessions"/*.md; do
      [ -f "$record" ] || continue
      title=$(sed -n 1p "$record")
      dateless=$(printf '%s\n' "$title" | sed -E 's/^(# (Work )?Session — .*) \(([A-Z][a-z][a-z] [A-Z][a-z][a-z] [0-9][0-9]? [0-9][0-9][0-9][0-9]( [0-9][0-9]:[0-9][0-9])?|[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9])\)$/\1/')
      [ "$dateless" != "$title" ] || continue
      { printf '%s\n' "$dateless"; sed 1d "$record"; } > "$record.tmp"
      mv "$record.tmp" "$record"
      echo "$record" >> "$changed"
    done
  fi

  for entry in "$own"/journal/*/*.md; do
    [ -f "$entry" ] || continue
    awk '
      NR == 3 && /^[A-Z][a-z][a-z] [A-Z][a-z][a-z] [0-9][0-9]? [0-9][0-9][0-9][0-9]( at [0-9][0-9]:[0-9][0-9])?$/ { dropped = 1; next }
      NR == 4 && dropped && /^$/ { next }
      { print }
    ' "$entry" > "$entry.tmp"
    if cmp -s "$entry" "$entry.tmp"; then
      rm "$entry.tmp"
    else
      mv "$entry.tmp" "$entry"
      echo "$entry" >> "$changed"
    fi
  done

  find "$own" -name '*.md' -type f | while IFS= read -r record; do
    awk '
      /^(Authored|Changed) by .* on [A-Z][a-z][a-z] [A-Z][a-z][a-z] [0-9][0-9]? [0-9][0-9][0-9][0-9] at [0-9][0-9]?:[0-9][0-9]:[0-9][0-9] (AM|PM) [A-Z]+$/ {
        n = split($0, word, " ")
        split(word[n - 2], part, ":")
        hour = part[1] + 0
        if (word[n - 1] == "AM" && hour == 12) hour = 0
        if (word[n - 1] == "PM" && hour != 12) hour = hour + 12
        line = word[1]
        for (i = 2; i <= n - 3; i++) line = line " " word[i]
        printf "%s %02d:%s:%s %s\n", line, hour, part[2], part[3], word[n]
        next
      }
      { print }
    ' "$record" > "$record.tmp"
    if cmp -s "$record" "$record.tmp"; then
      rm "$record.tmp"
    else
      mv "$record.tmp" "$record"
      echo "$record" >> "$changed"
    fi
  done
  migrated=$(sort -u "$changed" | wc -l | tr -d ' ')
  rm "$changed"

  if [ "$migrated" -gt 0 ]; then
    echo "Carried $migrated record(s) to the named datetime formats: no date in a work session title, no datetime line in a journal entry, and 24-hour footer lines."
    echo "Commit the change."
  fi
}

# Carry a project's implementations to progressions. Progression replaced implementation on
# 2026-11-20 as the name of a bounded piece of work on its own branch, and its file became a
# progression record. A rule change cannot reach a project's own records, so the installer does,
# and within a migration the migration rule permits it to conform historical records.
#
# It acts only on forms whose sense is the record, since a script cannot tell the record sense
# from the other, the code that satisfies a test, in a sentence. implementations/ moves to
# progressions/ only where progressions/ is absent, and a clash is reported and left alone. In
# every record except the journal's, implementations/, the Implementation branch line, and
# implementation record change, and an item's Implementation state and Implementation line
# change. A log entry named for the Implementation state is renamed, only where the new name
# is absent. Plain mv rather than git mv, for records that were never committed.
migrate_progressions() {
  old_dir="$own/implementations"
  new_dir="$own/progressions"

  if [ -d "$old_dir" ]; then
    if [ -d "$new_dir" ]; then
      echo "Both $old_dir/ and $new_dir/ are present — neither is touched."
      echo "$old_dir/ is the old name. Move its records into $new_dir/ and remove it."
      return 0
    fi
    mv "$old_dir" "$new_dir"
    echo "Moved $old_dir/ to $new_dir/ — an implementation is now called a progression."
  fi

  [ -d "$own" ] || return 0

  conformed=0
  records=$(mktemp)
  find "$own" -name '*.md' -not -path "$own/journal/*" > "$records" 2>/dev/null || true
  # Read from the file rather than a pipe, so the count is not lost in a subshell, and a path
  # with a space in it is read whole.
  while IFS= read -r record; do
    sed \
      -e 's|implementations/|progressions/|g' \
      -e 's/^\(- \)\{0,1\}\*\*Implementation branch:\*\*/\1**Progression branch:**/' \
      -e 's/^\(- \)\{0,1\}\*\*Implementation:\*\*/\1**Progression:**/' \
      -e 's/^\(\(- \)\{0,1\}\*\*State:\*\*\) Implementation$/\1 Progression/' \
      -e 's/\([Aa]\)n \([Ii]mplementation records\{0,1\}\)/\1 \2/g' \
      -e 's/\([Ii]\)mplementation \(records\{0,1\}\)/\1MPL_PROGRESSION \2/g' \
      -e 's/iMPL_PROGRESSION/progression/g; s/IMPL_PROGRESSION/Progression/g' \
      "$record" > "$record.tmp"
    if cmp -s "$record" "$record.tmp"; then
      rm "$record.tmp"
    else
      mv "$record.tmp" "$record"
      conformed=$((conformed + 1))
    fi
  done < "$records"
  rm -f "$records"

  renamed=0
  if [ -d "$own/logs/log" ]; then
    for entry in "$own/logs/log"/*-is-implementation.md "$own/logs/log"/*-reaches-implementation.md "$own/logs/log"/*-takes-implementation.md; do
      [ -f "$entry" ] || continue
      name="${entry%-implementation.md}-progression.md"
      if [ -e "$name" ]; then
        echo "Both $entry and $name are present — neither is touched."
        continue
      fi
      mv "$entry" "$name"
      renamed=$((renamed + 1))
    done
  fi

  if [ "$conformed" -gt 0 ] || [ "$renamed" -gt 0 ]; then
    echo "Conformed $conformed record(s) and renamed $renamed log entr(ies) to say progression."
    echo "Commit the change."
  fi
}

# An email account's configuration was a slasher-email.toml in its own folder, email/<name>/, or
# email/<host>/<login>/ for an account with no name. A project now lists the accounts it uses in
# one email/slasher-email.toml, an [[account]] table to each, and an account it does not list is
# neither fetched nor sent through. So each account's file is folded into the one file, its
# [imap] and [smtp] tables becoming [account.imap] and [account.smtp], and the account's file is
# removed. It runs only where the one file is absent. An account the project fetched with no
# file of its own is not listed, and is not fetched until it is. The private store's account
# files are not moved, and are reported.
migrate_email_configuration() {
  directory="$own/email"
  target="$directory/slasher-email.toml"
  if [ -d "$directory" ]; then
    found=$(cd "$directory" && find . -mindepth 2 -maxdepth 3 -name slasher-email.toml | sed 's|^\./||; s|/slasher-email\.toml$||' | sort)
  else
    found=
  fi
  if [ -n "$found" ]; then
    if [ -e "$target" ]; then
      echo "Both $target and an account's own slasher-email.toml in $directory are present — none is folded in."
      echo "Move each account's tables into $target as an [[account]] table, and remove its file."
    else
      count=0
      for name in $found; do
        {
          printf '[[account]]\nname = "%s"\n\n' "$name"
          sed -E -e 's/^\[\[(imap|smtp)\./[[account.\1./' \
              -e 's/^\[(imap|smtp)\]/[account.\1]/' \
              -e 's/^\[(imap|smtp)\./[account.\1./' \
              "$directory/$name/slasher-email.toml"
          printf '\n'
        } >> "$target"
        rm "$directory/$name/slasher-email.toml"
        count=$((count + 1))
      done
      echo "Folded the email configuration of $count account(s) into $target, an [[account]] table each."
      echo "Only the accounts it lists are fetched. Commit the change."
    fi
  fi

  private="$HOME/.local/share/slasher/email/$(basename "$PWD")"
  if [ -d "$private" ] && [ -n "$(cd "$private" && find . -mindepth 2 -maxdepth 3 -name slasher-email.toml)" ]; then
    echo "$private holds an account's own slasher-email.toml, which is no longer read."
    echo "Move each account's tables into $private/slasher-email.toml as an [[account]] table."
  fi
}

# 0. Print the bootstrap section and stop. Nothing is installed and nothing is placed,
#    so this is safe to run anywhere, including from the authoring source. It exists so
#    update-packages.sh can compare a project's AGENTS.md against the current text
#    without parsing this script's source.
if [ "$1" = "bootstrap" ]; then
  bootstrap
  exit 0
fi

# migrate runs only the migrations: the record migrations, and the replacement of an AGENTS.md
# section that is Slasher's alone. update-packages.sh runs it after a pull, with the installer it
# just pulled, so one update brings both the new packages and their migrations. It asks nothing,
# places nothing a project has not got, and prints only what it changed.
migrate_only=no
[ "$1" = "migrate" ] && migrate_only=yes

# --append-agents-md answers in advance the question asked where the project already has an
# AGENTS.md: append the bootstrap to it.
append_agents_md=no
agents_md_unanswered=no
for argument in "$@"; do
  case $argument in
    --append-agents-md) append_agents_md=yes ;;
  esac
done

# Carry a project's waytide/ to slasher/ before anything reads or writes either.
migrate_layout
migrate_machine

# 1. Install (or refresh) the foundation rules — skipped in agents-md-only and migrate modes.
if [ "$1" != "agents-md" ] && [ "$migrate_only" = no ]; then
  migrate_packages
  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi
  git subtree pull --prefix "$prefix" "$repo" master --squash
fi

# 2. Ensure the project-root AGENTS.md activates the system, that CLAUDE.md
#    imports it so the bootstrap also reaches Claude Code sessions, that the plugin
#    prints the startup display and the session-start notice, and that
#    .claude/settings.json keeps the status line.
#    In migrate mode only the AGENTS.md migration runs, and it asks nothing.
if [ "$migrate_only" = yes ]; then
  place_agents_md
else
  place_slasher_md
  place_agents_md
  place_claude_md
  place_settings_json
  place_plugin
  warn_ignored_claude_files
fi

# 3. Carry a project's own working state across the directory renames a rule change
#    cannot reach.
#    They act on the project's local directory, where local-directory.sh says. Where it fails, as
#    for a relocated directory that does not exist, its message is printed and no migration runs.
#    An installer run where the installed foundation predates local-directory.sh acts on
#    slasher/local, the only place the directory could then be.
if [ ! -x slasher/system/foundation/local-directory.sh ]; then
  own=slasher/local
  migrations=yes
elif own=$(slasher/system/foundation/local-directory.sh); then
  migrations=yes
else
  migrations=no
fi
if [ "$migrations" = yes ]; then
  migrate_work_sessions
  migrate_logs
  migrate_items
  migrate_observation_state
  migrate_note_tag
  migrate_note_state
  migrate_work_tag
  migrate_work_state
  migrate_record_names
  migrate_progressions
  migrate_email_configuration
  migrate_datetimes
fi

# 4. An existing AGENTS.md left unchanged because no one was there to answer leaves the rules
#    unloaded, so the run says so last, where it is seen, and fails.
if [ "$agents_md_unanswered" = yes ]; then
  echo
  echo "AGENTS.md was NOT modified, so Slasher's rules will not load."
  echo "Run it again with --append-agents-md to append the bootstrap,"
  echo "or in a terminal to be asked."
  exit 1
fi
