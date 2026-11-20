PROSE
  These commands review content: walk it paragraph by paragraph, suggest
  numbered edits, or critique it whole.

  /prose line-edit [<content>]     Walk the content paragraph by paragraph,
                                   then sentence by sentence. Accept,
                                   reject, or ignore each suggestion
  /prose line-edit next, previous  Move to the next or previous paragraph
  /prose line-edit p<n>            Go to paragraph n
  /prose line-edit p<n> s<n>       Go to sentence n of paragraph n
  /prose line-edit sentences [p<n> ...]
                                   Judge the sentences of the paragraphs
                                   named, or of every paragraph
  /prose line-edit print           Print the content up to the current
                                   paragraph, with accepted changes made
  /line-edit                       An alias of /prose line-edit

  /prose suggest [<content>]       Suggest numbered edits to the content
  /review                          An alias of /prose suggest
  /prose accept [<n> ...]          Show the accepted suggestions' result,
                                   then write it on your selection. With
                                   no numbers, every pending suggestion
  /accept                          An alias of /prose accept
  /prose reject [<n> ...]          Drop the suggestions. With no numbers,
                                   every pending suggestion
  /reject                          An alias of /prose reject

  /prose critique [<content>]      An overall critical review of the
                                   content, as numbered findings

  Every review names its criterion in each finding: structure and flow,
  clarity and concision, tone and voice, or content gaps for a paragraph,
  and precision, readability, or connection for a sentence.

  /prose help                      Print this command's help
