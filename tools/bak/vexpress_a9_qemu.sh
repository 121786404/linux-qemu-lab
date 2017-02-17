#!/bin/bash

make distclean

make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm O=./out_vexpress_3_14  vexpress_defconfig

make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm O=./out_vexpress_3_14  zImage -j2

make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm O=./out_vexpress_3_14 LOADADDR=0x60003000  uImage -j2

make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm O=./out_vexpress_3_14 INSTALL_MOD_PATH=../modules_install modules -j8

make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm O=./out_vexpress_3_14 INSTALL_MOD_PATH=../modules_install modules_install -j8
