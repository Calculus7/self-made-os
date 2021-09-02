 [org 0x7c00]
 mov bx, message
 call print_string
 
 call print_nl

 mov bx, message2
 call print_string
 
 jmp $

%include "print_string.asm"

message:
  db 'testhellostring', 0
message2:
  db 'testhellostring2', 0

times 510-($-$$) db 0
dw 0xaa55
