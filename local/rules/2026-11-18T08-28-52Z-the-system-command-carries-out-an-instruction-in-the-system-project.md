# The `/system` command carries out an instruction in the machine's system project

**As the engineer stated it:** I want to send commands from this project to the system project using the /system command. That's a local rule.

1. `/system <instruction>` carries out the instruction in this machine's system project, from this project. It does what `/projects -system <instruction>` does.
2. Follow the projects-lists-the-registry-and-carries-out-an-instruction-in-another-project rule, with `-system` as the target. That rule finds the system project's root, loads its rules, and says how the instruction is carried out there.
3. A bare `/system`, with no instruction, prints the system project's root and acts on nothing.
4. `/system help` says that `/system` is this project's form of `/projects -system`, and that `/projects help` prints the help of its command. It does nothing more.
5. The command's skill is `.claude/skills/system/SKILL.md`, a project skill beside the Slasher plugin. The plugin build replaces `.claude/skills/slasher/` and leaves other skills in `.claude/skills/` as they are.

## What it reaches

1. This rule reaches this repository only. It is not a `foundation` rule, and `/system` is not a Slasher command. A Slasher project uses `/projects -system`.
2. `/system` adds no row to the command table and no part to the Slasher help.

**Why:** the engineer sends instructions to the system project from this project often enough that a short command is justified.

**How to apply:** when the engineer types `/system`, read the words after it as the instruction, and carry it out in the system project as `/projects -system` does.

---

Authored by Scott Bellware on Wed Nov 18 2026 at 12:28:52 AM PT
