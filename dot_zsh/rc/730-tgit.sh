
tgit () {
  opts="$@"
  tgit_log="$( \
#    strace -f -e open,access,connect,recvfrom,sendto,network -- \
    dtruss -f -e open,access,connect,recvfrom,sendto,network -- \
      bash -c ' set -vx ; \
        GIT_TRACE=1 \
        GIT_TRACE_PACK_ACCESS=1 \
        GIT_TRACE_PACKET=1 \
        GIT_TRACE_PERFORMANCE=1 \
        GIT_TRACE_SETUP=1 \
        GIT_SSH_COMMAND="ssh -vvvv " \
        GIT_PAGER= \
        git '$opts' \
      ' 2>&1 \
  )"
  echo "$tgit_log" | grep -vaE '^(([0-9]{2}:){2}[0-9]{2}\.[0-9]{6}|debug[0-9]:|\[pid [0-9]+\]|strace: Process [0-9]+|.* = -1 ENOENT) '
}
compdef tgit=git

tglog () {
  echo \"$tgit_log\" | grep -aE '^(([0-9]{2}:){2}[0-9]{2}\.[0-9]{6}|debug[0-9]:|\[pid [0-9]+\]|strace: Process [0-9]+|.* = -1 ENOENT) '
}

