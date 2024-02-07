
# Rename cpanm to cpan
cpan () {
    echo "Type \\cpan to execute actual cpan command"
    cpanm $@
}
compdef cpan=cpanm

# Include a default Data::Dumper when calling perl
perlfunc () {
    command perl -MData::Dumper \
        -e '$Data::Dumper::Sortkeys= 
            sub {return [
                sort {$a <=> $b} keys %{$_[0]} 
            ]};' \
        $@
}
alias perl='perlfunc'

