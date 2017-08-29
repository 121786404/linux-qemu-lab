0.  下载代码
	
	git clone --recursive https://github.com/121786404/linux-qemu-lab

1. 	安装必要的包

	sudo apt-get install -y qemu-system-arm libncurses5-dev bc nfs-kernel-server tftpd-hpa u-boot-tools uml-utilities bridge-utils
	sudo apt-get install ddd eclipse-cdt dos2unix enconv
	
2. 安装编译器

http://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/aarch64-linux-gnu/gcc-linaro-5.4.1-2017.05-x86_64_arm-linux-gnueabi.tar.xz
http://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/arm-linux-gnueabi/gcc-linaro-5.4.1-2017.05-x86_64_aarch64-linux-gnu.tar.xz

3. 	运行init.sh,解压编译源代码

	运行build.sh编译

	运行:run.sh
	调试:run-debug.sh 使用eclipse
	调试:run-debug2.sh 使用arm-none-eabi-gdb
	调试:run-debug3.sh 使用ddd

	
4 eclipse 设置

window preferences Gereral Workspace  Build automatically 去掉
									 C/C++   Indexer    Enable indexer 去掉
									 
Main
	Disbale auto build						