
# load zgenom
source "${HOME}/.zsh/zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate --background

# if the init script doesn't exist
if ! zgenom saved; then
  echo "Creating a zgenom save"

# zgenom loadall < path/to/plugin/file

  # Add this if you experience issues with missing completions or errors mentioning compdef.
  # zgenom compdef

  # Ohmyzsh base library
  zgenom ohmyzsh

  plugins=(
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

  for plugin in ${plugins[@]}; do
  # plugins
    zgenom ohmyzsh "plugins/$plugin"
  done

  zgeplugins=(
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

  for plugin in ${zgeplugins[@]}; do
    zgenom load "$HOME/.zsh/$plugin"

  zgenom save

  # Compile your zsh files
  # zgenom compile "$HOME/.zshrc"
fi
