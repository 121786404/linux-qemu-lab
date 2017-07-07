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
mkdir -p tmpfs/system/modules
sudo mount -t ext2 a9rootfs.ext2 tmpfs -o loop
sudo cp -raf busybox/_install/*  tmpfs
sudo cp tools/root_fs_patch/* tmpfs -rd
#mkdir -p tmpfs/system/modules
find linux/.modules/lib/modules/*/kernel -name *.ko | xargs -i cp {} tmpfs/system/modules
sudo umount tmpfs
sudo rm -rf tmpfs