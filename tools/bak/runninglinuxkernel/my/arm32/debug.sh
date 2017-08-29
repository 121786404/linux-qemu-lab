#!/bin/bash
ps -A | grep qemu-system | awk '{print $1}' | xargs sudo kill -9 

qemu-system-arm \
-M vexpress-a9 \
-smp 4 \
-m 1024M \
-kernel arch/arm/boot/zImage \
-append "rdinit=/linuxrc console=ttyAMA0 loglevel=8" \
-dtb arch/arm/boot/dts/vexpress-v2p-ca9.dtb \
-nographic \
-S -s &

sleep 2
xfce4-terminal -e "eclipse"