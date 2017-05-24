#!/bin/bash
#
# mkfs.sh rootdir fstype
#
#!/bin/bash
#
sudo rm -f a9rootfs.ext2
dd if=/dev/zero of=a9rootfs.ext2 bs=1M count=32
sudo mkfs.ext2 a9rootfs.ext2
sudo rm -rf tmpfs
mkdir -p tmpfs
sudo mount -t ext2 a9rootfs.ext2 tmpfs -o loop
sudo cp -raf busybox/_install/*  tmpfs
cp tools/root_fs_patch/* tmpfs -rd
sudo cp -r root_nfs/share tmpfs
sudo umount tmpfs
sudo rm -rf tmpfs