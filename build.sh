git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:${PWD}/depot_tools

mkdir chromiumos && cd chromiumos
fetch --nohooks --no-history chromium

cd src/
cros chrome-sdk --board=amd64-generic \
--download-vm --clear-sdk-cache --log-level=info <<SHELL
cros_vm --start
cros_vm --cmd -- /usr/bin/env ls
SHELL
