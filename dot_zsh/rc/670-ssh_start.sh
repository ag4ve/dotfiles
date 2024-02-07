
# Start tmux sessions with ssh connections
ssh_start() {

  if [[ -n "$2" && "$2" == home ]] ; then
    tmux-start -n "$1" -c sshs -p 0 -P 1 -f
  else
    tmux-start -n "$1" -c sshs -p 0 -P 1 -f -a "-ifwd"
  fi
}

