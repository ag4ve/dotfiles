
# Set some history options

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt INC_APPEND_HISTORY

unsetopt HIST_BEEP

# Share your history across all your terminal windows
setopt share_history
#setopt noclobber

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

#ZSH Man page referencing the history_ignore parameter - https://manpages.ubuntu.com/manpages/kinetic/en/man1/zshparam.1.html
HISTORY_IGNORE="(cd ..|l[s]#( *)#|pwd *|exit *|date *|* --help)"

setopt AUTO_CD  # If a command is issued that can’t be executed as a normal command,
                # and the command is the name of a directory, perform the cd command
                # to that directory.

# Add some completions settings
setopt ALWAYS_TO_END     # Move cursor to the end of a completed word.
setopt AUTO_LIST         # Automatically list choices on ambiguous completion.
setopt AUTO_MENU         # Show completion menu on a successive tab press.
setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash.
setopt COMPLETE_IN_WORD  # Complete from both ends of a word.
unsetopt MENU_COMPLETE   # Do not autoselect the first completion entry.

# Miscellaneous settings
setopt INTERACTIVE_COMMENTS  # Enable comments in interactive shell.

setopt extended_glob # Enable more powerful glob features

# Long running processes should return time after they complete. Specified
# in seconds.
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"
