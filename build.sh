git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:${PWD}/depot_tools

mkdir chromiumos && cd chromiumos
repo init -u https://chromium.googlesource.com/chromiumos/manifest.git --repo-url https://chromium.googlesource.com/external/repo.git -g minilayout
repo sync -j30

cros chrome-sdk --board=amd64-generic --download-vm --clear-sdk-cache --log-level=info <<SHELL
  cros_vm --start
  cros_vm --cmd -- /usr/bin/env ls
SHELL
