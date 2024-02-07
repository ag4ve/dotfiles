
tfshow() {
  tmp="$(mktemp ./plan.XXXXXX)"
  terraform plan --out "$tmp" >/dev/null
  terraform show -json "$tmp" | jq -rSC . | bat
  rm -f "$tmp"
}

