# Slasher's plugin passes `claude plugin validate`, and would not pass the directory's pre-submission checks

The publish-to-marketplace feature checked the plugin against Anthropic's plugin pre-submission checklist, at https://claude.com/docs/plugins/pre-submission-checklist, and the submission page, at https://claude.com/docs/plugins/submit.

Four findings would block submission. The skill folders `?` and `next?` have names Windows does not allow, which stops validation. The plugin folder has no README of at least 40 words, and no license. The hooks run `slasher/system/` scripts in the project, where every file a hook uses must be inside the plugin folder. The hook scripts' use of `$CLAUDE_PROJECT_DIR` and their calls to other files would also hold each version for a reviewer.

The plugin's 89 files are all text, under 256 KiB, with no symbolic links. Every skill has a description, and the name `slasher` is acceptable. The missing icon, author, and version are warnings only, and a version is optional. A plugin may fetch code where its README says so, and a script a skill only tells Claude to run is outside the script check. The directory follows a tracked branch or tag and checks each new commit, so one publish can reach both the directory and Slasher's own marketplace.
