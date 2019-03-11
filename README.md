## pyenv.helpers

Helper utilities for Python virtual environments. Includes:
+ a script to automate downloading source and building pristine reference binaries
+ a set of related functions to create and manage project environments from those binaries,
  as a lighter-weight alternative to virtualenvwrapper:
    + Create a new virtual environment
    + Activate, deactivate or change to another Python virtual environment
    + Install and list libraries installed in the current environment
    + List your current Python (path and version)
    + Install `pip` for newly created environments, and upgrade at any time

Suitable for both Python 2 and Python 3 running on UNIX-like OSes such as Linux, FreeBSD or Mac,
as well as WSL (Windows Subsystem for Linux).

### Setup

Place file **pybuild.sh** in your path (e.g., $HOME/bin/) and optionally edit variable
`PYTHONS_BASEDIR` (normally /opt/python). Make sure you can write to
this directory.

Place file **pyenv.functions** in a location like $HOME/etc/, and:

1. edit constant PYTHONS_BASEDIR if needed to match your choice in pybuild.sh above.
2. edit your .profile or .bash\_profile, to source in the file:

```Bash
source $HOME/etc/pyenv.functions
```

(You can also just source **pyenv.functions** into your runtime environment to try it out)

### Usage

#### pybuild.sh

Run without arguments to see these usasge instructions. You may optionally use
the second argument to override the default PYTHONS_BASEDIR configured above.

```Bash
    usage: pybuild.sh <version> [install_dir]
       ex: pybuild.sh 3.7.2
           pybuild.sh 3.6.2 /home/kelly/py/3.6.2
```

#### pyenv.functions
Run these from the command line:

| command | to |
| ------- | ----- |
| `v.on ` | activate or change to another virtual environment |
| `v.off` | deactivate the current virtual environment |
| `v.mk <version> [subdir]` | create a new virtual environment |
| `v.ls` | show your current Python location and version |
| `v.pip` | install or upgrade pip in an activated virtual environment |
| `v.pf` | show installed libraries (pip freeze) |
| `v.pi` | install a library (pip install <library>) |
| `v.pir <requirements_file>` | install all libraries from a requirements file (pip install -r <file>) |

### Feedback and Suggestions

Please contact the author with feedback or suggestions at peterjpierce@gmail.com.
