#./qemu-system-mini2440 -M-kernel zImage.integrator -initrd arm_root.img
./qemu-system-mini2440 -kernel zImage -initrd arm_root.img -append "console=ttyAMA0"
