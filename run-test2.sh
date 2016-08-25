#!/bin/bash



sudo rm -f a9rootfs.ext2
dd if=/dev/zero of=a9rootfs.ext2 bs=1M count=64
mkfs.ext2 a9rootfs.ext2
sudo rm -rf tmpfs
mkdir -p tmpfs
sudo mount -t ext2 a9rootfs.ext2 tmpfs -o loop
sudo cp -raf busybox/_install/*  tmpfs
sudo cp linux/arch/arm/boot/uImage tmpfs
sudo cp linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb tmpfs
sudo cp -r root_nfs/share tmpfs

sudo umount tmpfs
sudo rm -rf tmpfs



sudo qemu-system-arm
-sd a9rootfs.ext2 \
-M vexpress-a9 \
-m 512M \
-kernel u-boot/u-boot \
-serial stdio