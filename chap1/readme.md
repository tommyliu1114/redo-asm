# 命令
- 汇编器材：
nasm hello.asm -o hello.bin 
- 虚拟机：
sudo apt install bochs 
sudo apt-get install bochs-sdl 
- 生成配置虚拟机：
bochs -q
- 配置虚拟机：
    + display_library: x,options="gui_debug"
    + 
- bximage 生成配置硬盘
    + 生成的配置如下：  ata0-master: type=disk, path="master.img", mode=flat   
    + boot: disk   
