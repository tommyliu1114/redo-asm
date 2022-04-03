[org 0x7c00]

mov ax,3
int 0x10; 设置文本显示模式
xchg bx,bx

mov ax,0
mov ss,ax
mov sp,0x7c00


call 0:print ;远调用  push cs; push ip

halt:
    jmp halt

print:
    ; 负责保护现场，保存下当前的寄存器到堆栈
    push ax
    push bx 
    push es 
    ; 保存现场完毕
    mov ax, 0xb800
    mov es,ax 

    mov bx, [video]
    mov byte [es:bx],'K'
    add word [video],2 
    ;从堆栈中恢复现场
    pop es
    pop bx
    pop ax 
    ;
    retf ;pop ip; pop cs 



video:
    dw 0x0


times 510-($-$$) db 0
db 0x55,0xaa 