# Finds and reads an email account's configuration, slasher-email.toml. The
# imap package's fetch.py and the smtp package's send.py both read it, so one
# file configures both the fetch and the send of an account.
#
# The file is in the account's folder in the project,
# slasher/local/email/<folder>/, or in the private store,
# ~/.local/share/slasher/email/<project>/<folder>/. The project is looked in
# first. Its [imap] table configures the fetch, and its [smtp] table the send.

import os
import tomllib

FILE_NAME = "slasher-email.toml"


def project_folder(folder):
    """The account's folder in the project."""
    local = "slasher/local" if os.path.isdir("slasher/local") else "local"
    return os.path.join(local, "email", folder)


def private_folder(folder):
    """The account's folder in the private store, out of the repository."""
    return os.path.join(
        os.environ["HOME"], ".local", "share", "slasher", "email",
        os.path.basename(os.getcwd()), folder,
    )


def configuration(folder):
    """The account's configuration, read as TOML, or None where neither the
    project nor the private store holds one."""
    for directory in (project_folder(folder), private_folder(folder)):
        path = os.path.join(directory, FILE_NAME)
        if os.path.isfile(path):
            with open(path, "rb") as file:
                return tomllib.load(file)
    return None
