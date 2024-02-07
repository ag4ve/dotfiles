
# Handle quoting in rsync
#rsync() {
#    dst="$@[-1]"
#    src="$@[1,-2]"
#    print "[$src] [$dst]"
#    command rsync --progress --recursive "\"$src\" $dst"
#}

prsync() {
  : "${ruser:="$USER"}"
  command rsync -r -a --partial --info=progress2 -e "ssh -i ~/.ssh/id_rsa -o User=$ruser" $@
}
compdef prsync=rsync

