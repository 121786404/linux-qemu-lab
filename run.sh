#!/bin/bash



source tools/kill_qemu.sh
source tools/mkdisk.sh
source tools/restart-net-servers.sh


sudo qemu-system-arm \
-nographic \
-sd a9rootfs.ext2 \
-M vexpress-a9 \
-m 512M \
-kernel image/u-boot \
-net nic,vlan=0 \
-net tap,vlan=0,ifname=tap0,script=./tools/qemu-ifup,downscript=./tools/qemu-ifdown