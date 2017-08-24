#!/bin/bash
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
cd linux
make distclean
make defconfig
make -j4
../tools/collect-src -f "linux" -o ../linux_src_aarch64.list