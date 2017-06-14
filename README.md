## pyenv.helpers

Helper functions for Python virtual environments, as a lighter-weight alternative to virtualenvwrapper.

+ Create a new virtual environment
+ Activate, deactivate or change to another Python virtual environment
+ List available environments by name and Python version
+ Install `pip` for newly created environments, and upgrade at any time

Suitable for both Python 2 and Python 3 running on UNIX-like OSes such as Linux, FreeBSD or Mac. 

### Setup

Place file **pyenv.helpers** in a location like $HOME/etc/, and:

1. edit constant VERSIONED_PYTHON if needed to define where your python versions reside
2. edit your .profile or .bash\_profile, to source in the file:

```Bash
source $HOME/etc/pyenv.helpers
```

3. optionally edit constant VIRTUALENV\_BASEDIR if you choose to keep virtual environments
outside of your project (i.e., not under ./env/)

(You can also just source **pyenv.helpers** into your runtime environment to try it out)

### Usage
Run these from the command line:

| command | to |
| ------- | ----- |
| `v.on ` | activate or change to another virtual environment |
| `v.off` | deactivate the current virtual environment |
| `v.make <version> [subdir]` | create a new virtual environment |
| `v.ls ` | list virtual environments, showing name and Python version |
| `v.pip` | install or upgrade pip in an activated virtual environment |

### Feedback and Suggestions

Please contact the author with feedback or suggestions at peterjpierce@gmail.com.
