#!/bin/sh
# Assemble the Slasher plugin, named slasher, in .claude/skills/slasher/.
#
# Run from the project root:
#
#   slasher/system/foundation/assemble-plugin.sh     in a Slasher project
#   system/foundation/assemble-plugin.sh             in the Slasher authoring source
#
# install.sh runs it in a Slasher project, and compile.sh runs it in the authoring source.
#
# The plugin is foundation's plugin/ directory, which holds its manifest and its session-start
# hooks, with each active package's skills under skills/, each as skills/<command>/ in its package.
# The plugin is assembled, never edited: a skill is changed in its package, so the directory is
# rebuilt whole each time and nothing in it is kept.
set -e

# Locate the system and the project's own directory: slasher/ in a Slasher project, the root
# in the Slasher authoring source. Checked in that order — a Slasher project may have a
# system/ directory of its own.
if [ -d slasher/system ]; then
  system=slasher/system
else
  system=system
fi

plugin=.claude/skills/slasher

[ -d "$system/foundation/plugin" ] || exit 0

# The project's own directory is where local-directory.sh says. An installed foundation that
# predates the script keeps it in slasher/local, or local in the authoring source.
if [ -x "$system/foundation/local-directory.sh" ]; then
  local=$("$system/foundation/local-directory.sh")
elif [ "$system" = slasher/system ]; then
  local=slasher/local
else
  local=local
fi

# A deactivated package's skills go with it. The packages are read from the latest package set's
# Inactive line, as load-rules.sh reads them.
declaration=$(ls "$local"/*-package-set.md 2>/dev/null | sort | tail -1)
deactivated=
if [ -n "$declaration" ]; then
  deactivated=$(sed -n 's|^[[:space:]]*-\{0,1\}[[:space:]]*\*\*Inactive:\*\*[[:space:]]*\(.*\)$|\1|p' "$declaration" |
    head -1 | tr ',' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' | grep -v '^none$' || true)
fi

rm -rf "$plugin"
mkdir -p .claude/skills
cp -R "$system/foundation/plugin" "$plugin"

for skill in "$system"/*/skills/*/; do
  [ -f "${skill}SKILL.md" ] || continue
  package=${skill#"$system"/}
  package=${package%%/*}
  if printf '%s\n' "$deactivated" | grep -qx "$package"; then
    continue
  fi
  mkdir -p "$plugin/skills"
  cp -R "${skill%/}" "$plugin/skills/"
done

# The full help a bare /slasher prints: the header, then each skill's help in the order
# help-order lists, then any skill the list does not name, in name order. An alias carries no
# help.md of its own, so it adds nothing. The header and the list are what the help is built
# from, not part of the plugin, so they are removed once it is written.
if [ -f "$plugin/help-header.md" ] && [ -f "$plugin/help-order" ]; then
  {
    cat "$plugin/help-header.md"
    listed=" "
    while IFS= read -r name; do
      [ -n "$name" ] || continue
      listed="$listed$name "
      [ -f "$plugin/skills/$name/help.md" ] || continue
      echo
      cat "$plugin/skills/$name/help.md"
    done < "$plugin/help-order"
    for help in "$plugin"/skills/*/help.md; do
      [ -f "$help" ] || continue
      name=${help%/help.md}
      name=${name##*/}
      case "$listed" in *" $name "*) continue ;; esac
      echo
      cat "$help"
    done
  } > "$plugin/help.md"
fi

