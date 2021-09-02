[org 0x7c00]
mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string
call switch_to_pm

 jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "switch.asm"
%include "print_string_pm.asm"

BEGIN_PM:
    mov ebx, MSG_PORT_MODE
    call print_string_pm

    jmp $

MSG_REAL_MODE db "16-bit real mode", 0
MSG_PORT_MODE db "111 32-bit protected mode", 0

times 510-($-$$) db 0
dw 0xaa55