
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)
OBJ = ${C_SOURCES:.c=.o}

CP := cp
RM := rm -rf
MKDIR := mkdir -pv

BIN = kernel.bin
CFG = grub.cfg
ISO_PATH := iso
BOOT_PATH := $(ISO_PATH)/boot
GRUB_PATH := $(BOOT_PATH)/grub

.PHONY: all
all: bootloader linker iso


bootloader: boot/boot.asm
	nasm -f elf32 boot/boot.asm -o boot/boot.o

%.o : %.c ${HEADERS}
	gcc -m32 -c $< -o $@

linker: linker.ld boot/boot.o ${OBJ}
	ld -m elf_i386 -T linker.ld -o $(BIN) boot/boot.o ${OBJ}


iso:$(BIN) 
	$(MKDIR) $(GRUB_PATH)
	$(CP) $(BIN) $(BOOT_PATH)
	$(CP) $(CFG) $(GRUB_PATH)
	grub-file --is-x86-multiboot $(BOOT_PATH)/$(BIN)
	grub-mkrescue -o my-kernel.iso $(ISO_PATH)

.PHONY: clean
clean:
	rm -rf kernel/*.o boot/*.o drivers/*.o
	rm -rf $(BIN)
	rm -rf $iso