# The command table /command-table prints: the header's rows, then each skill's rows in the order
# help-order lists, then the rows of any skill the list does not name, in name order, then the
# help line. A skill carries its domain's rows in command-table-rows.md, so a package that is not
# active adds none.
if [ -f "$plugin/command-table-header.md" ] && [ -f "$plugin/help-order" ]; then
  {
    cat "$plugin/command-table-header.md"
    listed=" "
    while IFS= read -r name; do
      [ -n "$name" ] || continue
      listed="$listed$name "
      [ -f "$plugin/skills/$name/command-table-rows.md" ] || continue
      cat "$plugin/skills/$name/command-table-rows.md"
    done < "$plugin/help-order"
    for rows in "$plugin"/skills/*/command-table-rows.md; do
      [ -f "$rows" ] || continue
      name=${rows%/command-table-rows.md}
      name=${name##*/}
      case "$listed" in *" $name "*) continue ;; esac
      cat "$rows"
    done
    echo
    echo "Type /help for all of Slasher's help, or /<command> help for one command's."
  } > "$plugin/command-table.md"
fi

# The startup table the session-start read prints: its own rows, then a sentence naming, in the
# command table's order, every command whose name the startup rows leave out, then the help line.
# A shortcut alias whose name starts with no letter is left out of the sentence too. A shortcut
# alias whose name starts with a letter, as the shortcuts table lists it, stands in parentheses
# after its row's command, as `/commit (/c)`, rather than as a command of its own.
if [ -f "$plugin/command-table-startup.md" ] && [ -f "$plugin/command-table.md" ]; then
  startup=$(cat "$plugin/command-table-startup.md")
  shown=$(printf '%s\n' "$startup" | awk -F'|' 'NR > 2 { print $2 }' | tr ',' '\n' | tr -d ' `')
  shortcuts=""
  if [ -f "$plugin/shortcuts.md" ]; then
    shortcuts=$(awk -F'|' 'NR > 2 && /^\|/ { print $2 }' "$plugin/shortcuts.md" | tr ',' '\n' | tr -d ' `')
  fi
  others=$(SHOWN="$shown" SHORTCUTS="$shortcuts" awk -F'|' '
    BEGIN {
      count = split(ENVIRON["SHOWN"], list, "\n")
      for (i = 1; i <= count; i++) is_shown[list[i]] = 1
      count = split(ENVIRON["SHORTCUTS"], list, "\n")
      for (i = 1; i <= count; i++) is_shortcut[list[i]] = 1
    }
    NR > 2 && /^\|/ {
      count = split($2, cell, ",")
      command = ""; aliases = ""; listed = ""
      for (i = 1; i <= count; i++) {
        name = cell[i]
        gsub(/`/, "", name); sub(/^[[:space:]]+/, "", name); sub(/[[:space:]]+$/, "", name)
        key = name; gsub(/ /, "", key)
        if (name !~ /^\/[A-Za-z]/) continue
        if ((key in is_shortcut) && command != "") {
          aliases = aliases (aliases == "" ? "" : ", ") name
        } else if (command == "") {
          command = name; command_key = key
        } else if (!(key in is_shown)) {
          listed = listed name "\n"
        }
      }
      if (command != "" && !(command_key in is_shown)) {
        print command (aliases == "" ? "" : " (" aliases ")")
      }
      printf "%s", listed
    }' "$plugin/command-table.md")
  sentence=$(printf '%s\n' "$others" | awk '
    NF == 0 { next }
    { names[++n] = "`" $0 "`" }
    END {
      if (n == 0) exit
      line = "The other commands are "
      for (i = 1; i <= n; i++) {
        if (i > 1) line = line (n == 2 ? " " : ", ")
        if (i == n && n > 1) line = line "and "
        line = line names[i]
      }
      print line "."
    }')
  {
    printf '%s\n' "$startup"
    if [ -n "$sentence" ]; then
      echo
      printf '%s\n' "$sentence"
    fi
    echo
    echo "Type /help for all of Slasher's help, or /<command> help for one command's."
  } > "$plugin/command-table-startup.md"
fi

# The header, the list, and each skill's rows are what the help and the table are built from, not
# part of the plugin, so they are removed once both are written.
rm -f "$plugin/help-header.md" "$plugin/help-order" "$plugin/command-table-header.md"
rm -f "$plugin"/skills/*/command-table-rows.md
