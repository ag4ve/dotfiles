
# Run crowbar with common users
ucrowbar () {
  for user in ec2-user chef jenkins centos tomcat root ubuntu apache; do
    echo $user
    $HOME/gits/crowbar/crowbar.py -b sshkey -s "$1" -u "$user" -k ~/.ssh -o /dev/null -l /dev/null 2>&1 \
      | grep -vE ' (Crowbar v|LOG-SSH:|START|STOP|No results found...)'
  done
}

