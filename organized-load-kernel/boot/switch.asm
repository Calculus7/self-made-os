[bits 16]
switch_to_pm:
    cli  ;告诉CPU在模式切换回来之前回忽略所有中断请求
    lgdt [gdt_descriptor] ;load GDT gdt_descriptor定义在gtd.asm中
    
    mov eax, cr0
    or eax, 0x1  ;这样只是把第一个bit设置为1， 不影响其他bit
    mov cr0, eax 

    jmp CODE_SEG:init_pm  ;跳转到code segment的init_pm 

[bits 32] 
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp
    call BEGIN_PM

