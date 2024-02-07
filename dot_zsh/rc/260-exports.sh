
export TERM=screen-256color
export TZ=America/New_York
export KEYTIMEOUT=1
export EDITOR="nvr --remote-tab"
export VISUAL="nvr --remote-tab"
export GIT_EDITOR=vim
export WORDCHARS='-' # consider --version, -h, etc one whole word
export BC_ENV_ARGS=$HOME/.bcrc
export CVS_RSH=ssh
export TMPDIR=$HOME/tmp

export PYENV_ROOT="$HOME/.pyenv"

#export PAGER="batcat --language man --theme ansi"
# Make VIM man pager
# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#     vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#     -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#export PAGER="vim -c \"Man $1 $2\" -c 'silent only' \
#    -U NONE -u vim-man"

# GPG
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

