#!/bin/bash



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


