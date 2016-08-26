#!/bin/bash

cd u-boot
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
cp ../tools/vexpress_common.h include/configs/vexpress_common.h
make vexpress_ca9x4_defconfig
make
cp u-boot ../image/u-boot
../tools/collect-src -f "u-boot" -o ../boot_src.list
cp ../tools/vexpress_common_debug.h include/configs/vexpress_common.h
make vexpress_ca9x4_defconfig
make
cp u-boot ../image/u-boot-d
cd ..