#!/bin/bash
ps -A | grep qemu-system | awk '{print $1}' | xargs sudo kill -9 

qemu-system-aarch64 \
-machine virt \
-smp 2 \
-m 2048M \
-cpu cortex-a57 \
-machine type=virt \
-nographic \
-kernel arch/arm64/boot/Image \
-append "rdinit=/linuxrc console=ttyAMA0 loglevel=8" \
-S -s &

sleep 2
xfce4-terminal -e "eclipse"