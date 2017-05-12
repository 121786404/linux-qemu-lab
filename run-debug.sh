#!/bin/bash

source tools/kill_qemu.sh
source tools/mkdisk.sh
source tools/restart-net-servers.sh

sudo qemu-system-arm \
-sd a9rootfs.ext2 \
-M vexpress-a9 \
-m 64M \
-kernel image/zImage \
-dtb image/vexpress-v2p-ca9.dtb \
-append "init=/linuxrc root=/dev/mmcblk0 rw rootwait" \
-net nic,vlan=0 \
-net tap,vlan=0,ifname=tap0,script=./tools/qemu-ifup,downscript=./tools/qemu-ifdown \
-S -s &

sleep 2
xfce4-terminal -e "eclipse"
