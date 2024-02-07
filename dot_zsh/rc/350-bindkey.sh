
# Set vi-mode and create a few additional Vim-like mappings
bindkey -v
bindkey "^?" backward-delete-char
bindkey -M vicmd "^R" redo
bindkey -M vicmd "u" undo
bindkey -M vicmd "ga" what-cursor-position
bindkey -M viins '^p' history-beginning-search-backward
bindkey -M vicmd '^p' history-beginning-search-backward
bindkey -M viins '^n' history-beginning-search-forward
bindkey -M vicmd '^n' history-beginning-search-forward

# Allows editing the command line with an external editor
zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# Comments on the command line
setopt interactivecomments

# This potentially has a bug
# Per session "up arrow" history
zle-line-init() { zle set-local-history 1 }
zle -N zle-line-init

zle-keymap-select() {
    [[ $KEYMAP = isearch ]]
    zle set-local-history $?
}
zle -N zle-keymap-select

# alt+s inserts sudo at the beginning of a command
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "\er" insert-sudo

# keys for history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
