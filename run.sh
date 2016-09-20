#!/bin/bash



source tools/kill_qemu.sh

qemu-system-i386 -M pc \
-kernel linux/arch/x86/boot/bzImage \
-drive file=tools/x86rootfs.ext2,if=virtio,format=raw \
-append "root=/dev/vda" \
-net nic,model=virtio \
-net user

exit

qemu-system-i386 -M pc \
-nographic \
-kernel linux/arch/x86/boot/bzImage \
-hda tools/x86rootfs.ext2 \
-append "root=/dev/sda console=ttyS0"