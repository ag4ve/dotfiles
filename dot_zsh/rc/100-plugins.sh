
# ZIM looks like the fastest plugin manager and has the most stars on
# github. However znap and antidote look fairly fast and frequently
# maintained as well. Trying znap for now and might try the others later.
# Should just need to change the source here and chezmoiexternal.toml git
# repo and how the loader works here to change plugin managers.
# https://github.com/marlonrichert/zsh-snap
# https://github.com/mattmc3/antidote
# https://github.com/zimfw/zimfw
# load znap
[[ -r $HOME/.zsh/znap/znap.zsh ]] ||
  git clone https://github.com/marlonrichert/zsh-snap.git $HOME/.zsh/znap
source $HOME/.zsh/zsh-snap/znap.zsh

zstyle ':znap:*' repos-dir $HOME/.zsh

zplugins=(
  asdf
  autojump 
  aws
  bundler 
  catimg 
  colored-man-pages
  cpanm 
  dircycle 
  docker 
  encode64 
  gem 
  git 
  git-extras 
  github
  jsontools 
  mvn 
  npm 
  node 
  pass 
  perl 
  pip 
  python 
  rsync
  ruby 
  rvm 
  svn-fast-info 
  systemd 
  taskwarrior 
  tmuxinator 
  urltools 
  vi-mode 
  web-search 
  z
)

for plugin in ${zplugins[@]}; do
  znap source ohmyzsh "plugins/$plugin"
done

srcplugins=(
  jpb.zshplugin
  fast-syntax-highlighting
  zsh-history-substring-search
  git-extra-commands
  fzf-zsh-plugin
  sysadmin-util
  git-it-on.zsh
  zsh-completions
  zsh-completion-generator
  zsh-autosuggestions
)

for plugin in ${srcplugins[@]}; do
  znap source "$HOME/.zsh/$plugin"
done

# znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
# compctl -K    _pyenv pyenv
# 
# znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
# compctl -K    _pip_completion pip
# 
# znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
# compdef       _pipenv pipenv

