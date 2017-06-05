#!/bin/bash


source tools/kill_qemu.sh
source tools/mkdisk.sh
source tools/restart-net-servers.sh


sudo qemu-system-arm \
-smp 2 \
-nographic \
-sd a9rootfs.ext2 \
-M vexpress-a9 \
-m 64M \
-kernel image/zImage \
-dtb image/vexpress-v2p-ca9.dtb \
-append "init=/linuxrc user_debug=0xff earlyprintk console=ttyAMA0,115200 root=/dev/mmcblk0 rw rootwait" \
-net nic,vlan=0 \
-net tap,vlan=0,ifname=tap0,script=./tools/qemu-ifup,downscript=./tools/qemu-ifdown |tee linux.log



#-usbdevice host:1b3b:2977
#-usb \
#-usbdevice mouse \
#-usbdevice keyboard \
#-usbdevice tablet \
#-show-cursor \
