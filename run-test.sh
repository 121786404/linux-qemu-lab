#!/bin/bash



sudo rm -f a9rootfs.ext2
dd if=/dev/zero of=a9rootfs.ext2 bs=1M count=64
mkfs.ext2 a9rootfs.ext2
sudo rm -rf tmpfs
mkdir -p tmpfs
sudo mount -t ext2 a9rootfs.ext2 tmpfs -o loop
sudo cp -raf busybox/_install/*  tmpfs

rm boot.cmd
echo "setenv bootargs init=/linuxrc console=ttyAMA0,115200 [earlyprintk] root=/dev/mmcblk0 rw rootwait" >> boot.cmd
echo "ext2load mmc 0 0x60003000 uImage" >> boot.cmd
echo "ext2load mmc 0 0x60500000 vexpress-v2p-ca9.dtb" >> boot.cmd
echo "bootm 0x60003000 - 0x60500000" >> boot.cmd

sudo mkimage -C none -A arm -T script -d boot.cmd tmpfs/boot.scr
sudo cp linux/arch/arm/boot/uImage tmpfs
sudo cp linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb tmpfs
sudo cp -r root_nfs/share tmpfs

sudo umount tmpfs
sudo rm -rf tmpfs



sudo qemu-system-arm \
-sd a9rootfs.ext2 \
-M vexpress-a9 \
-m 512M \
-kernel u-boot/u-boot \
-serial stdio \
-net nic,vlan=0 \
-net tap,vlan=0,ifname=tap0