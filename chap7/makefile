%.bin: %.asm
	nasm $<  -o $@
master.img: boot.bin

	bximage -q -mode=create -hd=16M -sectsize=512 $@

	dd if=$< of=$@ bs=512 count=1 conv=notrunc

.PHONY:bochs
bochs: master.img 
	bochs -q -unlock
.PHONY:clean
clean: 
	rm -rf *.bin 
	rm -rf *.img 
	rm *.ini
	rm  *.lock 