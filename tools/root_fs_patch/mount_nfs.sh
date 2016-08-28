ifconfig eth0 10.0.0.2
mkdir -p share
mount -t nfs -o nolock 10.0.0.1:/home/sheldon.liu/linux-qemu-lab/root_nfs/share   /share
