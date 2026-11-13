SMTP
  These commands send email through an account whose credential is kept in
  the macOS Keychain, the same credential the imap package fetches with.

  /smtp send <name> <message-file> Send the message in the file through the
                                   account with that name, after you confirm
                                   it
  /smtp help                       Print this command's help

  A message file holds headers, then a blank line, then the body.
  A credential is stored in your own terminal, never through the chat:
  slasher/system/imap/credential.sh write <host> <login> [--name <name>]
