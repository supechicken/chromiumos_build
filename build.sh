{
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
  export PATH=$PATH:$(PWD)/depot_tools
}

mkdir chromiumos && cd chromiumos
repo init -u https://chromium.googlesource.com/chromiumos/manifest.git --repo-url https://chromium.googlesource.com/external/repo.git -g minilayout
repo sync -j30

export BOARD=amd64-generic

cros_sdk <<EOF
./setup_board --board=${BOARD}
./build_packages --board=${BOARD}
./build_image --board=${BOARD} --boot_args "earlyprintk=serial,keep console=tty0" --noenable_rootfs_verification test
./image_to_vm.sh --board=${BOARD} --test_image
EOF

