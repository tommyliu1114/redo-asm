# 远调用   

+ 远程调用call far function 等价于 push cs; push ip; jmp function 
+ 远程函数返回retf ，等价于调用pop ip; pop cs 
```asm
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


```

# 内中断 
# 内存布局
| 起始地址 | 结束地址 | 大小 | 用途 |
| ------  | ------- | ------ | ---- |
| `0x000` | `0x3FF` | 1KB | 中断向量表 | 
| `0x400` | `0x4FF` | 256B | BIOS数据区 | 
| `0x500` | `0x7BFF` | 29.75KB | 可用区域 | 
| `0x7C00` | `0x7DFF` | 512B | MBR加载区域 | 
| `0x7E00` | `09FBFF` | 607.6KB | 可用区域 | 
| `0x9FC00` | `0x9FFFF` | 1KB | 扩展BIOS数据区 | 
| `0xA0000` | `0xAFFFF` | 64KB | 用于彩色显示适配器 | 
| `0xB0000` | `0xB7FFF` | 32KB | 用于黑白显示适配器 | 
| `0xB8000` | `0xBFFFF` | 3KB | 用于文本显示适配器 | 
| `0xC0000` | `0x7FFF` | 32KB | 显示适配器BIOS | 
| `0xC8000` | `0xEFFFF` | 160KB | 映射内存 | 
| `0xF0000` | `0xFFFEF` | 64KB-16B | 系统BIOS | 
| `0xFFFF0` | `0xFFFFF` | 16B | 系统BIOS入口地址 | 
