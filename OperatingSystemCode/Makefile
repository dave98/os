
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

OBJ = ${_SOURCES:.c =.o}

all: os-image

run: all
	bochs

os-image: boot/boot_sect.bin kernel/kernel.bin
	cat $^ > os-image

kernel/kernel.bin : kernel/kernel_entry.o kernel/kernel.o
	ld -o $@ -Ttext 0x1000 $^ --oformat binary -m elf_i386

kernel/%.o : kernel/%.c ${HEADERS}
	gcc -m32 -ffreestanding -c $^ -o $@

kernel/%.o : kernel/%.asm
	nasm $^ -f elf -o $@

boot/%.bin : boot/%.asm
	nasm $^ -f bin -o $@

clean :
	rm -fr kernel/*.o kernel/*.bin boot/*.bin drivers/*.o os-image
