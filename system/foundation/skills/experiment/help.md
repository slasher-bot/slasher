EXPERIMENTS
  An experiment tests a question on its own branch or worktree, to a declared
  end. Features and experiments are both kinds of progressions.

  /experiment new                  Write an Open record. start creates
                                   its branch
  /experiment new with phases      Create it, asking for its phases
  /experiment status [<experiment>]
                                   Phases, state, what exists, and
                                   what is left. <experiment>: its row in
                                   the last list, as pB, a datetime, or
                                   words from the title
  /experiment start, /start        Open -> Active, or, where none is
                                   Open, create one Active
  /experiment complete, /complete  -> Completed, or asks which state
                                   where there is a forecast
  /experiment affirm, /affirm      -> Affirmed (engineer's declaration only)
  /experiment refute, /refute      -> Refuted
  /experiment inconclusive, /inconclusive
                                   -> Inconclusive
  /experiment defer, /defer        -> Deferred (kept to do later)
  /experiment suspend, /suspend    -> Suspended
  /experiment discontinue, /discontinue
                                   -> Discontinued (no plan to do it)
  /experiment obsolete, /obsolete  -> Obsolete
  /experiment supersede, /supersede
                                   -> Superseded, naming the replacement
  /experiment abandon, /abandon    -> Abandoned
  /experiment resume, /resume      Any state but Open or Active -> Active
  /experiments [current] [<n>]     The current experiments, or the n most recent
  /experiment help                 Print this command's help
