cd u-boot
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
make vexpress_ca9x4_defconfig
make
../tools/collect-src -f "u-boot" -o ../boot_src.list
cd ..