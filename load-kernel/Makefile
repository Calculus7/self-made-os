all: os-image.bin

os-image.bin: boot_sect.bin kernel.bin
	cat $^ > os_image.bin

boot_sect.bin: boot_sect.asm
	nasm -f bin $< -o $@

kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

kernel.o : kernel.c
	i386-elf-gcc -ffreestanding -c $< -o $@

kernel_entry.o : kernel_entry.asm
	nasm $< -f elf -o $@ 

clean:
	rm *.bin *.o