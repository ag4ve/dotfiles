
defstrace () {
  command strace -f -e open,access,connect,recvfrom,sendto,network $@
}
compdef defstrace=strace

