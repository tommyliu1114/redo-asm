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
# 函数调用：
+ call：将ip压栈
+ ret：将栈顶弹出到ip寄存器
```asm
mov ax,0
mov ss,ax
mov sp,0x7c00


mov cx,20
loop1:
    call print ; 相当于两条指令：push ip ； jmp print 
    loop loop1

halt:
    jmp halt

print:
    mov ax, 0xb800
    mov es,ax 

    mov bx, [video]
    mov byte [es:bx],'.'
    add word [video],2 
    ret ； 相当于指令pop ip; 将栈顶弹出到ip寄存器



video:
    dw 0x0
```