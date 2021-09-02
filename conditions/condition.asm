  mov ax, 30
  cmp ax, 10
  jne a_block
  mov al, 'B'

  a_block:
    mov al, 'A'
    jmp the_end
  b_block:
    mov al, 'C'
    jmp the_end
  the_end:
    mov ah, 0x0e
    int 0x10
    jmp $
   
  times 510-($-$$) db 0
  dw 0xaa55
