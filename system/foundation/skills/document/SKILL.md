---
name: document
description: Write, read, list, or move a private document, kept for the project outside its repository.
argument-hint: "[new | read | list | move | help]"
disable-model-invocation: true
---

The engineer typed `/document $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rule that governs private documents. From the project root, run `slasher/system/foundation/load-rules.sh private-documents-are-kept-outside-the-repository`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Read the first word typed as the subcommand. The words after it are its arguments.
4. **`new`**: write a private document. The words after it are what it says, or its name and what it says. Where none were typed, ask what it says.
5. **`read`**: read the private document the words after it name. Where none is named, or the name matches more than one, ask which, through the selection interface.
6. **`list`**: list the project's private documents, by name.
7. **`move`**: move the private document the words after it name into the project, after the engineer confirms it, as the rule requires.
8. Nothing typed, or any other first word, is not guessed at. Say which subcommands this command takes, and ask which is meant, through the selection interface, in these groups, then again within the group selected:
   - **Write:** `new`
   - **Read:** `read`, `list`
   - **Move:** `move`
   - **Help:** `help`
