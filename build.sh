#!/bin/bash



echo "========begin build u-boot========="

source ./build_uboot.sh


echo "========begin build kernel========="

source ./build_linux.sh


echo "========begin build busybox========="

source ./build_busybox.sh

pwd
sudo cp tools/tftpd-hpa.cfg /etc/default/tftpd-hpa



