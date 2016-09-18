#!/bin/bash

source tools/kill_qemu.sh
source tools/mkdisk.sh
source tools/restart-net-servers.sh


sudo qemu-system-i386 \
-M pc \
-nographic \
-drive file=x86rootfs.ext2,if=virtio,format=raw \
-kernel linux/arch/x86/boot/bzImage \
-append root=/dev/vda \
-net nic,model=virtio -net user \
-S -s &

sleep 2
#xfce4-terminal -e "ddd --debugger arm-linux-gnueabi-gdb -x tools/gdbinit"
xfce4-terminal -e "ddd -x tools/gdbinit"


