# 堆栈和函数
+ 程序的地址为cs:ip决定 
+ 堆栈的栈顶指针为ss:sp 
# 堆栈的操作：
+ push
+ pop 
```asm
mov ax,0
mov ss,ax
mov sp,0x7c00

push byte 4 ; push进了2个字节
push dword 7 ; push进了4个字节
push word 5 ; push进了两个字节

pop ax
pop bx
pop cx 
pop dx 
```