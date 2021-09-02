 [org 0x7c00]

 mov bp, 0x8000
 mov sp, bp

 mov bx,0x9000 
 mov dh, 2
 call load_disk

 mov bx, 0x9000
 call print_string

 call print_nl

 mov bx, 0x9000 + 512
 call print_string
 jmp $

%include "print_string.asm"
%include "load_disk.asm"

test_message:
  db "test_message", 0

times 510-($-$$) db 0
dw 0xaa55

times 2 db 'A'
times 510 db 0
times 2 db 'B'
times 510 db 0
