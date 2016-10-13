#!/bin/bash


rm -f serial.out
source tools/kill_qemu.sh

qemu-system-i386 -M pc \
--no-reboot \
-kernel linux/arch/x86/boot/bzImage \
-drive file=tools/x86rootfs.ext2,if=virtio,format=raw \
-append "root=/dev/vda rw debug console=ttyS0" \
-serial file:serial.out \
-net nic,model=virtio \
-net user

exit

qemu-system-i386 -M pc \
-nographic \
-kernel linux/arch/x86/boot/bzImage \
-hda tools/x86rootfs.ext2 \
-append "root=/dev/sda console=ttyS0"