## pyenv.helpers

Helper functions for Python virtual environments, as a lighter-weight alternative to virtualenvwrapper.

+ Activate, deactivate or change to another Python virtual environment
+ List available environments by name and Python version
+ Install `pip` for newly created environments

Suitable for both Python 2 and Python 3 running on UNIX-like OSes such as Linux, FreeBSD or Mac. 

### Setup

You must follow the practice of locating virtual environments under a common base directory. 

Place file **pyenv.helpers** in a location like $HOME/etc/, and:

1. edit constant VIRTUALENV\_BASEDIR to point to your common base directory (default: $HOME/pyenv)
2. edit your .profile or .bash\_profile, to source in this file:

```Bash
source $HOME/etc/pyenv.helpers
```

(You can also just source **pyenv.helpers** into your runtime environment to try it out)

### Usage
Run these from the command line:

| command | to |
| ------- | ----- |
| `v.on ` | activate or change to another virtual environment |
| `v.off` | deactivate the current virtual environment |
| `v.ls ` | list virtual environments, showing name and Python version |
| `v.pip` | install or upgrade pip in an activated virtual environment |

### Feedback and Suggestions

Please contact the author with feedback or suggestions at peterjpierce@gmail.com.
