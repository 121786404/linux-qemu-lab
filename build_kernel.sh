#!/bin/bash


cd linux
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
#export INSTALL_MOD_PATH=images
cp ../my_vexpress_config .config

#make vexpress_defconfig
#sed -i 's/.*CONFIG_DEBUG_KERNEL.*/CONFIG_DEBUG_KERNEL=y/' .config
#sed -i "s/.*CONFIG_EARLY_PRINTK.*/CONFIG_EARLY_PRINTK=y/" .config
##sed -i 's/.*CONFIG_DEBUG_INFO.*/CONFIG_DEBUG_INFO=y/' .config
#sed -i "s/.*CONFIG_READABLE_ASM.*/CONFIG_READABLE_ASM=y/" .config
##sed -i "s/.*CONFIG_DEBUG_LL .*/CONFIG_DEBUG_LL=y/" .config
#sed -i 's/.*CONFIG_DEBUG_RODATA.*/CONFIG_DEBUG_RODATA=n/' .config
#sed -i 's/.*CONFIG_FRAME_POINTER.*/CONFIG_FRAME_POINTER=y/' .config
##sed -i 's/.*CONFIG_KALLSYMS.*/CONFIG_KALLSYMS=y/' .config
#sed -i 's/.*CONFIG_KALLSYMS_ALL.*/CONFIG_KALLSYMS_ALL=y/' .config
#sed -i 's/.*CONFIG_DEBUG_SET_MODULE_RONX.*/CONFIG_DEBUG_SET_MODULE_RONX=n/' .config
##sed -i 's/.*CONFIG_MAGIC_SYSRQ.*/CONFIG_MAGIC_SYSRQ=y/' .config
#sed -i "s/.*CONFIG_DEBUG_VEXPRESS_UART0_CA9.*/CONFIG_DEBUG_VEXPRESS_UART0_CA9=y/" .config
#
#
#
#sed -i 's/.*CONFIG_KGDB.*/CONFIG_KGDB=y/' .config
#sed -i 's/.*CONFIG_KGDB_SERIAL_CONSOLE.*/CONFIG_KGDB_SERIAL_CONSOLE=y/' .config
#sed -i 's/.*CONFIG_CONSOLE_POLL.*/CONFIG_CONSOLE_POLL=y/' .config
#sed -i 's/.*CONFIG_MAGIC_SYSRQ.*/CONFIG_MAGIC_SYSRQ=y/' .config
#
#sed -i 's/.*CONFIG_KGDB_KDB.*/CONFIG_KGDB_KDB=y/' .config
#sed -i 's/.*CONFIG_KDB_KEYBOARD.*/CONFIG_KDB_KEYBOARD=y/' .config

make zImage -j4
#make zImage -j4 V=1 > build_image.log
make modules
#make modules_install
make dtbs
#arm-linux-gnueabi-objdump -j .head.text -d -Sl vmlinux > head.dis
arm-linux-gnueabi-objdump -j .head.text -j .init.text -d vmlinux > head.dis
../tools/collect-src -f "linux" -o ../linux_src.list
cd ..
