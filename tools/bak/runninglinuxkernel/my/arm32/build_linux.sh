#!/bin/bash
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p _install_arm32/dev
cd _install_arm32/dev/
sudo mknod console c 5 1
cd ../..
make vexpress_defconfig
make bzImage -j4 
make dtbs
