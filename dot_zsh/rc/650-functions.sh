# short dig
sdig () {
  dig "$@" +short
}
compdef sdig=dig

# long dig

ldig () {
  dig +trace +nocmd "$@" any +multiline +answer
}
compdef ldig=dig

iplook () {
  inip="$1"
  dig -x "$inip" +short
  geocidr --ip "$inip"
  whoism "$inip"
}

find () {
  command find "$PWD" $@
}

ioline () {
    echo -n "[$@] ["
    echo -n $(eval $@)
    echo -n "]\n"
}

# Convert number to normal ip
int2ip () {
    perl -e "print join '.', unpack 'C4', pack 'N', $@"
}

# Pertinent information from whois
whoism () {
    whois "$1" | egrep '^(inetnum|netname|descr|address|CIDR|OrgName|OrgId|Address|City|StateProv|PostalCode|[Cc]ountry|inetrev|owner(id)?|responsible|nserver):'
}
compdef whoism=whois

# Reset forwarded ssh port forward connections
rst-fwd () {
    local host="$1"

    # Match 3 level names such as sink-abby-fwd
    #if [[ "$1" =~ ".*-.*-.*" ]] ; then
    #    host="${1#*-}"
    #fi

    pkill -f "ssh (-[Nf] ){2}.*$host"

    ssh -N -f "$1" > /dev/null 2>&1
}
compdef rst-fwd=ssh

# Regex grep all ASCII files in a directory
tgrep () {
    string="$1"
    local dir="$2"

    if [ -z "$dir" ] ; then
        dir="./"
    fi

    while read file ; do
        if [[ "$(file -b --mime-encoding "$file")" = *ascii* ]] ; then
            grep -HE "$string" "$file"
        fi
    done <<< "$(command find $dir -type f)"
}
compdef tgrep=egrep

s_client () {
  command openssl s_client -connect "$1:443" -servername "$1" -showcerts -verify 10 <<<"QUIT" 2>&1
}

asn1parse () {
  command openssl asn1parse -in "$1" -dump -i
}

