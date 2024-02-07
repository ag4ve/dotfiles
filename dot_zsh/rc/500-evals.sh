
# Homebrew
#eval "$(/opt/homebrew/bin/brew shellenv)"

# enable perlbrew
#source $HOME/perl5/perlbrew/etc/bashrc
#perlbrew use perl-5.30.0

# ASDF package manager
ASDF_DIR="$HOME/.zsh/asdf"
source $ASDF_DIR/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Enable PyEnv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# enable rvm
source $HOME/.rvm/scripts/rvm 2>/dev/null

# aws completion
#source $HOME/gits/aws-cli/bin/aws_zsh_completer.sh

# gcp completion
#source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# Dargs competion
if [[ -d "~/.dargs/completions/zsh" ]];then
  for f in ~/.dargs/completions/zsh/*;do 
    source "$f"
  done
fi

# the fuck
#eval $(thefuck --alias --enable-experimental-instant-mode)
eval $(thefuck --alias)

# replacement for z
eval "$(zoxide init zsh)"

# proxy export
#eval $(~/bin/proxy)

