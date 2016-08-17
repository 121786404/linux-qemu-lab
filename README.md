1. 	安装必要的包

	sudo apt-get install qemu-system-arm libncurses5-dev bc ddd

	https://releases.linaro.org/components/toolchain/binaries/latest-5/aarch64-linux-gnu/gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz

2. 下载源码(放到source文件夹)

	https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.4.16.tar.xz

	http://busybox.net/downloads/busybox-1.25.0.tar.bz2

	ftp://ftp.denx.de/pub/u-boot/u-boot-2016.07.tar.bz2


3.  开启网络支持(可选)

	sudo apt-get install uml-utilities bridge-utils


	修改  /etc/network/interfaces ，增加虚拟网卡


	auto lo
	iface lo inet loopback

	auto ens33

	iface ens33 inet manual  # if not ,host's network can't work

	auto br0

	iface br0 inet dhcp

	bridge_ports ens33

	bridge_stp off



	修改 /etc/exports 添加
 	/home *(rw,sync,no_root_squash,no_subtree_check)

4. 	运行init.sh,解压编译源代码

	运行run.sh            nfs启动

	运行run-disk.sh       SD卡启动

	运行run-disk-net.sh   SD卡启动，开启qemu网络支持

	//运行run_boot          进入uboot


5. 	TODO
	目前还没有实现uboot烧写和引导kernel




参考文章：

[用Qemu模拟vexpress-a9 （一） --- 搭建Linux kernel调试环境](http://www.cnblogs.com/pengdonglin137/p/5023342.html)

[用Qemu模拟vexpress-a9 （二） --- 搭建u-boot调试环境](http://www.cnblogs.com/pengdonglin137/p/5023608.html)

[用Qemu模拟vexpress-a9 （三）--- 实现用u-boot引导Linux内核](http://www.cnblogs.com/pengdonglin137/p/5023704.html)

[用Qemu模拟vexpress-a9 （四） --- u-boot引导kernel，用nfs挂载根文件系统](http://www.cnblogs.com/pengdonglin137/p/5023875.html)

[用Qemu模拟vexpress-a9 （五） --- u-boot引导kernel，device tree的使用](http://www.cnblogs.com/pengdonglin137/p/5023961.html)

[用Qemu模拟vexpress-a9 （六） --- 多核](http://www.cnblogs.com/pengdonglin137/p/5023987.html "")

[用Qemu模拟vexpress-a9 （七） --- 嵌入式设备上安装telnet服务](http://www.cnblogs.com/pengdonglin137/p/5028802.html)

[用Qemu模拟vexpress-a9 --- 配置 qemu 的网络功能](http://www.cnblogs.com/pengdonglin137/p/5023340.html)