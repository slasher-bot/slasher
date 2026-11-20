PROGRESSIONS
  A progression is a bounded piece of work on its own branch or worktree, to a
  declared end. These commands create one with no kind, and list the current
  progressions of every kind: features, experiments, and those with no kind.

  /progression new                 Create its branch and an Open record,
                                   titled Progression — <name>
  /progression new with phases     Create it, asking for its phases
  /progression status [<progression>]
                                   Phases, state, what exists, and
                                   what is left
  /progression start               Open -> Active, or, where none is
                                   Open, create one Active
  /progression complete            -> Completed, or asks which state
                                   where there is a forecast
  /progression affirm, refute, inconclusive
                                   -> the verdict (affirm is the
                                   engineer's declaration only)
  /progression defer, suspend, discontinue, obsolete, supersede, abandon
                                   -> that state
  /progression resume              Any state but Open or Active -> Active
  /implementation                  An alias of /progression. A progression
                                   it creates is titled Implementation —
                                   <name>, on an implementation/ branch
  /progressions [current] [<n>]    The current progressions of every kind,
                                   or the n most recent
  /implementations                 An alias of /progressions
  /progression help                Print this command's help
