
alias ls="eza"
alias ll="eza -l"
alias ymdhms='date +%Y%m%d%H%M%S' # long date format - yyyymmddHHMMSS
alias mdyhms='date "+%m/%d/%y %H:%M:%S"' # date format - mm/dd/yy HH:MM:SS
alias refresh='exec su -p -l $USER -' # relogin
alias bundleinstall='vim +BundleInstall +qall' # install vim bundles
alias less='less -R' # display ANSI color
alias tree='tree -Chug'
alias file='file -sL'
alias cidr='geocidr --header --ip '
alias uridec="perl -MURI::Escape -nle 'print uri_unescape(\$_)'"
alias torexit='curl http://torstatus.blutmagie.de/ip_list_exit.php/Tor_ip_list_EXIT.csv'
alias dicepass="perl -MCrypt::XkcdPassword -e 'print Crypt::XkcdPassword->make_password(\$_)'"
alias rst-term="source ~/.zshrc"
#alias whatip="curl http://ifconfig.me"
alias whatip6="curl -s http://ip4only.me/api/ | cut -d',' -f2"
alias whatip4="curl -s http://ip6only.me/api/ | cut -d',' -f2"
alias whatip="whatip4;whatip6"
alias irssi="TERM=screen-256color irssi"
alias udevinfo="udevadm info"
alias torcurl="curl --socks5 127.0.0.1:9050"
alias xv="geeqie"
alias sshn="ssh -F /dev/null"
alias scpn="scp -F /dev/null"
alias gpgn="gpg --no-use-agent"
alias jq="jq --indent 4"
alias paste="curl -F 'sprunge=<-' http://sprunge.us"
#alias paste="curl http://haste.icam.uscis.dhs.gov/documents -X POST -d -"
alias rdiglist="while read ip; do dns="$(dig -x "$ip" +short)"; echo "$ip $dns"; done"
alias rmcontrol="rm ~/.ssh/control-*"
alias rekey="killall ssh-agent; ssh-add -s /usr/local/lib/tokendPKCS11.so"
#alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
alias bat="batcat --pager less"
alias speakin="piper --download-dir $HOME/.config/piper --data-dir $HOME/.config/piper --model en_GB-alba-medium --output_raw | aplay -f S16_LE -c1 -r24000"
alias speakclip="xsel | speakin"

# Change keyboard layout
#alias aoeu="setxkbmap us"
#alias asdf="setxkbmap dvorak"

alias vim="nvr --remote-tab"

# As root
#alias asdf="loadkeys /usr/share/keymaps/i386/dvorak/dvorak.kmap.gz"
#alias aoeu="loadkeys /usr/share/keymaps/i386/include/qwerty-layout.inc.gz"

