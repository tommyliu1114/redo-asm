[org 0x7c00]

mov ax,3
int 0x10; 设置文本显示模式
xchg bx,bx

mov ax,0
mov ds,ax 
mov ss,ax
mov sp,0x7c00
; 开始注册中断
mov word [0*4],div_err 
mov word [0*4 + 2],0  
; 注册中断结束

mov dx,0
mov ax,1
mov bx,0 
div bx  
; dx:ax / bx 
; 除法分子为0 ， 触发中断 ;做了3件事情   push flag; ; push cs ; push ip;

halt:
    jmp halt

div_err:
    ; 负责保护现场，保存下当前的寄存器到堆栈
    push ax
    push bx 
    push es 
    ; 保存现场完毕
    mov ax, 0xb800
    mov es,ax 

    mov bx, [video]
    mov byte [es:bx],'/'
    add word [video],2 
    ;从堆栈中恢复现场
    pop es
    pop bx
    pop ax 
    ;
    iret;  pop ip; pop cs ; pop flag;



video:
    dw 0x0



times 510-($-$$) db 0
db 0x55,0xaa 