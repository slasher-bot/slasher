REVIEW
  This command suggests numbered edits to content, and accept or reject
  settles them.

  /review                          Suggest edits to the content the
                                   conversation is on
  /review <content>                Suggest edits to the content named
  /review accept [<n> ...]         Show the accepted suggestions' result,
                                   then write it on your selection. With
                                   no numbers, every pending suggestion
  /review reject [<n> ...]         Drop the suggestions. With no numbers,
                                   every pending suggestion

  /print-and-review [<file>]       Print the draft as it now stands, then a
                                   review of it
  /pr [<file>]                     An alias of /print-and-review

  /edit [<content>]                Walk the content paragraph by paragraph,
                                   with findings and no rewrites
  /edit next, /edit previous       Move to the next or previous paragraph
  /edit p<n>                       Go to paragraph n
  /edit sentences [p<n> ...]       Judge the sentences of the paragraphs
                                   named, or of every paragraph
  /edit print                      Print the content up to the current
                                   paragraph, with accepted changes made

  Every review names its criterion in each finding: structure and flow,
  clarity and concision, tone and voice, or content gaps for a paragraph,
  and precision, readability, or connection for a sentence.

  /review help                     Print this command's help
