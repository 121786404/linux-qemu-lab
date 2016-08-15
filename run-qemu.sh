#!/bin/bash

#-gui
#-gui -net
#-gui -net -nfs

#-net -gui -nfs
net=false
gui=false
boot_disk=true
debug=false

for opt in "$@"
do
    case "$opt" in
    -net)
			net=true
            ;;
    -nfs)
			boot_disk=false
            ;;
    -disk)
            boot_disk=true
            ;;
    -gui)
            gui=true
            ;;
    -d)
            debug=true
            ;;         
    *)
            echo "Unknown Option $opt"
            exit 1
    esac
done

#echo $net
#echo $gui
#echo $boot_disk
#exit

if $gui ; then
	echo ""
else
	QEMU_GUI_OPT="-nographic"
fi

if $net ; then
	QEMU_NET_OPT="-net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=qemu-ifup"
fi

if $boot_disk ; then
	if $gui ; then
		QEMU_ROOT="init=/linuxrc root=/dev/mmcblk0 rw rootwait"
	else
		QEMU_ROOT="init=/linuxrc console=ttyAMA0 root=/dev/mmcblk0 rw rootwait"
	fi
	QEMU_SD="-sd a9rootfs.ext3"
else
	if $gui ; then
		QEMU_ROOT="/dev/nfs nfsroot=10.0.0.1:/home/sheldon.liu/linux-qemu-lab/root_nfs rw ip=10.0.0.2:10.0.0.1:10.0.0.1:255.255.255.0 "
	else
		QEMU_ROOT="/dev/nfs console=ttyAMA0 nfsroot=10.0.0.1:/home/sheldon.liu/linux-qemu-lab/root_nfs rw ip=10.0.0.2:10.0.0.1:10.0.0.1:255.255.255.0 "
	fi
fi

if $boot_disk;then
	echo "boot disk"
	sudo rm -f a9rootfs.ext3
	dd if=/dev/zero of=a9rootfs.ext3 bs=1M count=32
	mkfs.ext3 a9rootfs.ext3
	sudo rm -rf tmpfs
	mkdir -p tmpfs
	sudo mount -t ext3 a9rootfs.ext3 tmpfs -o loop
	sudo cp -raf busybox/_install/*  tmpfs
	
	if $net;then
		echo "with net"
	else
		sudo cp -r root_nfs/share tmpfs
		sudo rm -rf tmpfs/mount_nfs.sh
	fi
	sudo umount tmpfs
	sudo rm -rf tmpfs

else
	echo "boot nfs with net"	
	sudo cp -raf busybox/_install/*  root_nfs
	sudo rm -rf root_nfs/mount_nfs.sh
fi


QEMU_COMMON_OPT="-M vexpress-a9 -m 512M -smp 4 -kernel linux/arch/arm/boot/zImage -dtb linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb"



if $debug ; then
	sudo qemu-system-arm  $QEMU_SD $QEMU_COMMON_OPT -append "$QEMU_ROOT" $QEMU_GUI_OPT $QEMU_NET_OPT -S -s &
	sleep 2
	#gnome-terminal -e "arm-linux-gnueabi-gdb -q -tui -x gdbinit"
	gnome-terminal -e "cgdb -d arm-linux-gnueabi-gdb -x tools/gdbinit"
else
	sudo qemu-system-arm  $QEMU_SD $QEMU_COMMON_OPT -append "$QEMU_ROOT" $QEMU_GUI_OPT $QEMU_NET_OPT
fi


#sudo qemu-system-arm -sd a9rootfs.ext3 \
#-M vexpress-a9 \
#-m 512M \
#-smp 4 \
#-kernel linux/arch/arm/boot/zImage \
#-dtb linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb \
#-append "/dev/nfs nfsroot=10.0.0.1:/home/sheldon.liu/linux-qemu-lab/root_nfs rw ip=10.0.0.2:10.0.0.1:10.0.0.1:255.255.255.0" \
#-net nic,vlan=0 \
#-net tap,vlan=0,ifname=tap0,script=qemu-ifup \
#-S -s