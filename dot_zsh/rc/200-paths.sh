
# Go
export GOPATH="$HOME/.config/go"
#export GOROOT="$HOME/.config/go/bin"

unset path
path+=($HOME/bin)                                       # Local user bin
path+=($HOME/.local/bin)                                # Local user bin
path+=($HOME/.rvm/bin)                                  # RVM
path+=($HOME/.pyenv/bin)                                # PyEnv
path+=($HOME/.cargo/bin)                                # Cargo bins
path+=($HOME/.local/share/bob/nvim-bin)                  # BOB NEOVim version manager
#path+=($HOME/perl5/perlbrew/bin)                        # Perlbrew
#path+=(/opt/homebrew/opt/ruby/bin)                      # homebrew's ruby install
path+=($GOROOT)                                         # golang binary and dependencies
path+=($HOME/.zsh/bash-libs)                            # Bash libs to be sourced
path+=($HOME/.zsh/misc-scripts)                         # Misc scripts
path+=(/var/lib/snapd/snap/bin)                         # Snap path
#path+=($HOME/.linuxbrew/{bin,sbin})                     # Homebrew binaries
path+=(/usr/local/ftimes/bin)                           # Ftimes
path+=($HOME/.tfenv/bin)                                # tfenv
path+=($HOME/.arkade/bin)                               # arkade
path+=(/snap/bin)                                       # snap bin
path+=(/opt/android-sdk-update-manager/platform-tools)  # Android sdk
path+=(/usr/local/texlive/2015/bin/x86_64-linux)        # TexLive install dir
path+=(/etc/alternatives)                               # Debian alternatives first
path+=({/usr/local,/usr,}/{bin,sbin})                   # All normal system paths
export PATH

