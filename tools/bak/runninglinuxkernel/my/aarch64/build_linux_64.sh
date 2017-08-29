#!/bin/bash
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
mkdir -p _install_arm64/dev
cd _install_arm64/dev/
sudo mknod console c 5 1
cd ../..
#make distclean
make defconfig
make -j4