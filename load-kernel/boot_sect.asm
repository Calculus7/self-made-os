[org 0x7c00]
KERNEL_OFFSET equ 0x1000   ;kernel的指令内容将会load到这里
mov [BOOT_DRIVE], dl ; 把dl中存取的boot drive 存到内存。
mov bp, 0x9000   ;设置好栈的内存空间地址
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string
call print_nl
call load_kernel   ;load kernel 
call switch_to_pm

 jmp $

%include "print_string.asm"
%include "load_disk.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch.asm"

[bits 16]

load_kernel:
    mov bx, MSG_LOAD_KERNEL   ;示意在loading kernel
    call print_string

    ;给load_disk设置参数
    mov bx, KERNEL_OFFSET  ;读到内存0x1000地址以后的内存，注意我们在编译的时候也是这么设置的
    mov dh, 2  ;读2个sector 这里2是一个保证可以读完kernel的数字，其他能保证读完的也可以
    mov dl, [BOOT_DRIVE]   ; 把boot drive重新保存到dl，
    call load_disk

    ret

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PORT_MODE
    call print_string_pm
    call KERNEL_OFFSET

    jmp $


BOOT_DRIVE   db 0
MSG_REAL_MODE db "000 16-bit real mode", 0
MSG_PORT_MODE db "111 32-bit protected mode", 0
MSG_LOAD_KERNEL db  "loading your own kernel into memory", 0

times 510-($-$$) db 0
dw 0xaa55