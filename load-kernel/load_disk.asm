load_disk:
	pusha
	push dx

	mov ah, 0x02 ; ah=0x02 means read
	mov al, dh  ; al number of sctors to read
	mov ch, 0x00 ; ch cylinder
	mov dh, 0x00 ; dh head number
	mov cl, 0x02 ; 0x01 is boot sector. 0x02 is the second sector

	int 0x13 ; BIOS interrupt
	jc disk_error ; if the carry bit error jump to disk_error 

	pop dx
	cmp al, dh ; BIOS also set al to 
	jne disk_error
	popa
	ret

disk_error:
	call print_nl
	mov bx, DISK_ERROR_MESSAGE 
	call print_string
	call print_nl
	jmp $ 


DISK_ERROR_MESSAGE:
	db "Disk read error", 0
