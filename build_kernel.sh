#!/bin/bash


cd linux
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
#export INSTALL_MOD_PATH=images
#cp ../tools/my_vexpress_config .config
#
git checkout arch/arm/configs/vexpress_defconfig
make vexpress_defconfig
cp arch/arm/configs/vexpress_defconfig ../tools
cp .config ../tools/vexpress_config

cp ../tools/my_vexpress_defconfig arch/arm/configs
make my_vexpress_defconfig
cp .config ../tools/my_vexpress_config

make zImage -j4
make  LOADADDR=0x60003000 uImage
#make zImage -j4 V=1 > build_image.log
make modules
#make modules_install
make dtbs
cp arch/arm/boot/uImage ../image
cp arch/arm/boot/zImage ../image
cp arch/arm/boot/dts/vexpress-v2p-ca9.dtb ../image
#arm-linux-gnueabi-objdump -j .head.text -d -Sl vmlinux > head.dis
arm-linux-gnueabi-objdump -j .head.text -j .init.text -d vmlinux > head.dis
../tools/collect-src -f "linux" -o ../linux_src.list
cd ..
