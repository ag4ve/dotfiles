
# QR Code of a password
qrpass () {
  pass "$1" | qrencode -o - -t UTF8
}

qrstring () {
  echo $@ | qrencode -o - -t UTF8
}

