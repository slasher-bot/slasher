ITEMS
  Items hold the project's thinking: ideas, plans, designs, observations, and
  work to be done, each with a state.

  /item new [<kind>]               Create an item tagged [<kind>], or [idea]
                                   with no kind. Any kind may be named.
  /item <kind>                     An alias of /item new <kind>, where the
                                   kind is not also a subcommand of /item
  /item idea, /idea                Create an item tagged [idea]
  /item improvement, /improvement  Create an item tagged [improvement]
  /item correction, /correction    Create an item tagged [correction] [work]
                                   [rework]
  /item rework, /rework            Create an item tagged [rework] [work]
                                   [correction]
  /item work, /work, /work-item    Create an item tagged [work]
  /item plan, /plan                Create an item tagged [plan]
  /item design, /design            Create an item tagged [design]
  /item aspiration, /aspiration    Create an item tagged [aspiration]
  /item goal, /goal                Create an item tagged [goal]
  /item observation, /observation, /observe
                                   Record an observation
  /item mistake, /mistake          Create an item tagged [mistake]
  /item problem, /problem          Create an item tagged [problem]
  /item list <state>, /list <state>
                                   List items in a state
                                   <state>: any item state, or "current"
                                   (Open and Active)
  /item current                    List current items (/item list current)

  /item start, /start              Open -> Active
  /item realize, /realize          -> Realized
  /item done, /done                -> Done ([work] items only)
  /item defer, /defer              -> Deferred
  /item suspend, /suspend          -> Suspended
  /item supersede, /supersede      -> Superseded, naming the replacement
  /item abandon, /abandon          -> Abandoned
  /item obsolete, /obsolete        -> Obsolete
  /item reopen, /reopen            Take back Realized, Deferred, Open, or Done

  /suspend, /supersede, and /abandon also act on a feature or an
  experiment, and ask which record is meant where the words do not say.

  /item help                       Print this command's help

  /observation help                Print this command's help

  A bare /idea is /idea new. A bare /observation is /observation new.
  A kind that is also a subcommand, such as list, is created with
  /item new list.
