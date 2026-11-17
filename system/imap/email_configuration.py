# Finds and reads an email account's configuration, slasher-email.toml. The
# imap package's fetch.py and the smtp package's send.py both read it, so one
# file configures both the fetch and the send of an account.
#
# The file is in the account's folder in the project's local directory,
# slasher/local/email/<folder>/ or where the project's registry entry relocates it, or in the private store,
# ~/.local/share/slasher/email/<project>/<folder>/. The project is looked in
# first. Its [imap] table configures the fetch, and its [smtp] table the send.

import os
import subprocess
import tomllib

FILE_NAME = "slasher-email.toml"


def local_directory():
    """The project's local directory, where foundation's local-directory.sh says,
    which may be outside the project. An installed foundation that predates the
    script keeps it in slasher/local, or local in the authoring source. A
    relocated directory that does not exist stops with the script's message."""
    script = os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "..", "foundation", "local-directory.sh"
    )
    if not os.access(script, os.X_OK):
        return "slasher/local" if os.path.isdir("slasher/local") else "local"
    result = subprocess.run([script], capture_output=True, text=True)
    if result.returncode != 0:
        raise SystemExit(result.stderr.strip())
    return result.stdout.strip()


def project_folder(folder):
    """The account's folder in the project's local directory."""
    return os.path.join(local_directory(), "email", folder)


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
