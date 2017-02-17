#!/bin/bash

sudo qemu-system-arm \
    -M vexpress-a9 \
    -m 512M \
    -kernel ./out_vexpress_3_14/arch/arm/boot/zImage \
    -net nic,vlan=0 -net tap,vlan=0,ifname=tap0 \
    -nographic \
    -append "root=/dev/mmcblk0  console=ttyAMA0" \
    -sd ./a9rootfs.ext3 \
    -smp 4

# -serial stdio   图形界面的情况下使用，注意还要修改 -append 参数为 "root=/dev/mmcblk0 console=ttyAMA0 console=tty0"
# -smp 4          4 个cpu
# -dtb xxx        传递设备树参数
