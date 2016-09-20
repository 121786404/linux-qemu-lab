#!/bin/bash

cd linux
make distclean
cp ../tools/my_i386_defconfig arch/x86/configs
make my_i386_defconfig
make -j4
cd ..
