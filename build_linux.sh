#!/bin/bash



cd linux
#export ARCH=i386
export ARCH=x86_64
export CROSS_COMPILE=
make distclean
#cp ../tools/my_i386_defconfig arch/x86/configs
#make my_i386_defconfig
cp ../tools/my_x86-64_defconfig arch/x86/configs
make my_x86-64_defconfig
make -j4
../tools/collect-src -f "linux" -o ../linux_src.list
cd ..
