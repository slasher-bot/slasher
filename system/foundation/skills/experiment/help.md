EXPERIMENTS
  An experiment tests a question on its own branch or worktree, to a declared
  end. Features and experiments are both kinds of implementations.

  /experiment new                  Start an experiment
  /experiment new with phases      Start an experiment, asking for its phases
  /experiment status               Phases, current phase, and its goal
  /experiment affirm               -> Affirmed (engineer's declaration only)
  /experiment refute               -> Refuted
  /experiment inconclusive         -> Inconclusive
  /experiment suspend, /suspend    -> Suspended
  /experiment discontinue, /discontinue
                                   -> Discontinued
  /experiment resume               Suspended or Discontinued
                                   -> Active
  /experiment supersede, /supersede-> Superseded, after suspension
  /experiment abandon, /abandon    -> Abandoned
  /experiments [<n>]               The current experiments, or the n most recent
  /experiment help                 Print this command's help
