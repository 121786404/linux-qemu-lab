#!/bin/bash

source tools/kill_qemu.sh
source tools/mkdisk.sh
source tools/restart-net-servers.sh


sudo qemu-system-arm \
-sd a9rootfs.ext2 \
-M vexpress-a9 \
-m 512M \
-kernel image/u-boot-d \
-net nic,vlan=0 \
-net tap,vlan=0,ifname=tap0 \
-S -s &

sleep 2
#xfce4-terminal -e "ddd --debugger arm-linux-gnueabi-gdb -x tools/gdbinit"
xfce4-terminal -e "ddd --debugger /opt/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-gdb -x tools/gdbinit"


