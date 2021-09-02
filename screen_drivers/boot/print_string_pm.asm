[bits 32]
; 主要逻辑从内存中读取字符，放到al, 输出属性，放到ah,。然后把这两个设置到 edx的对应的
;内存中。edx对应的内存就是map的屏幕的
;注意这里的寄存器ebx，是bx的扩展，是16bit扩展过来的是32位
VIDEO_MEMORY equ 0xb8000 ; define some constants
WHITE_ON_BLACK equ 0x08  ; white color

print_string_pm:
  pusha
  mov edx, VIDEO_MEMORY ;set edx to the start of vid mem

print_string_pm_loop:
    mov al, [ebx] ; 设置 地址ebx内存取的字符到al
    mov ah, WHITE_ON_BLACK ; 在ah找设置字符输出颜色属性
    
    cmp al, 0  ; 如果 al内没有字符了，也就是字符串结束了，退出
    je done
    
    mov [edx], ax ; ax 即ah + al
    add ebx, 1 ;移到下一个地址的字符
    add edx, 2 ; 两个 按照前的表述，一个字符两个字节
    jmp print_string_pm_loop

done:
    popa
    ret

