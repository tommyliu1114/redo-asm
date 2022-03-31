# 命令
- 汇编器材：
nasm hello.asm -o hello.bin 
- 虚拟机：
sudo apt install bochs 
sudo apt-get install bochs-sdl 
sudo apt-get install bochs-x 
- 生成配置虚拟机：
bochs -q
- 配置虚拟机：
    + display_library: x,options="gui_debug"
    + 
- bximage 生成配置硬盘
    + 生成的配置如下：  ata0-master: type=disk, path="master.img", mode=flat   
    + boot: disk   
- 将代码写入硬盘镜像：
dd if=hello.bin of=master.img bs=512 count=1 conv=notrunc

- 安装qemu： sudo apt-get install qemu  && sudo apt install qemu-utils

- 执行qemu转换命令： qemu-img convert -O vmdk master.img master.vmdk ,这个格式用于vmware虚拟机
- 执行qemu转换命令： qemu-img convert -O vdi master.img master.vdi ,这个命令用于生成virtualbox虚拟机的磁盘镜像