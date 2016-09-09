#!/bin/bash

cd busybox
git checkout master -f
git pull

sudo make distclean

make defconfig ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-
sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config
make install ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-
../tools/collect-src -f "busybox" -o ../busybox_src.list

cd _install


mkdir proc sys tmp root var mnt dev lib

cp ../../tools/root_fs_patch/* . -rd
cp /opt/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabi/arm-linux-gnueabi/libc/lib/*.so* lib -d

arm-linux-gnueabi-strip lib/*


sudo mknod dev/tty1 c 4 1
sudo mknod dev/tty2 c 4 2
sudo mknod dev/tty3 c 4 3
sudo mknod dev/tty4 c 4 4
sudo mknod dev/console c 5 1
sudo mknod dev/null c 1 3


cd ../..

