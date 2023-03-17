
# kasa integration: https://github.com/python-kasa/python-kasa
setup-device() {
  kasa --host 192.168.0.1 wifi join $1
}
