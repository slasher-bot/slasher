PROCESS
  These commands move the work under way along: take its next step, or say what
  was done and what's next.

  /items                           The current items (/item list current)
  /current [<n>]                   The current items, or the n most recent,
                                   then the current features and experiments
  /' [<n>]                         An alias of /current
  /recent                          Brief summary of recent work, and what's
                                   next
  /.                               An alias of /recent

  /proceed                         Proceed to the next step in the current
                                   multi-step process, or resume interrupted
                                   work
  />>                              An alias of /proceed
  /next                            An alias of /proceed
  /next?                           "What are we doing?" or "what's next?"
                                   The next step in the current multi-step
                                   process, or the step that has been
                                   interrupted.
  /?                               An alias of /next?

  /unattended <request>            Carry out the request on the agent's own,
                                   after a plan is proposed
  /! <request>                     An alias of /unattended

  /ask-again                       Repeat the agent's previous multiple-choice
                                   question
  /aa                              An alias of /ask-again

  /estimate-confidence             The agent's confidence of proceeding
                                   unattended from where the work stands
  /#                               An alias of /estimate-confidence

  /process help                    Print this command's help
