#!/bin/bash
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
#cd _install_arm32/dev/
#sudo mknod console c 5 1
make vexpress_defconfig
make bzImage -j4 
make dtbs
