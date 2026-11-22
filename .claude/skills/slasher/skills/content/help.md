CONTENT
  Content is a piece of writing, built on its own branch or worktree to a
  declared end. It is a kind of progression, without the steps that serve
  only code.

  /content new                     Write an Open record. start creates
                                   its branch
  /content status [<content>]      Phases, state, what exists, and
                                   what is left. <content>: a letter
                                   from the last list, a datetime, or
                                   words from the title
  /content start, /start           Open -> Active, or, where none is
                                   Open, create one Active
  /content complete, /complete     Offer a review, then -> Completed
  /content defer, /defer           -> Deferred (kept to do later)
  /content suspend, /suspend       -> Suspended
  /content discontinue, /discontinue
                                   -> Discontinued (no plan to do it)
  /content obsolete, /obsolete     -> Obsolete
  /content supersede, /supersede   -> Superseded, naming the replacement
  /content abandon, /abandon       -> Abandoned
  /content resume, /resume         Any state but Open or Active -> Active
  /content list                    The current content, as /contents
  /contents [current] [<n>]        The current content, or the n most recent
  /content help                    Print this command's help

  Content states no forecast and reaches no verdict. Where the prose package
  is active, /content complete offers a critique, numbered suggestions, or
  a line edit before the merge.
