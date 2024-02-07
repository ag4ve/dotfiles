
# Re-source zshrc unless $NO_AUTOSOURCE is set
resource_zshrc() {
    if [ -z NO_AUTOSOURCE ] ; then
        return
    fi

    local -a stat
    integer last_change
    zmodload -F zsh/stat b:zstat

    zstat -A stat +mtime ~/.zshrc
    last_change=$stat[1]

    if [[ -n $ZSHRC_LAST_CHANGE && last_change -gt ZSHRC_LAST_CHANGE ]]; then
        # We don't want this to occur in function scope.
        trap '. ~/.zshrc > /dev/null 2>&1' EXIT

        # Reload executable paths as path may have changed
        rehash
    fi

    typeset -ig ZSHRC_LAST_CHANGE
    ZSHRC_LAST_CHANGE=last_change
}

# Re-source .ssh/agent.sh unless $NO_AUTOSOURCE is set
#resource_sshagent() {
#    if [ -z NO_AUTOSOURCE ] ; then
#        return
#    fi
#
#    local -a stat
#    integer last_change
#    zmodload -F zsh/stat b:zstat
#
#    zstat -A stat +mtime ~/.ssh/agent.sh
#    last_change=$stat[1]
#
#    if [[ -n $SSHAGENT_LAST_CHANGE && last_change -gt SSHAGENT_LAST_CHANGE ]]; then
#        # We don't want this to occur in function scope.
#        trap '. ~/.ssh/agent.sh > /dev/null 2>&1' EXIT
#    fi
#
#    typeset -ig SSHAGENT_LAST_CHANGE
#    SSHAGENT_LAST_CHANGE=last_change
#}

