;GDT
gdt_start: ;只是标识开始位置

gdt_null:   ; 这是一个全空的 segment descriptor,CPU要求GDT中的第一个入口是全空的null descriptor
    dd 0x0   ; dd 指 define double words 4个字节长
    dd 0x0   ; 这两个指令，一共 8个字节长

gdt_code:  ; code segment descriptor
    ; base=0x0, limit=0xfffff.这里仔细参考segment descriptor的结构。
    ; 一共8bytes，
    dw 0xffff  ; limit的0~15bit) 8bytes中的 0~15bit
    dw 0x0   ; Base的0~15bit) 8bytes中的的16~31
    db 0x0   ; Base的16~23bit) 8bytes的32~39
    db 10011010b  ;1010表示type, 1 表示 CODE segment 00表示 privililege level. 1 表示 segment present
    db 11001111b   ;
    db 0x0   ; base的bit 24~31

gdt_data:
    dw 0xffff  ;
    dw 0x0
    db 0x0
    db 10010010b  ;和code descriptor的唯一区别就是code segment 为0
    db 11001111b
    db 0x0  

gdt_end:

gdt_descriptor:  ;定义GDT 6bytes
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start  ;定义两个变量只是为了方便后面使用
DATA_SEG equ gdt_data - gdt_start
