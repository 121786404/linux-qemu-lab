#!/bin/bash

cd u-boot
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-

make distclean
git checkout include/configs/vexpress_common.h
sed -i '/\#endif \/\* VEXPRESS_COMMON_H \*\// i \
#undef CONFIG_BOOTCOMMAND \
#define CONFIG_IPADDR		10.0.0.2 \
#define CONFIG_SERVERIP		10.0.0.1 \
#define CONFIG_BOOTCOMMAND	"tftp 0x60003000 linux-qemu-lab-arm/image/uImage;tftp 0x60500000 linux-qemu-lab-arm/image/vexpress-v2p-ca9.dtb;bootm 0x60003000 - 0x60500000" \
#define CONFIG_BOOTARGS	    "init=/linuxrc user_debug=0xff earlyprintk console=ttyAMA0,115200 root=/dev/mmcblk0 rw rootwait" \
' include/configs/vexpress_common.h

make vexpress_ca9x4_defconfig
make
cp u-boot ../image/u-boot


make distclean
git checkout include/configs/vexpress_common.h
sed -i '/\#endif \/\* VEXPRESS_COMMON_H \*\// i \
#undef CONFIG_BOOTCOMMAND \
#define CONFIG_IPADDR		10.0.0.2 \
#define CONFIG_SERVERIP		10.0.0.1 \
#define CONFIG_BOOTCOMMAND	"tftp 0x60003000 linux-qemu-lab-arm/image/uImage;tftp 0x60500000 linux-qemu-lab-arm/image/vexpress-v2p-ca9.dtb;bootm 0x60003000 - 0x60500000" \
#define CONFIG_BOOTARGS	    "init=/linuxrc user_debug=0xff kgdboc=ttySAC0,115200 kgdbwait root=/dev/mmcblk0 rw rootwait" \
' include/configs/vexpress_common.h

make vexpress_ca9x4_defconfig
make
cp u-boot ../image/u-boot-d


../tools/collect-src -f "u-boot" -o ../u-boot_src.list
cd ..