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

# -serial stdio   ͼ�ν���������ʹ�ã�ע�⻹Ҫ�޸� -append ����Ϊ "root=/dev/mmcblk0 console=ttyAMA0 console=tty0"
# -smp 4          4 ��cpu
# -dtb xxx        �����豸������
