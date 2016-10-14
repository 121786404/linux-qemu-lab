#!/bin/bash



echo "========begin build u-boot========="

source ./build_uboot.sh >/dev/null 2>&1


echo "========begin build kernel========="

source ./build_linux.sh >/dev/null 2>&1


echo "========begin build busybox========="

source ./build_busybox.sh >/dev/null 2>&1

pwd
sudo cp tools/tftpd-hpa.cfg /etc/default/tftpd-hpa



