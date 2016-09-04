#./qemu-system-mini2440 -M-kernel zImage.integrator -initrd arm_root.img
#./qemu-system-mini2440 -kernel zImage -initrd arm_root.img -append "console=ttyAMA0"
#./qemu-system-mini2440 -M mini2440 -serial stdio -mtdblock u-boot.bin
./qemu-system-mini2440 -M mini2440 -kernel uImage -mtdblock u-boot.bin -serial stdio -net nic,vlan=0 -net tap,vlan=0,ifname=tap0 -usb -usbdevice keyboard -usbdevice mouse -show-cursor 