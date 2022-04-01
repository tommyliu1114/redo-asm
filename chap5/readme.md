# 命令
make type.bin 
# 类型：
- db 100
- dw 0xaa55
- dd 0x12345678
- db "hello "

# 例子
```asm
db 100; define byte 
dw 0xaa55; define two byte 
dd  0x12345678; define four byte 

db "hello world!!!" ,12,13; define string 

```