#!/bin/bash

SOURCE_DIR="source"

KERNEL_NAME="linux-4.4.18"
BUSYBOX_NAME="busybox-1.25.0"
UBOOT_NAME="u-boot-2016.07"
KERNEL_FILE="$KERNEL_NAME.tar.xz"
BUSYBOX_FILE="$BUSYBOX_NAME.tar.bz2"
UBOOT_FILE="$UBOOT_NAME.tar.bz2"


echo "========begin extract source========="


rm -rf linux u-boot busybox
rm -rf $KERNEL_NAME $BUSYBOX_NAME $UBOOT_NAME

tar xf "$SOURCE_DIR/$KERNEL_FILE"
mv $KERNEL_NAME linux

tar xf "$SOURCE_DIR/$BUSYBOX_FILE"
mv $BUSYBOX_NAME busybox

tar xf "$SOURCE_DIR/$UBOOT_FILE"
mv $UBOOT_NAME u-boot


echo "========begin build u-boot========="

source ./build_boot.sh >/dev/null 2>&1

echo "========begin build kernel========="

source ./build_kernel.sh >/dev/null 2>&1


echo "========begin build busybox========="

source ./build_busybox.sh >/dev/null 2>&1



sudo cp tools/tftpd-hpa.cfg /etc/default/tftpd-hpa
sudo cp tools/qemu-ifup /etc
#sudo brctl addbr br0
#sudo brctl addif br0 ens33
#sudo ifconfig ens33 down
#sudo ifconfig ens33 0.0.0.0 promisc up
#sudo ifconfig br0 10.0.0.1 up
#sudo route add default gw 10.0.0.1 br0


