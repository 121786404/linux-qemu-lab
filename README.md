0.  下载代码
	
	git clone --recursive https://github.com/121786404/linux-qemu-lab

1. 	安装必要的包

	sudo apt-get install -y gcc-arm-linux-gnueabi gdb-arm-none-eabi qemu-system-arm libncurses5-dev bc  nfs-kernel-server tftpd-hpa u-boot-tools uml-utilities bridge-utils
	sudo apt-get install ddd eclipse-cdt
	

2. 	运行init.sh,解压编译源代码

	运行build.sh编译

	运行:run.sh
	调试:run-debug.sh 使用ddd
	调试:run-debug.sh 使用eclipse