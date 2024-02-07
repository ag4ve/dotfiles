
ec2search() {
  in="$1"
  for profile in default; do
    AWS_SHARED_CREDENTIALS_FILE="$aws_config" AWS_PROFILE=$profile $HOME/.local/venvs/aws/bin/aws ec2 describe-instances \
      --query 'Reservations[].Instances[].[ LaunchTime,InstanceId,[Tags[?Key==`Name`].Value][0][0],State.Name,PrivateIpAddress, VirtualizationType ]' \
      --output table \
        | grep -i "$in" \
        | sort -n
  done
}

# Remove AWS box
termbox() {
  aws ec2 modify-instance-attribute --instance-id "$1" --no-disable-api-termination
  aws ec2 terminate-instances --instance-ids "$1"
}
# compdef termbox=aws

#aws() {
#  AWS_SHARED_CREDENTIALS_FILE="$aws_config" command $HOME/.local/venvs/aws/bin/aws $@
#}

