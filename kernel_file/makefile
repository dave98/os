kernel.bin: kernel_entry.o kernel.o
	ld -o kernel.pe -Ttext 0x1000 -m i386pe kernel_entry.o kernel.o
	objcopy -O binary kernel.pe kernel.bin

kernel.o : kernel.c
	gcc -m32 -ffreestanding -c kernel.c -o kernel.o

kernel_entry.o: kernel_entry.asm
	nasm kernel_entry.asm -f elf -o kernel_entry.o
