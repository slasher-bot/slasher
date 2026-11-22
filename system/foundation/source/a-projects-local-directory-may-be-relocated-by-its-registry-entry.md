# A project's local directory may be relocated by its registry entry

1. `slasher/local/` in every rule means the project's local directory, wherever it is.
2. By default it is `slasher/local/` in the project, or `local/` in the Slasher authoring source.
3. A project's entry in `~/.config/slasher/projects.toml` may relocate it with the key `local`, as `local = "~/records/checkout"`. A leading `~` is the home directory, and a relative path is read from the project's root.
4. Find the directory with `slasher/system/foundation/local-directory.sh`, run from the project's root. Every Slasher script finds it the same way, and the session-start instruction names it.
5. A configured directory that does not exist stops with an error that names it. Nothing falls back to the default.
6. Every worktree of a project uses the one relocated directory. Write a record once, there. No merge acts on it, and no record is written on `master` and then again on a branch.
7. Commit a record in the git repository that holds the relocated directory. Where no git repository holds it, the record is not committed, and say so in the reply that wrote it.

**As the engineer stated it:** A project's local directory can be located in any directory. When the local directory is not in its default location, it's configured in the project registry.

**Why:** a project's own records need not live inside the project, as in a content project whose records belong elsewhere. The registry is per machine and outside every repository, so it can say where they are without the project naming that place.

**How to apply:** where a rule names `slasher/local/…`, read it as the directory `local-directory.sh` prints. Write records there, and commit them in the repository that holds it, where one does.

Related:

- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — what the local directory holds
- the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule — the per-machine configuration outside the repository
- the a-progression-runs-on-a-branch-to-a-declared-end rule — where a record is first written, which a relocated directory changes

---

Authored by Scott Bellware on Mon Nov 16 2026 at 20:50:16 PT
Changed by Scott Bellware on Fri Nov 20 2026 at 00:24:11 PT
